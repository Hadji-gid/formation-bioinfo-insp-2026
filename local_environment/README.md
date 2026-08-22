# Environnement local de repli — solution technique pour l'Objectif 4

*Contexte : le TDR de la formation prévoit (Objectif 4) la mise en place de l'infrastructure réseau de connexion au serveur bio-informatique INSP/CRPE. Au moment de la préparation de cette formation, cette infrastructure n'est pas encore déployée. Ce dossier fournit une solution de repli **techniquement réelle** — un environnement contenant tous les outils de la formation, installable sur le PC de chaque participant — permettant de dérouler intégralement les Jours 1 à 4 sans dépendre du serveur. Voir [`../logistique/plan_contingence_infrastructure.md`](../logistique/plan_contingence_infrastructure.md) pour la note de cadrage institutionnelle complète.*

## Ce que contient cet environnement

Tous les outils utilisés du Jour 1 au Jour 4 : **FastQC, Fastp, Bowtie2, Minimap2, metaSPAdes, Kraken2, Bracken, Krona, AMRFinderPlus, Snakemake, MultiQC, samtools, seqkit** — exactement les mêmes commandes que celles enseignées dans les supports, qu'elles s'exécutent ici ou (plus tard) sur le vrai serveur INSP.

Deux façons de l'obtenir : **Docker** (recommandé — identique sur Windows/Mac/Linux) ou **conda/mamba** directement.

## Option 1 — Docker (recommandé)

### Prérequis
Installer [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Windows/Mac) ou Docker Engine (Linux).

### Construction de l'image (une seule fois, ~10-15 min selon la connexion)
```bash
cd local_environment
docker build -t insp-bioinfo .
```

### Utilisation (depuis la racine du dépôt, pour accéder à tous les jourX/)
```bash
cd formation-bioinfo-insp-2026
docker run -it --rm -v "$(pwd)":/formation -w /formation insp-bioinfo
```
Vous êtes maintenant dans un terminal Linux avec tous les outils installés, et l'ensemble du dépôt de formation monté dans `/formation`. Toutes les commandes des exercices (Jour 1 à 4) fonctionnent telles quelles.

### Avec docker-compose (alternative pratique)
```bash
cd local_environment
docker compose run --rm bioinfo
```

### Vérifier que tout fonctionne
Une fois dans le conteneur :
```bash
bash local_environment/verifier_environnement.sh
```

## Option 2 — Conda / Mamba (sans Docker)

### Prérequis
Installer [Miniforge](https://github.com/conda-forge/miniforge) (inclut mamba, plus rapide que conda seul).

### Création de l'environnement
```bash
cd local_environment
mamba env create -f environment.yml
conda activate insp-bioinfo
```

### Vérifier que tout fonctionne
```bash
bash verifier_environnement.sh
```

## Serveur SSH simulé (Exercice 2, Jour 1)

En plus de l'environnement d'exécution des pipelines (ci-dessus), un **vrai petit serveur SSH** tourne dans un conteneur séparé, pour pratiquer la connexion SSH de l'Exercice 2 exactement comme sur le serveur réel — authentification par mot de passe, prompt, navigation, tout y est.

> ✅ **Ce mécanisme a été testé de bout en bout** avant intégration : création d'utilisateur, démarrage de sshd, connexion SSH réelle avec mot de passe — tout fonctionne tel que documenté ci-dessous.

### Démarrage

```bash
cd local_environment
docker compose up -d ssh-server
```

### Connexion (dans un autre terminal, exactement comme dans l'exercice)

```bash
ssh stagiaire@localhost -p 2222
```
Mot de passe : `formation2026`

Une fois connecté, toutes les commandes de l'[Exercice 2](../jour1_linux_ssh/exercices/exercice2_connexion_ssh.md) fonctionnent à l'identique (`pwd`, `whoami`, `mkdir`, `exit`...).

### Un compte par participant (recommandé pour une salle de 26)

Par défaut, un seul compte partagé (`stagiaire`) existe. Pour créer un compte individuel par participant :

```bash
docker exec insp-ssh-server bash /creer_comptes.sh 26 formation2026
```

Chaque participant se connecte alors avec son propre compte :
```bash
ssh participant7@localhost -p 2222   # participant n°7, par exemple
```

### Arrêt

```bash
docker compose stop ssh-server
```

### Ce que ce serveur simule (et ce qu'il ne simule pas)

- ✅ Authentification SSH par mot de passe, session interactive, navigation Linux, création de répertoires — tout ce dont l'Exercice 2 a besoin.
- ⚠️ Il ne contient **pas** les outils bio-informatiques (FastQC, Kraken2...) — ce n'est pas son rôle. Pour les exercices des Jours 2 à 4, utilisez le conteneur `bioinfo` décrit plus haut (`docker run -it insp-bioinfo` ou `docker compose run --rm bioinfo`).
- ⚠️ L'authentification par mot de passe est activée pour simplifier la formation ; le vrai serveur INSP/CRPE utilisera probablement une authentification par clé SSH, plus sécurisée (voir [`../logistique/guide_connexion_ssh_serveur_insp.md`](../logistique/guide_connexion_ssh_serveur_insp.md)).

## Ce qui fonctionne immédiatement, hors ligne

Le pipeline complet du [Jour 4](../jour4_metagenomique_dhis2/pipeline/) (FastQC → Fastp → FastQC → Kraken2 → MultiQC) tourne **de bout en bout sans connexion internet**, grâce à la mini-base Kraken2 de test déjà fournie dans le dépôt. Tous les exercices des Jours 1 à 3 (navigation Linux, QC, alignement, assemblage) fonctionnent également sans connexion, avec les jeux de données factices fournis.

## Ce qui nécessite une connexion internet (une fois, à la première utilisation)

- **AMRFinderPlus** : téléchargement de sa base de données de gènes de résistance (`amrfinder -u`, environ 500 Mo).
- **Krona** : construction de sa base taxonomique complète (`ktUpdateTaxonomy.sh`) si vous voulez l'utiliser au-delà de la mini-base de test.
- **Kraken2/Bracken en conditions réelles** : la base Kraken2 standard fait plusieurs dizaines de Go — à télécharger une fois (idéalement en amont de la formation, sur un réseau performant) ou à obtenir directement du serveur INSP quand celui-ci sera disponible.

Ces étapes sont à faire **une fois**, idéalement avant la formation si une connexion est disponible en amont ; elles ne bloquent pas le déroulement des exercices tels que conçus (qui utilisent des données et bases de test allégées).

## Dépannage

| Symptôme | Cause probable | Solution |
|---|---|---|
| `docker build` échoue sur `micromamba install` | Connexion internet instable pendant le téléchargement des paquets bioconda | Relancer `docker build` — les couches déjà téléchargées sont mises en cache. |
| `mamba env create` très lent | Résolution de dépendances conda classique | Utiliser `mamba` (pas `conda`) comme indiqué ci-dessus — nettement plus rapide. |
| Un outil manque après installation | Environnement conda non activé, ou build Docker incomplet | Vérifier avec `verifier_environnement.sh` ; réactiver l'environnement (`conda activate insp-bioinfo`) ou reconstruire l'image Docker. |
| Le conteneur Docker ne voit pas mes fichiers | Le volume n'est pas monté au bon endroit | Vérifier que la commande `docker run` est lancée **depuis la racine du dépôt** (`formation-bioinfo-insp-2026/`), pas depuis un sous-dossier. |
| `ssh: connect to host localhost port 2222: Connection refused` | Le serveur SSH simulé n'est pas démarré | `docker compose up -d ssh-server` depuis `local_environment/`, puis vérifier `docker ps`. |
| `Permission denied (publickey,password)` sur le serveur SSH simulé | Mauvais nom d'utilisateur/mot de passe | Vérifier le compte utilisé (`stagiaire` par défaut, mot de passe `formation2026`) ou régénérer les comptes avec `creer_comptes.sh`. |
| Le port 2222 est déjà utilisé sur ma machine | Un autre service local écoute déjà sur ce port | Modifier le mapping dans `docker-compose.yml` (ex. `"2223:22"`) et adapter la commande `ssh` en conséquence. |

## Pourquoi cette solution plutôt qu'attendre le serveur ?

L'objectif pédagogique de la formation (compétences individuelles Track A/B) ne dépend pas de l'infrastructure serveur en tant que telle — seule la **continuité de la surveillance après la formation** (deuxième volet de l'Objectif 4 du TDR) en dépend réellement. Cette solution locale permet de découpler les deux : la formation peut avoir lieu et atteindre pleinement ses objectifs pédagogiques dès maintenant, pendant que le déploiement réseau du serveur INSP/CRPE se poursuit en parallèle comme chantier institutionnel de moyen terme.
