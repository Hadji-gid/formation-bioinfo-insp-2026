# Exercice 2 — Trimming et filtrage avec Fastp

**Durée estimée :** 45 min · **Track :** A (exécution) / B (lecture du rapport JSON/HTML)

## Objectif
Nettoyer le jeu de données de l'Exercice 1 en supprimant les adaptateurs résiduels et les reads de basse qualité, puis vérifier l'amélioration obtenue.

## Étapes

1. Créez un répertoire de résultats :
   ```bash
   mkdir -p results/fastp processed
   ```
2. Lancez Fastp avec des paramètres standards pour de la surveillance génomique :
   ```bash
   fastp \
     -i data/sample_R1.fastq.gz -I data/sample_R2.fastq.gz \
     -o processed/clean_R1.fastq.gz -O processed/clean_R2.fastq.gz \
     --detect_adapter_for_pe \
     --qualified_quality_phred 20 \
     --length_required 50 \
     --json results/fastp/sample.fastp.json \
     --html results/fastp/sample.fastp.html
   ```
3. Ouvrez `results/fastp/sample.fastp.html` et comparez :
   - le nombre de reads avant/après filtrage,
   - le pourcentage de bases avec Q≥30 avant/après,
   - le taux de détection d'adaptateurs.
4. Relancez FastQC sur les fichiers nettoyés pour confirmer l'amélioration :
   ```bash
   fastqc processed/clean_R1.fastq.gz processed/clean_R2.fastq.gz -o results/fastqc/
   ```

## Question de vérification
En comparant le rapport FastQC "avant" (Exercice 1) et "après" trimming, quels modules se sont améliorés ? Le nombre total de reads a-t-il significativement diminué ? Est-ce préoccupant dans ce cas précis (jeu de données factice) ?

## Point d'attention
Un `--length_required` trop élevé peut éliminer des reads valides pour certaines applications (ex. métagénomique où des reads courts restent informatifs). Le paramétrage doit toujours être adapté à l'objectif de l'analyse en aval — jamais appliqué par défaut sans réflexion.
