# Exercice 3 — Exercice intégré : pipeline Snakemake simplifié

**Durée estimée :** 60 min · **Track :** A (exécution) / B (lecture des résultats + rédaction)

## Objectif
Exécuter un pipeline automatisé simplifié allant de l'échantillon nasal brut au profil de résistance, puis produire un mini-rapport de résultats.

## Contexte
Le pipeline Snakemake fourni dans [`../pipeline/`](../pipeline/) enchaîne automatiquement les étapes vues depuis le Jour 2 :
```
FastQC (brut) → Fastp → FastQC (nettoyé) → Kraken2 [→ Bracken] [→ Krona] → MultiQC
```
C'est un **pipeline réel et fonctionnel**, pas un exemple théorique : il a été testé de bout en bout avec les vrais outils (fastp, FastQC, Kraken2, MultiQC) sur les données factices du Jour 2. Voir [`../pipeline/README.md`](../pipeline/README.md) pour tous les détails.

## Étapes

1. Déplacez-vous dans le dossier du pipeline :
   ```bash
   cd jour4_metagenomique_dhis2/pipeline
   ```
2. Vérifiez le plan d'exécution avant de lancer quoi que ce soit (dry-run — n'exécute rien) :
   ```bash
   snakemake -n --cores 2
   ```
   Vous devez voir la liste des règles qui seront exécutées (`fastqc_raw`, `fastp`, `fastqc_clean`, `kraken2`, `multiqc`) et pourquoi (fichiers manquants).
3. Lancez le pipeline complet (données factices fournies, ~10 secondes) :
   ```bash
   snakemake --cores 2
   ```
4. Vérifiez que tous les résultats attendus ont été générés :
   ```bash
   snakemake --cores 2 -n
   ```
   (le `-n` en mode "dry-run" doit indiquer qu'il n'y a plus rien à exécuter si le pipeline s'est terminé correctement)
5. Ouvrez le rapport consolidé : `results/multiqc/multiqc_report.html` — c'est la vue d'ensemble la plus utile après un run.
6. **Sur le serveur INSP**, adaptez `config.yaml` pour pointer vers vos données réelles et la base Kraken2 officielle (voir la section correspondante du README du pipeline), puis relancez la même commande `snakemake --cores 8`.

## Livrable — Mini-rapport de résultats (individuel, Track A)
Rédigez un mini-rapport (1 page maximum) reprenant :
- l'échantillon analysé et sa provenance (nasal/anonymisé),
- le résultat du QC (qualité globale avant/après trimming),
- le profil taxonomique obtenu (organisme(s) dominant(s)),
- les gènes ARG détectés, s'il y en a,
- une conclusion en une phrase orientée décision (ex. "profil compatible avec X, recommandation Y").

## Discussion (Track A + B)
Quel est l'intérêt principal d'automatiser ce pipeline avec un outil comme Snakemake plutôt que d'exécuter chaque commande manuellement, dans un contexte de surveillance où le volume d'échantillons va croître ?
