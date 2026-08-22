# Exercice 1 — Profilage taxonomique avec Kraken2 et Bracken

**Durée estimée :** 45 min · **Track :** A (exécution) / B (lecture du rapport)

## Partie 1 — Lecture du rapport exemple (tous)
Ouvrez [`../data/kraken2_report_exemple.txt`](../data/kraken2_report_exemple.txt) et répondez :
1. Quel pourcentage de reads reste "non classifié" (`unclassified`) ?
2. Quels sont les deux organismes les plus abondants au niveau espèce (`S`) ?
3. Le rapport indique la présence de SARS-CoV-2 et d'un virus influenza à faible abondance — dans un contexte de surveillance métagénomique clinique, comment interpréteriez-vous une co-détection à faible pourcentage (contamination croisée, co-infection réelle, seuil de détection) ?

## Partie 2 — Exécution sur le serveur INSP (Track A)
```bash
mkdir -p results/kraken2
kraken2 --db /data/kraken2_db --paired \
  processed/clean_R1.fastq.gz processed/clean_R2.fastq.gz \
  --report results/kraken2/sample_report.txt \
  --output results/kraken2/sample_output.txt

bracken -d /data/kraken2_db -i results/kraken2/sample_report.txt \
  -o results/kraken2/sample_bracken.txt -l S
```

## Question de vérification
Quelle est la différence fonctionnelle entre Kraken2 (classification directe par k-mers) et Bracken (ré-estimation d'abondance) ? Pourquoi les deux sont-ils utilisés en complément l'un de l'autre ?
