# Exercice 2 — Assemblage de novo avec metaSPAdes

**Durée estimée :** 45–60 min (temps de calcul inclus) · **Track :** A

## Objectif
Lancer un assemblage de novo sur le serveur INSP et interpréter les contigs obtenus.

## Étapes

1. Lancez metaSPAdes sur les reads nettoyés :
   ```bash
   mkdir -p results/assembly
   metaspades.py -1 processed/clean_R1.fastq.gz -2 processed/clean_R2.fastq.gz \
     -o results/assembly/ -t 4
   ```
2. Une fois terminé, examinez le fichier de sortie principal :
   ```bash
   grep -c ">" results/assembly/contigs.fasta
   ```
3. Calculez des statistiques de base sur l'assemblage (longueur des contigs, N50) :
   ```bash
   seqkit stats results/assembly/contigs.fasta
   ```
4. Identifiez le plus long contig généré :
   ```bash
   seqkit sort -l -r results/assembly/contigs.fasta | seqkit fx2tab -nl | head -1
   ```

## Question de vérification
Combien de contigs avez-vous obtenus ? Le N50 vous semble-t-il élevé ou faible pour ce type de jeu de données ? (Sur des données réelles bien nettoyées, un assemblage de qualité pour un petit génome bactérien viserait un N50 se rapprochant de la taille du génome, avec un nombre de contigs le plus faible possible.)

## Point d'attention
metaSPAdes est conçu pour des communautés métagénomiques complexes — pour un seul organisme isolé, SPAdes "classique" est parfois suffisant et plus rapide. Le choix de l'outil dépend toujours de la nature de l'échantillon (isolat pur vs échantillon environnemental/clinique complexe).
