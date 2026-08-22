# Jour 1 — Ouverture, séquençage & bio-informatique, environnement Linux (31/08/2026)

## Objectifs pédagogiques

À la fin de cette journée, chaque participant sera capable de :
- Situer les grandes technologies de séquençage (1ère à 3ème génération) et leur usage respectif.
- Expliquer le rôle de la bio-informatique à chaque niveau de la pyramide du laboratoire, à la lumière des leçons de la COVID-19, du Mpox et de la diphtérie.
- Décrire à un niveau introductif ce qu'est la résistance antimicrobienne (AMR) et pourquoi elle concerne la bio-informatique.
- Naviguer dans un système de fichiers Linux avec les commandes essentielles.
- Se connecter en toute sécurité au serveur bio-informatique INSP/CRPE via SSH.
- Organiser un répertoire de projet selon les bonnes pratiques de gestion des données biologiques.

**Track A** : manipulation pratique directe sur le serveur INSP.
**Track B** : compréhension du fonctionnement du serveur, du modèle d'accès et des enjeux de sécurité, pour pouvoir dialoguer avec les équipes techniques.

## Ouverture de l'atelier et évaluation initiale

- Ouverture par le représentant du DG de l'INSP.
- Présentation et validation du calendrier de la semaine (voir [`../PROGRAMME.md`](../PROGRAMME.md)).
- **Pré-test** (23 questions) — voir [`../evaluation/pretest_posttest_20_questions.md`](../evaluation/pretest_posttest_20_questions.md). À administrer avant tout contenu théorique, corrigés non communiqués.

## Module 1 — Séquençage et bio-informatique

### 1.1 Technologies de séquençage : trois générations

| Génération | Technologie | Caractéristiques | Usage typique |
|---|---|---|---|
| **1ère** | Sanger (terminaison de chaîne) | Haute précision, lectures courtes/moyennes (~800-1000 pb), lent et coûteux à l'échelle du génome entier | Confirmation d'un variant ponctuel, séquençage d'un petit fragment (ex. gène *tox* de la diphtérie) |
| **2ème (NGS)** | Illumina | Séquençage court-lecture massivement parallèle (millions de reads simultanés), excellent rapport qualité/coût | Base de tous les pipelines enseignés cette semaine (FastQC, Fastp, Bowtie2, Kraken2...) |
| **3ème** | Oxford Nanopore (MinION), PacBio | Lectures longues, séquençage en temps réel, appareils portables utilisables sur le terrain | Réponse rapide en contexte d'urgence ou de terrain isolé |

**Exemple concret malien (3ème génération) :** le premier cas de Mpox confirmé au Mali (2025, détecté à la frontière Mali-Guinée par le centre national de télémédecine) a été séquencé directement sur un appareil portable MinION MK1C. L'analyse a révélé un génome de 197 122 pb appartenant au clade IIb, lignée G.1, et a permis de relier ce cas à l'épidémie de mai 2025 en Sierra Leone par phylogénie — une démonstration concrète de l'intérêt du séquençage portable pour une réponse rapide en zone frontalière, sans dépendre d'un laboratoire centralisé.

### 1.2 Données générées et leur utilité en santé publique — leçons de trois épidémies

**COVID-19 :** l'épidémie a débuté au Mali en mars 2020. En 2021, l'Afrique ne représentait qu'environ 1 % du séquençage mondial du SARS-CoV-2 — un déficit de capacité locale flagrant. Le programme AFROSCREEN (2021-2023) a renforcé les capacités de séquençage dans 13 pays dont le Mali, permettant de documenter la circulation des variants Alpha, Beta, Delta (2021) puis des sous-variants Omicron (étude INSP, 2022-2024). Voir la discussion détaillée ci-dessous (pyramide du laboratoire).

**Mpox :** au-delà de l'exemple technique du 1.1, le cas malien de 2025 illustre aussi une leçon de surveillance : la capacité à tracer l'origine régionale d'un cas importé (ici depuis la Sierra Leone) dépend directement de la disponibilité de données génomiques comparables produites par les pays voisins — d'où l'importance des réseaux régionaux de partage de séquences (Africa CDC, GISAID).

**Diphtérie :** depuis 2023, une résurgence régionale touche neuf pays africains dont le Mali (636 cas suspects et 35 décès rapportés au Mali entre janvier 2025 et mars 2026). Contrairement au COVID-19 et au Mpox, la diphtérie est une maladie bactérienne à toxine : la caractérisation moléculaire du gène *tox* et le typage des souches circulantes appuient le suivi de la résurgence et orientent la stratégie vaccinale — un rappel que la bio-informatique s'applique aussi bien aux bactéries qu'aux virus.

**Message clé :** ces trois exemples montrent que le type de pathogène (virus ARN, virus ADN, bactérie à toxine) et le contexte (urgence frontalière, surveillance de routine, résurgence connue) déterminent quelle technologie de séquençage et quelle analyse bio-informatique sont pertinentes — il n'y a pas une seule bonne façon de faire, mais une adéquation à trouver entre besoin opérationnel et outil disponible.

### 1.3 La pyramide du laboratoire et la bio-informatique — leçons de la COVID-19

Avant d'aller plus loin, il est essentiel de comprendre **où s'insère la bio-informatique** dans le système de santé malien.

La pyramide sanitaire malienne comporte trois niveaux :

| Niveau | Acteurs | Rôle | Bio-informatique ? |
|---|---|---|---|
| **National de référence** | INSP/LRB, CRPE (labos P3/P2, inauguré juillet 2025) | Séquençage complet, analyse bio-informatique, phylogénie, décision nationale | **Oui — complète** (QC, assemblage, annotation, classification, soumission aux bases internationales) |
| **Intermédiaire régional** | LBMA, UCRC, CICM | Criblage RT-PCR, séquençage partiel, transmission des échantillons/données au national | Partielle (préparation des données, criblage variant) |
| **Périphérique** | Sites de diagnostic rapide | Prélèvement, tests antigéniques/RT-PCR de dépistage | Aucune directement — mais génère les données qui déclenchent tout le reste |

**Le point clé à retenir :** un échantillon prélevé en périphérie n'a de valeur pour la décision de santé publique **que si** l'information peut remonter jusqu'au niveau national assez vite pour être analysée, interprétée, et retransmise sous forme d'action (alerte, ajustement de la réponse). La bio-informatique est le maillon qui transforme la donnée brute de séquençage en information actionnable à ce niveau national — c'est tout l'enjeu de cette semaine de formation.

Discussion guidée : voir [`exercices/exercice0_pyramide_laboratoire_covid19.md`](exercices/exercice0_pyramide_laboratoire_covid19.md). Support détaillé pour approfondir : [`../ressources/support_discussion_pyramide_laboratoire_covid19.md`](../ressources/support_discussion_pyramide_laboratoire_covid19.md).

### 1.4 Résistance antimicrobienne (AMR) — introduction

La résistance antimicrobienne est reconnue par l'OMS comme l'une des dix principales menaces de santé publique mondiale. Trois mécanismes principaux permettent à une bactérie de résister à un antibiotique : dégradation enzymatique de la molécule, pompes à efflux qui l'expulsent de la cellule, et mutation de la cible que l'antibiotique visait.

La bio-informatique intervient en détectant, par comparaison à des bases de référence (ex. AMRFinderPlus), les gènes de résistance présents dans un génome séquencé, puis en suivant leur diffusion dans le temps et l'espace. Cette approche pratique sera approfondie en détail le **Jour 3** (Module 4 — Alignement, assemblage et annotation ARG).

## Module 2 — Environnement Linux et ligne de commande

### 2.1 Pourquoi Linux en bio-informatique ?
La quasi-totalité des outils de séquençage (FastQC, Fastp, Bowtie2, Kraken2, AMRFinderPlus...) tournent en ligne de commande sous Linux. Comprendre le terminal est un prérequis incontournable, pas une option.

### 2.2 Commandes essentielles

| Commande | Rôle | Exemple |
|---|---|---|
| `pwd` | Afficher le répertoire courant | `pwd` |
| `ls` | Lister le contenu d'un répertoire | `ls -lh` |
| `cd` | Se déplacer | `cd ~/projets/covid_run1` |
| `mkdir` | Créer un répertoire | `mkdir -p data/raw` |
| `cp` | Copier un fichier | `cp sample.fastq.gz data/raw/` |
| `mv` | Déplacer / renommer | `mv old_name.txt new_name.txt` |
| `rm` | Supprimer (⚠️ irréversible) | `rm -i fichier_test.txt` |
| `grep` | Rechercher du texte | `grep "@SRR" sample.fastq` |
| `nano` | Éditeur de texte simple | `nano notes.txt` |
| `man` | Consulter l'aide d'une commande | `man grep` |

### 2.3 Connexion SSH au serveur INSP/CRPE
SSH (Secure Shell) permet une connexion chiffrée à un serveur distant. C'est le point d'entrée unique vers le serveur bio-informatique INSP pour tous les travaux pratiques de la semaine.

```bash
ssh identifiant@serveur.insp-crpe.ml
```

Voir le guide détaillé : [`../logistique/guide_connexion_ssh_serveur_insp.md`](../logistique/guide_connexion_ssh_serveur_insp.md). Serveur pas encore disponible ? Un **serveur SSH simulé, testé et fonctionnel**, permet de pratiquer exactement les mêmes commandes en local : `ssh stagiaire@localhost -p 2222` (mot de passe `formation2026`) — voir [`../local_environment/README.md`](../local_environment/README.md#serveur-ssh-simulé-exercice-2-jour-1).

### 2.4 Organisation des fichiers de données biologiques — bonnes pratiques
- Un répertoire par projet/run, jamais de mélange entre runs.
- Séparer systématiquement `raw/` (données brutes, jamais modifiées), `processed/` (données intermédiaires) et `results/` (sorties finales).
- Nommer les fichiers de façon standardisée : `<date>_<structure>_<echantillon>_<R1|R2>.fastq.gz`.
- Ne jamais travailler directement dans le dossier de données brutes.

```
projet_covid_run1/
├── raw/
├── processed/
├── results/
├── scripts/
└── logs/
```

## Exercices et activités du jour

0. [Exercice 0 — Discussion guidée : la pyramide du laboratoire et la COVID-19](exercices/exercice0_pyramide_laboratoire_covid19.md)
1. [Exercice 1 — Navigation Linux](exercices/exercice1_navigation_linux.md)
2. [Exercice 2 — Connexion SSH au serveur INSP](exercices/exercice2_connexion_ssh.md)
3. [Exercice 3 — Organisation d'un répertoire de projet](exercices/exercice3_organisation_projet.md)

## Points de vigilance formateur

- Vérifier en amont (J-7, cf. TDR) que chaque participant dispose bien d'un compte serveur actif et d'un accès réseau fonctionnel — ou, à défaut, que l'environnement local (`local_environment/`) est installé et testé sur son poste.
- Le Module 1 (séquençage/bio-informatique) est théorique et dense — prévoir des pauses et solliciter le vécu personnel des participants pendant la COVID-19 pour ancrer la discussion (voir Exercice 0).
- Prévoir un support papier du tableau des commandes pour les participants moins à l'aise avec l'anglais technique.
- Quiz de 5 min le lendemain matin sur l'ensemble du contenu du Jour 1 (séquençage, pyramide, Linux).
