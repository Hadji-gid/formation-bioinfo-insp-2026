# Exercice 1 — Alignement avec Bowtie2 et Minimap2

**Durée estimée :** 45 min · **Track :** A

## Objectif
Aligner les reads nettoyés (issus du Jour 2) sur le génome de référence factice et interpréter les statistiques d'alignement.

## Prérequis
- Fichiers nettoyés `processed/clean_R1.fastq.gz` / `clean_R2.fastq.gz` (Jour 2, Exercice 2).
- [`../data/reference_genome_exemple.fasta`](../data/reference_genome_exemple.fasta)

## Étapes — Bowtie2

1. Indexez le génome de référence :
   ```bash
   mkdir -p results/alignement
   bowtie2-build data/reference_genome_exemple.fasta results/alignement/ref_index
   ```
2. Alignez les reads :
   ```bash
   bowtie2 -x results/alignement/ref_index \
     -1 processed/clean_R1.fastq.gz -2 processed/clean_R2.fastq.gz \
     -S results/alignement/sample_bowtie2.sam
   ```
3. Convertissez et triez le SAM en BAM :
   ```bash
   samtools sort -o results/alignement/sample_bowtie2.sorted.bam results/alignement/sample_bowtie2.sam
   samtools index results/alignement/sample_bowtie2.sorted.bam
   ```
4. Consultez les statistiques d'alignement :
   ```bash
   samtools flagstat results/alignement/sample_bowtie2.sorted.bam
   ```

## Étapes — Minimap2 (comparaison)

```bash
minimap2 -ax sr data/reference_genome_exemple.fasta \
  processed/clean_R1.fastq.gz processed/clean_R2.fastq.gz \
  > results/alignement/sample_minimap2.sam
samtools flagstat results/alignement/sample_minimap2.sam
```

## Question de vérification
Le taux d'alignement global obtenu est-il élevé ou faible ? Rappel : ici la référence est **factice** (séquence aléatoire), donc un taux d'alignement très bas est **attendu et normal** — cela illustre concrètement pourquoi le choix d'une référence pertinente est déterminant en situation réelle.

## Discussion Track B
Si un rapport d'alignement montre un taux de 12 % contre la référence attendue, quelles hypothèses formuleriez-vous avant de conclure à un problème (mauvaise référence, contamination, nouveau variant très divergent, erreur d'échantillon) ?
