# Pipeline Snakemake — Exercice 3, Jour 4

Pipeline **réel et testé** : FastQC → Fastp → FastQC → Kraken2 [→ Bracken] [→ Krona] → MultiQC.

```
data/raw/{sample}_R1.fastq.gz ┐
data/raw/{sample}_R2.fastq.gz ┘→ fastqc_raw
                               → fastp → fastqc_clean
                                       → kraken2 → bracken (optionnel)
                                                 → krona   (optionnel)
                               → multiqc (rapport consolidé)
```

## Démarrage rapide (données factices fournies)

```bash
cd pipeline/
snakemake -n --cores 2        # dry-run : affiche le plan d'exécution sans rien lancer
snakemake --cores 2           # exécution réelle (~10 secondes avec les données de test)
```

Résultats produits dans `results/` :
- `results/fastqc_raw/`, `results/fastqc_clean/` — rapports FastQC avant/après nettoyage
- `results/fastp/` — reads nettoyés + rapport JSON/HTML
- `results/kraken2/` — rapport et classification taxonomique
- `results/multiqc/multiqc_report.html` — **rapport consolidé unique**, le plus utile pour une première lecture

Ce pipeline a été **exécuté avec succès de bout en bout** dans l'environnement de préparation de cette formation (fastp 0.23.4, FastQC 0.12.1, Kraken2 2.1.3, MultiQC 1.35, Snakemake 9.25.2) — ce n'est pas un squelette théorique, chaque règle a été validée avec de vraies commandes sur les données factices du dépôt.

## La mini-base Kraken2 de test (`test_kraken2_db/`)

Le dossier `test_kraken2_db/` contient une base Kraken2 **minuscule et entièrement factice** (une seule séquence de référence de 2000 pb, taxonomie manuelle à 2 entrées), construite spécifiquement pour que ce pipeline soit **exécutable de bout en bout sans connexion internet et sans la base de données réelle**. Elle ne sert qu'à valider la mécanique du pipeline — attendez-vous à ~0 % de reads classifiés, c'est normal (les données factices du Jour 2 sont générées aléatoirement, sans lien avec cette référence).

## Passer aux données et à la base réelles (sur le serveur INSP)

1. Modifier `config.yaml` :
   ```yaml
   samples:
     - "vrai_echantillon_1"
     - "vrai_echantillon_2"
   raw_dir: "/chemin/vers/donnees/reelles"
   kraken2_db: "/data/db/kraken2_standard"   # base officielle du serveur INSP
   run_bracken: true   # si bracken est installé (bioconda) sur le serveur
   run_krona: true      # si KronaTools est installé sur le serveur
   ```
2. Relancer : `snakemake --cores 8 --use-conda` (le `--use-conda` crée automatiquement les environnements définis dans `envs/` — utile si les outils ne sont pas déjà installés globalement sur le serveur).

## Étendre à plusieurs échantillons (exercice "5 échantillons" du Jour 3)

Il suffit d'ajouter les identifiants dans `config.yaml` :
```yaml
samples: ["sample1", "sample2", "sample3", "sample4", "sample5"]
```
avec les fichiers correspondants `data/raw/sample1_R1.fastq.gz`, etc. Snakemake traitera automatiquement tous les échantillons en parallèle (selon `--cores`).

## Visualiser le graphe de dépendances (utile en formation)
```bash
snakemake --dag | dot -Tpng > dag.png
```

## Dépannage
- **`fastp`/`fastqc`/`kraken2`: command not found** → outils non installés sur la machine ; utiliser `snakemake --use-conda` (nécessite conda/mamba) ou les installer via le gestionnaire de paquets du serveur INSP.
- **Kraken2 très lent / erreur mémoire sur le serveur** → la base standard fait plusieurs dizaines de Go de RAM ; vérifier les ressources allouées (`--resources mem_mb=...`) et le nombre de `threads`.
- **Bracken échoue** → vérifier que la base Kraken2 utilisée a bien été construite avec les fichiers de longueur de lecture (`database*mers.kmer_distrib`) requis par Bracken ; ce n'est pas le cas de la mini-base de test fournie ici (`run_bracken: false` par défaut, exprès).
