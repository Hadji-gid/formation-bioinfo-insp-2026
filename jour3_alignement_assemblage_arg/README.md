# Jour 3 — Alignement, assemblage et annotation ARG

## Objectifs pédagogiques

À la fin de cette journée, chaque participant sera capable de :
- Aligner des reads sur un génome de référence (Bowtie2, Minimap2) et interpréter les statistiques d'alignement.
- Réaliser un assemblage de novo avec metaSPAdes et interpréter les contigs obtenus.
- Annoter les gènes de résistance aux antimicrobiens (ARG) avec AMRFinderPlus et lire les colonnes de sortie.
- Exécuter un pipeline complet sur 5 échantillons et comparer les profils ARG obtenus.

**Track A** : exécution complète du pipeline sur le serveur INSP.
**Track B** : lecture et interprétation d'un rapport ARG, formulation de questions pertinentes à l'équipe technique.

## Contenu théorique (résumé)

### 1. Alignement sur génome de référence

| Outil | Cas d'usage typique | Commande de base |
|---|---|---|
| **Bowtie2** | Reads courts, alignement rapide sur génome de référence connu | `bowtie2 -x ref_index -1 R1.fq.gz -2 R2.fq.gz -S out.sam` |
| **Minimap2** | Reads longs (Nanopore/PacBio) ou alignement rapide de reads courts contre de grands génomes | `minimap2 -ax sr ref.fasta R1.fq.gz R2.fq.gz > out.sam` |

Statistiques clés à vérifier après alignement (`samtools flagstat`) :
- **Taux d'alignement global** (`% overall alignment rate`) — un taux bas peut indiquer une contamination ou un mauvais choix de référence.
- **Reads correctement appariés (paired)** — important pour la fiabilité du variant calling en aval.

### 2. Assemblage de novo avec metaSPAdes
Contrairement à l'alignement, l'assemblage ne nécessite pas de génome de référence : il reconstruit les séquences à partir des chevauchements entre reads. Particulièrement utile en contexte métagénomique ou pour des pathogènes émergents sans référence proche.

```bash
metaspades.py -1 clean_R1.fastq.gz -2 clean_R2.fastq.gz -o results/assembly/
```

Sortie clé : `contigs.fasta`. Indicateurs à examiner :
- **N50** : longueur de contig au-dessus de laquelle 50 % de l'assemblage total est représenté (plus il est élevé, meilleur est l'assemblage).
- **Nombre total de contigs** — un nombre très élevé de petits contigs suggère un assemblage fragmenté.

### 3. Annotation ARG avec AMRFinderPlus
```bash
amrfinder -n contigs.fasta -o results/arg/sample_amrfinder.tsv --plus
```

Colonnes clés de la sortie AMRFinderPlus (voir exemple dans [`data/arg_profile_exemple.tsv`](data/arg_profile_exemple.tsv)) :
| Colonne | Signification |
|---|---|
| `Gene symbol` | Nom du gène de résistance détecté (ex. `blaCTX-M-15`, `tetA`) |
| `Class` | Classe d'antibiotique concernée |
| `Subclass` | Sous-classe / mécanisme précis |
| `% Identity to reference` | Pourcentage d'identité avec la séquence de référence |
| `% Coverage of reference` | Pourcentage du gène de référence couvert |
| `Method` | Méthode de détection (BLAST exact, partiel, HMM...) |

## Jeu de données de la journée
Le dossier [`data/`](data/) contient un petit génome de référence factice (`reference_genome_exemple.fasta`) et un exemple de sortie AMRFinderPlus (`arg_profile_exemple.tsv`) au format réel, pour se familiariser avec la lecture des résultats avant de manipuler les vraies sorties générées sur le serveur INSP.

## Exercices du jour
1. [Exercice 1 — Alignement avec Bowtie2/Minimap2](exercices/exercice1_alignement_bowtie2_minimap2.md)
2. [Exercice 2 — Assemblage de novo avec metaSPAdes](exercices/exercice2_assemblage_metaspades.md)
3. [Exercice 3 — Annotation ARG avec AMRFinderPlus](exercices/exercice3_annotation_amrfinderplus.md)

## Points de vigilance formateur
- L'assemblage de novo (metaSPAdes) peut être long sur des données réelles — prévoir des données déjà pré-assemblées en secours si le temps manque.
- Bien distinguer pour les participants : alignement (contre référence connue) vs assemblage (sans référence) — confusion fréquente.
