# Exercice 3 — Organisation d'un répertoire de projet sur le serveur INSP

**Durée estimée :** 30 min · **Track :** A & B (tous)

## Objectif
Mettre en pratique les bonnes pratiques de structuration d'un projet de bio-informatique.

## Contexte
Vous recevez un nouveau lot d'échantillons pour un run de surveillance (nom de code : `run_formation_j1`). Vous devez créer une arborescence de projet prête à recevoir les données.

## Étapes

1. Depuis votre répertoire personnel sur le serveur, créez la structure suivante :
   ```bash
   mkdir -p run_formation_j1/{raw,processed,results,scripts,logs}
   ```
2. Vérifiez l'arborescence créée :
   ```bash
   find run_formation_j1 -type d
   ```
   Vous devez obtenir :
   ```
   run_formation_j1
   run_formation_j1/raw
   run_formation_j1/processed
   run_formation_j1/results
   run_formation_j1/scripts
   run_formation_j1/logs
   ```
3. Créez un fichier `README.md` à la racine du projet décrivant en 2-3 lignes l'objectif du run :
   ```bash
   nano run_formation_j1/README.md
   ```
4. Créez un fichier journal vide qui recevra les logs des futurs traitements :
   ```bash
   touch run_formation_j1/logs/pipeline.log
   ```

## Livrable
Une capture d'écran (ou le résultat de `find run_formation_j1`) de votre arborescence finale, à partager avec le formateur.

## Discussion (Track B)
Pourquoi séparer strictement les données brutes (`raw/`) des données transformées (`processed/`, `results/`) est-il particulièrement important en contexte de surveillance épidémiologique (traçabilité, audit, reproductibilité) ?
