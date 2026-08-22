# Exercice 1 — Générer et interpréter un rapport FastQC

**Durée estimée :** 45 min · **Track :** A (exécution) / B (interprétation)

## Objectif
Générer un rapport de qualité FastQC sur le jeu de données de la journée et en interpréter les indicateurs clés.

## Prérequis
- FastQC installé sur le serveur INSP (`fastqc --version`).
- Jeu de données : [`../data/sample_R1.fastq.gz`](../data/sample_R1.fastq.gz), [`../data/sample_R2.fastq.gz`](../data/sample_R2.fastq.gz).

## Étapes

1. Créez un répertoire de résultats :
   ```bash
   mkdir -p results/fastqc
   ```
2. Lancez FastQC sur les deux fichiers :
   ```bash
   fastqc data/sample_R1.fastq.gz data/sample_R2.fastq.gz -o results/fastqc/
   ```
3. Récupérez les rapports HTML générés (`sample_R1_fastqc.html`, `sample_R2_fastqc.html`) et ouvrez-les dans un navigateur.
4. Pour chacun des deux fichiers, notez dans un tableau :

   | Module | Statut (✅/⚠️/❌) | Observation |
   |---|---|---|
   | Per base sequence quality | | |
   | Per sequence quality scores | | |
   | Adapter content | | |
   | Sequence duplication levels | | |

## Questions de vérification
1. À partir de quelle position (approximativement) la qualité Phred commence-t-elle à décliner significativement dans vos reads ?
2. Le module "Adapter content" déclenche-t-il une alerte ? Que devrez-vous faire à l'étape suivante (Fastp) pour y remédier ?
3. Combien de reads (environ) semblent anormalement courts ou de basse qualité par rapport à l'ensemble ?

## Discussion Track B
Un rapport FastQC avec plusieurs modules en alerte rouge signifie-t-il automatiquement que les données sont inutilisables ? Quels facteurs faut-il prendre en compte avant de rejeter un run (coût du re-séquençage, criticité de l'échantillon, type d'analyse visée) ?
