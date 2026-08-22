# Exercice 1 — Navigation dans un système Linux

**Durée estimée :** 30 min · **Track :** A & B (tous)

## Objectif
Se familiariser avec les commandes de navigation et de manipulation de fichiers de base.

## Prérequis
Être connecté à une session Linux (serveur INSP ou machine virtuelle de formation).

## Étapes

1. Affichez votre répertoire de travail actuel :
   ```bash
   pwd
   ```
2. Listez le contenu du répertoire, avec le détail (tailles, dates, permissions) :
   ```bash
   ls -lh
   ```
3. Créez un répertoire d'exercice à votre nom :
   ```bash
   mkdir exercice_j1_<votre_nom>
   cd exercice_j1_<votre_nom>
   ```
4. Créez trois sous-répertoires `raw`, `processed`, `results` en une seule commande :
   ```bash
   mkdir -p raw processed results
   ```
5. Créez un fichier texte vide et éditez-le avec `nano` :
   ```bash
   nano notes_j1.txt
   ```
   Écrivez une phrase, puis enregistrez avec `Ctrl+O`, `Entrée`, et quittez avec `Ctrl+X`.
6. Copiez ce fichier dans `raw/`, puis renommez la copie dans `processed/` :
   ```bash
   cp notes_j1.txt raw/
   cp notes_j1.txt processed/notes_j1_v2.txt
   ```
7. Recherchez le mot que vous avez écrit avec `grep` :
   ```bash
   grep "votre_mot" notes_j1.txt
   ```

## Question de vérification
Quelle est la différence entre `cp` et `mv` ? Donnez un exemple de situation où utiliser l'un plutôt que l'autre dans un contexte de gestion de données de séquençage.

## Pour aller plus loin (optionnel)
Essayez `ls -la` (fichiers cachés) et `du -sh *` (taille des répertoires).
