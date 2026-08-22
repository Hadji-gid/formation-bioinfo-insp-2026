# Exercice 2 — Visualisation avec Krona

**Durée estimée :** 30 min · **Track :** A & B (tous)

## Objectif
Générer un graphe taxonomique interactif à partir d'un rapport Kraken2 et l'interpréter.

## Étapes

1. Convertissez le rapport Kraken2 au format Krona :
   ```bash
   kreport2krona.py -r results/kraken2/sample_report.txt \
     -o results/kraken2/sample.krona.txt
   ```
2. Générez le graphe HTML interactif :
   ```bash
   ktImportText results/kraken2/sample.krona.txt -o results/kraken2/sample_krona.html
   ```
3. Ouvrez le fichier HTML dans un navigateur et explorez les anneaux (cliquez pour zoomer sur un taxon).

## Question de vérification
En 2-3 phrases, comment décririez-vous ce graphe à un directeur régional de santé qui n'a jamais vu de rapport bio-informatique (Track B — exercice d'entraînement à la vulgarisation) ?
