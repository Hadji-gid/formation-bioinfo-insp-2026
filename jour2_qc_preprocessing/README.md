# Jour 2 — Contrôle qualité et pre-processing des données NGS

## Objectifs pédagogiques

À la fin de cette journée, chaque participant sera capable de :
- Générer et interpréter un rapport de qualité de séquençage avec FastQC.
- Comprendre les paramètres de trimming/filtrage et les appliquer avec Fastp.
- Réaliser un contrôle qualité complet sur un jeu de données NGS (COVID/AMR anonymisé).

**Track A** : exécution complète du pipeline QC sur le serveur INSP.
**Track B** : lecture et interprétation critique d'un rapport QC transmis par une équipe technique.

## Contenu théorique (résumé)

### 1. Pourquoi le contrôle qualité est la première étape obligatoire
Aucune analyse en aval (alignement, assemblage, détection de variants) n'a de sens si les données brutes de séquençage sont de mauvaise qualité. Le QC permet de détecter précocement : adaptateurs résiduels, biais de composition en bases, chute de qualité en fin de read, contamination.

### 2. FastQC — générer et interpréter un rapport
```bash
fastqc sample_R1.fastq.gz sample_R2.fastq.gz -o results/fastqc/
```

Indicateurs clés à interpréter dans le rapport HTML :
| Module FastQC | Ce qu'il indique | Signal d'alerte |
|---|---|---|
| Per base sequence quality | Score Phred le long du read | Chute sous Q20 en fin de read |
| Per sequence quality scores | Distribution globale des scores | Pic déplacé vers les basses valeurs |
| Per base sequence content | Équilibre A/T/G/C par position | Déséquilibre marqué en début de read (biais d'amorce, normal) |
| Adapter content | Présence d'adaptateurs résiduels | Courbe qui monte en fin de read |
| Sequence duplication levels | Niveau de duplication de reads | Duplication élevée (possible sur-amplification PCR) |

### 3. Fastp — trimming et filtrage
Fastp combine QC, trimming des adaptateurs et filtrage qualité en un seul outil rapide.

```bash
fastp \
  -i sample_R1.fastq.gz -I sample_R2.fastq.gz \
  -o clean_R1.fastq.gz -O clean_R2.fastq.gz \
  --detect_adapter_for_pe \
  --qualified_quality_phred 20 \
  --length_required 50 \
  --json results/fastp/sample.fastp.json \
  --html results/fastp/sample.fastp.html
```

Paramètres clés :
- `--qualified_quality_phred` : seuil de qualité Phred en dessous duquel une base est considérée "non qualifiée".
- `--length_required` : longueur minimale d'un read après trimming pour être conservé.
- `--detect_adapter_for_pe` : détection automatique des adaptateurs en mode paired-end.

## Jeu de données de la journée

Le dossier [`data/`](data/) contient un jeu de données **synthétique** (paired-end, `sample_R1.fastq.gz` / `sample_R2.fastq.gz`) généré pour la formation, imitant un run NGS réel avec :
- une qualité correcte en début de read et une chute progressive en fin de read (profil réaliste Illumina),
- quelques reads contenant des adaptateurs résiduels,
- quelques reads courts et de basse qualité à filtrer.

Aucune donnée patient réelle n'est utilisée — voir [`data/README_data.md`](data/README_data.md).

## Exercices du jour

1. [Exercice 1 — Rapport FastQC](exercices/exercice1_fastqc.md)
2. [Exercice 2 — Trimming avec Fastp](exercices/exercice2_fastp_trimming.md)

## Points de vigilance formateur
- Bien montrer un rapport FastQC "propre" ET un rapport "dégradé" en comparaison pour ancrer la lecture des indicateurs.
- Insister : le trimming n'est pas une étape à paramétrer par défaut — les seuils dépendent du type d'analyse en aval (variant calling vs métagénomique).
