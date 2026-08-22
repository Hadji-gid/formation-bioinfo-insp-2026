# TDR — Formation en Bio-informatique Appliquée à la Surveillance Épidémiologique et à la Réponse aux Urgences de Santé Publique

*Transcription fidèle du document validé le 20/08/2026. Le fichier .docx original transmis n'a pas pu être conservé dans l'environnement de préparation ; ce fichier fait foi comme référence de travail jusqu'à remplacement par l'original. L'ancienne version (dates provisoires "juillet 2026") est archivée dans [`archive/TDR_Formation_Bioinformatique_INSP_2026_v1_juillet.docx`](archive/TDR_Formation_Bioinformatique_INSP_2026_v1_juillet.docx).*

**Ministère de la Santé et du Développement Social — République du Mali**
**Institut National de Santé Publique (INSP)** · Département Laboratoire

**Lieu :** Institut National de Santé Publique
**Date :** 31 août au 04 septembre 2026

## Contexte et justification

La pandémie COVID-19 a révélé avec acuité le rôle stratégique de la bio-informatique dans l'architecture de réponse aux urgences sanitaires. La pyramide sanitaire au Mali, du laboratoire national de référence aux laboratoires intermédiaires régionaux jusqu'aux sites périphériques de diagnostic rapide, a mis en évidence un chaînon critique : la capacité à transformer les données de séquençage en informations actionnables pour la surveillance, la détection précoce des variants et le pilotage de la réponse.

La COVID-19 a permis le renforcement des capacités de caractérisation moléculaire tant pour le séquençage que pour l'analyse et l'infrastructure bio-informatiques. Depuis lors, l'inauguration du Centre de Recherche sur les Pathogènes Émergents (CRPE) en juillet 2025, doté de laboratoires P3 et P2, et les travaux menés par l'équipe de bio-informatique de l'INSP (caractérisation métagénomique du résistome nasal, surveillance génomique) ont positionné l'INSP comme un nœud bio-informatique émergent pour l'Afrique de l'Ouest sahélienne. L'institut assure également la surveillance avec ses laboratoires partenaires (LBMA, UCRC et CICM).

Pourtant, l'exploitation de ces capacités reste limitée par un déficit de compétences et de culture bio-informatiques. La présente formation vise à combler ce fossé : non pas former des bio-informaticiens, mais créer une masse critique de professionnels et de leaders capables d'intégrer la bio-informatique dans leurs pratiques.

## Objectifs

### Objectif général
Renforcer les compétences des professionnels et responsables de laboratoire en bio-informatique appliquée à la surveillance épidémiologique et à la réponse aux urgences de santé publique au Mali.

### Objectifs spécifiques
1. Donner aux participants une compréhension fondamentale de la bio-informatique et de son rôle dans l'écosystème de surveillance (génomique, résistome, métagénomique, phylogénie).
2. Illustrer concrètement, à travers les leçons de la COVID-19, comment la pyramide du laboratoire s'articule avec les outils bio-informatiques à chaque niveau.
3. Initier les professionnels de laboratoire aux outils et pipelines bio-informatiques pratiques utilisés à l'INSP (NGS, AMR, DHIS2).
4. Mettre en place l'infrastructure réseau nécessaire à la connexion aux serveurs bio-informatiques de l'INSP pour les formations et la surveillance continue.

## Méthodologie
- **Présentation PowerPoint** : exposés structurés illustrant les concepts fondamentaux (NGS, phylogénie, AMR) avec des cas réels issus des travaux de l'INSP/CRPE.
- **Travaux pratiques/dirigés** : sessions hands-on sur le serveur bio-informatique de l'INSP, pipelines concrets (QC, alignement, annotation ARG) sur données anonymisées.
- **Partage d'expériences** : ateliers collaboratifs, retours d'expérience, simulation d'épidémie (Outbreak X).

## Résultats attendus

### Compétences individuelles
- Expliquer le rôle de la bio-informatique dans chaque niveau de la pyramide laboratoire en contexte d'urgence.
- Identifier les types de données génomiques produits à l'INSP et leur utilité en surveillance.
- Exécuter un pipeline bio-informatique simple sur le serveur INSP (QC, alignement, annotation ARG).
- Lire et interpréter un rapport bio-informatique, formuler une demande d'analyse, défendre un budget bio-informatique auprès d'un bailleur.
- Identifier les opportunités d'intégration bio-informatique dans DHIS2 et les systèmes de notification nationaux.

### Livrables institutionnels
- Infrastructure réseau déployée et fonctionnelle (connexion au serveur INSP/CRPE depuis la salle de formation).
- Plan national de renforcement de la bio-informatique appliquée à la surveillance 2026–2028.
- Rapport de formation avec recommandations pour un programme de suivi.
- Annuaire des participants formés — réseau national bio-informatique laboratoire.

## Déroulement

| | Détail |
|---|---|
| Date | Du 31 août au 04 septembre 2026 |
| Lieu | Salle bio-informatique INSP + Salle de conférence INSP, Bamako |
| Horaires | 08h00–13h00 (théorie) · 14h00–17h00 (pratique/ateliers) |
| Format | Présentiel |
| Prérequis | Connaissance bureautique de base. Aucune bio-informatique préalable requise. |
| Infrastructure technique | Serveur bio-informatique INSP/CRPE + réseau local (matériel inclus dans budget) |

## Participants (26 au total, 12 structures)

| N° | Structure | Nombre |
|---|---|---|
| 1 | Institut National de Santé Publique (INSP) | 4 |
| 2 | Centre International d'Infectiologie Charles Mérieux (CICM) | 2 |
| 3 | Centre Universitaire de Recherche Clinique (UCRC) | 2 |
| 4 | Laboratoire de Biologie Moléculaire Appliquée (LBMA) | 2 |
| 5 | Institut d'Économie Rurale (EIR) | 2 |
| 6 | Developing Excellence in Leadership and genetics Training for Malaria Elimination (DELGEME) | 2 |
| 7 | Pathogen Genomic Diversity Network Africa (PDNA) | 2 |
| 8 | Parasites & Microbes Research & Training Center (PMRTC) | 2 |
| 9 | Laboratoire Central Vétérinaire (LCV) | 2 |
| 10 | Hôpital du Mali | 2 |
| 11 | CHU Point G | 2 |
| 12 | CHU Gabriel Touré | 2 |
| | **Total** | **26** |

## Programme détaillé

### JOUR 1 — 31/08/2026 — Ouverture, séquençage & bio-informatique, environnement Linux
- **Ouverture de l'atelier et évaluation initiale** : ouverture par le représentant du DG de l'INSP, présentation et validation du calendrier, pré-test.
- **Module 1 — Séquençage et bio-informatique** : technologies de séquençage (1ère à 3ème génération), données générées et leur utilité en santé publique (leçons de COVID-19, Mpox, Diphtéries), résistance antimicrobienne.
- **Module 2 — Environnement Linux et ligne de commande** : navigation (`ls`, `cd`, `cp`, `mv`, `grep`, `nano`), connexion SSH au serveur INSP, organisation des fichiers de données biologiques, exercice de création de répertoire de projet.

### JOUR 2 — 01/09/2026 — Contrôle qualité
- **Module 3 — Contrôle qualité et pre-processing des données NGS** : FastQC, Fastp, exercice guidé sur jeu de données NGS réel (COVID/AMR anonymisées INSP).

### JOUR 3 — 02/09/2026 — Alignement, assemblage, ARG
- **Module 4 — Alignement, assemblage et annotation ARG** : Bowtie2/Minimap2, metaSPAdes, AMRFinderPlus, pipeline complet sur 5 échantillons.

### JOUR 4 — 03/09/2026 — Métagénomique, DHIS2, simulation
- **Module 5 — Métagénomique et profil taxonomique** : Kraken2 + Bracken, Krona, pipeline Snakemake simplifié, mini-rapport de résultats.
- **Module 6 — Bio-informatique et DHIS2** : intégration surveillance, formats JSON/CSV/API, démonstration de remontée d'un résultat.
- **Simulation "Outbreak X"** : émergence fictive d'un pathogène respiratoire dans 3 régions maliennes simultanément ; équipe bio-informatique terrain vs cellule de crise et décision ; livrables (rapport d'analyse + décision motivée) ; debriefing collectif.

### JOUR 5 — 04/09/2026 — Clôture
- Amendement et validation du Plan National de renforcement bio-informatique 2026–2028.
- Restitution au DG INSP et partenaires.
- Cérémonie de remise des attestations.
- Évaluation finale : post-test + questionnaire de satisfaction.

## Évaluation

| Période | Outil | Indicateur cible |
|---|---|---|
| Jour 1 matin | Pré-test (20 questions) | Niveau de départ |
| Chaque matin | Quiz rapide 5 min | Rétention quotidienne |
| Jour 5 | Post-test (même questionnaire) | Gain moyen ≥ 40 % |
| Jour 5 | Questionnaire de satisfaction anonyme | Score ≥ 4/5 |
| 3 mois après | Enquête courte de suivi | Application des acquis |

**Note équipements réseau :** le matériel acquis permettra aux participants de se connecter au serveur bio-informatique INSP/CRPE pendant ET après la formation, pérennisant l'accès pour la surveillance continue.

### Indicateurs clés de succès
- Gain moyen de connaissance pré/post-test ≥ 40 %.
- 100 % des participants capables d'exécuter un QC basique à la fin de la formation.
- Plan d'action bio-informatique 2026–2028 adopté par la direction en séance de clôture.

## Profil des facilitateurs
- **Dr Cheickna Cissé** — Coordinateur adjoint du Master de bio-informatique, Centre d'Excellence Africain en Bio-informatique (ACE-B)
- **Dr Alhadji Alassane Dicko** — Pharmacien, Unité de bio-informatique de l'INSP
- **M. Noumou Yakhouba Keita** — Ingénieur biomédical, Plateforme de surveillance génomique de l'INSP

## Prise en charge des participants
- Forfait transport : 5 000 FCFA par jour et par participant.
- Pause-café et déjeuner par participant et par jour.

## Budget prévisionnel — 10 000 000 FCFA

### Phase préparatoire
| Désignation | Nombre | Fréquence | Forfait | Total |
|---|---|---|---|---|
| Frais de transport | 3 | 3 | 5 000 | 45 000 |
| Pause café et déjeuner | 3 | 3 | 12 000 | 108 000 |
| **Sous-total** | | | | **153 000** |

### Formation
| Désignation | Nombre | Fréquence | Forfait | Total |
|---|---|---|---|---|
| Frais de transport participants | 26 | 5 | 5 000 | 650 000 |
| Pause-café et déjeuner | 32 | 5 | 12 000 | 1 920 000 |
| Location salle | 1 | 5 | 125 000 | 625 000 |
| Kits pédagogiques | 27 | 1 | 1 000 | 27 000 |
| Forfait internet | 1 | 1 | 75 000 | 75 000 |
| Prise en charge des facilitateurs | 3 | 5 | 50 000 | 750 000 |
| Prise en charge superviseurs | 2 | 5 | 50 000 | 500 000 |
| Maintenance MiSeq | 1 | 1 | 4 200 000 | 4 200 000 |
| Accessoires kit bio-informatique | 1 | 1 | 700 000 | 700 000 |
| Projecteur Epson Slim 4K | 1 | 1 | 400 000 | 400 000 |
| **TOTAL GÉNÉRAL** | | | | **10 000 000** |

**Responsable de mise en œuvre :** Dr Boubacar Doumbia, INSP — Chef de Département Laboratoire
