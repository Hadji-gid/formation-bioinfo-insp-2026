# Données de l'exercice — Jour 2

## `sample_R1.fastq.gz` / `sample_R2.fastq.gz`

Jeu de données **entièrement synthétique** (300 paires de reads, format paired-end Illumina), généré par script pour la formation. **Aucune donnée patient ni séquence réelle n'est utilisée.**

Caractéristiques intégrées volontairement pour l'exercice pédagogique :
- Qualité Phred qui décline de façon réaliste vers la fin des reads (profil typique Illumina).
- ~12 % des reads contiennent un fragment d'adaptateur résiduel (`AGATCGGAAGAGC`) en fin de séquence.
- ~5 % des reads sont courts (30–60 pb) et de basse qualité (Phred 2–12), simulant des reads à filtrer.

## Utilisation
Ce jeu de données est conçu pour l'[Exercice 1 (FastQC)](../exercices/exercice1_fastqc.md) et l'[Exercice 2 (Fastp)](../exercices/exercice2_fastp_trimming.md). En séance réelle sur le serveur INSP, les participants Track A rejoueront les mêmes commandes sur des données NGS anonymisées (COVID ou AMR) fournies par l'équipe bio-informatique INSP.

## Régénération
Le script Python utilisé pour générer ce jeu de données est disponible sur demande auprès de l'équipe bio-informatique INSP si besoin de régénérer un jeu de taille différente.
