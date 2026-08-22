# Formation en Bioinformatique Appliquée à la Surveillance Épidémiologique
### Institut National de Santé Publique (INSP) — Bamako, Mali · 31 août – 04 septembre 2026

Dépôt officiel des supports de la formation *« Bioinformatique Appliquée à la Surveillance Épidémiologique et à la Réponse aux Urgences de Santé Publique »*, organisée par le Département Laboratoire de l'INSP conformément aux [Termes de Référence, version validée du 20/08/2026](docs/TDR_Formation_Bioinformatique_INSP_2026_20-08-2026-valide.md).

> ⚠️ **Statut infrastructure (mise à jour) :** le serveur bio-informatique INSP/CRPE n'est pas encore déployé au moment de la préparation de cette formation. Un **environnement local (Docker/conda)** reproduisant tous les outils est fourni dans [`local_environment/`](local_environment/), afin que la formation se déroule sans dépendre de cette échéance. Détails : [`logistique/plan_contingence_infrastructure.md`](logistique/plan_contingence_infrastructure.md).

## À propos

Cette formation vise à créer une masse critique de professionnels et de responsables de laboratoire capables d'intégrer la bio-informatique dans leurs pratiques de surveillance et de décision — sans viser à former des bio-informaticiens. Elle s'appuie sur les acquis du Centre de Recherche sur les Pathogènes Émergents (CRPE) et sur le serveur bio-informatique INSP (ou son équivalent local, voir ci-dessus).

| | |
|---|---|
| **Durée** | 5 jours ouvrables |
| **Lieu** | INSP Mali — Salle Bioinformatique + Salle de conférence, Bamako |
| **Participants** | 26 (12 structures partenaires — INSP, CICM, UCRC, LBMA, EIR, DELGEME, PDNA, PMRTC, LCV, Hôpital du Mali, CHU Point G, CHU Gabriel Touré) |
| **Langue** | Français (supports bilingues FR/EN pour les modules techniques) |
| **Budget** | 10 000 000 FCFA |
| **Statut** | Document pour validation — Direction Générale INSP |

## Les deux parcours (Tracks)

La formation distingue deux publics avec des objectifs et des livrables différents :

- **Track A — Professionnels de laboratoire** : exécution pratique de pipelines bio-informatiques sur le serveur INSP ou l'environnement local (QC, alignement, assemblage, annotation ARG, métagénomique).
- **Track B — Responsables / Leaders** : lecture et interprétation de rapports bio-informatiques, formulation de demandes d'analyse, plaidoyer budgétaire, décision en situation d'urgence.

Les deux tracks se rejoignent lors des sessions transversales (DHIS2, simulation Outbreak X, clôture).

## Structure du dépôt

```
formation-bioinfo-insp-2026/
├── jour1_linux_ssh/              # Ouverture + Module 1 (Séquençage/bio-informatique) + Module 2 (Linux, connexion serveur)
├── jour2_qc_preprocessing/       # Module 3 — Contrôle qualité et pre-processing NGS
├── jour3_alignement_assemblage_arg/  # Module 4 — Alignement, assemblage, annotation ARG
├── jour4_metagenomique_dhis2/    # Module 5 — Métagénomique + Module 6 — DHIS2 + Simulation "Outbreak X"
├── jour5_cloture/                # Clôture, Plan National, certification (journée dédiée)
├── local_environment/            # Environnement local (Docker/conda) — repli tant que le serveur INSP n'est pas déployé
├── evaluation/                   # Pré/post-tests, quiz quotidiens, questionnaires
├── logistique/                   # Guide de connexion, checklist réseau, budget, plan de contingence infrastructure
├── ressources/                   # Glossaire, outils, bibliographie, support de discussion pyramide/COVID-19
├── docs/                         # TDR, guide formateurs, template de rapport
└── .github/                      # Modèles d'issues pour le suivi de la formation
```

> ℹ️ **Changement de programme (TDR validé du 20/08/2026) :** la simulation "Outbreak X" a lieu désormais le **Jour 4** (après le Module 6), pas le Jour 5. Le Jour 5 est une journée de clôture uniquement.

Chaque dossier `jourX_*` contient :
- un `README.md` avec les objectifs pédagogiques et le contenu théorique résumé,
- un sous-dossier `slides/` avec le **support PowerPoint de l'exposé théorique du matin** (le nombre de diapositives varie selon la densité du jour : 7 pour J2/J3, 11 pour J1 et J4 — journées les plus chargées avec respectivement l'ouverture/pyramide du laboratoire et la simulation Outbreak X —, 7 pour J5 clôture),
- un sous-dossier `exercices/` avec des travaux dirigés pas-à-pas pour l'après-midi,
- un sous-dossier `data/` avec des **jeux de données factices/anonymisés** générés pour la formation (aucune donnée patient réelle).

## Supports PowerPoint

| Jour | Fichier |
|---|---|
| J1 | [`jour1_linux_ssh/slides/Jour1_Module1_Linux_SSH.pptx`](jour1_linux_ssh/slides/Jour1_Module1_Linux_SSH.pptx) |
| J2 | [`jour2_qc_preprocessing/slides/Jour2_Module2_QC_Preprocessing.pptx`](jour2_qc_preprocessing/slides/Jour2_Module2_QC_Preprocessing.pptx) |
| J3 | [`jour3_alignement_assemblage_arg/slides/Jour3_Module3_Alignement_Assemblage_ARG.pptx`](jour3_alignement_assemblage_arg/slides/Jour3_Module3_Alignement_Assemblage_ARG.pptx) |
| J4 | [`jour4_metagenomique_dhis2/slides/Jour4_Modules5-6_Metagenomique_DHIS2_Simulation.pptx`](jour4_metagenomique_dhis2/slides/Jour4_Modules5-6_Metagenomique_DHIS2_Simulation.pptx) |
| J5 | [`jour5_cloture/slides/Jour5_Cloture.pptx`](jour5_cloture/slides/Jour5_Cloture.pptx) |

Chaque deck reprend fidèlement le contenu théorique du `README.md` du module correspondant (objectifs, notions clés, commandes, tableaux de synthèse) avec une identité visuelle propre par journée, et inclut des visuels générés à partir des données réelles de la formation (graphique de qualité, schémas de pipeline) pour faciliter la compréhension.

## Pipeline Snakemake (Jour 4)

[`jour4_metagenomique_dhis2/pipeline/`](jour4_metagenomique_dhis2/pipeline/) contient un **pipeline Snakemake réel et testé** (FastQC → Fastp → FastQC → Kraken2 → MultiQC), livré avec une mini-base Kraken2 de test permettant de l'exécuter de bout en bout sans connexion internet ni base de données réelle. Voir son [README dédié](jour4_metagenomique_dhis2/pipeline/README.md) pour le détail et les instructions de bascule vers les données/bases réelles du serveur INSP.

## Prérequis

- Connaissance bureautique de base. Aucune bio-informatique préalable requise.
- Un ordinateur portable capable d'exécuter Docker (recommandé) ou conda/mamba — voir [`local_environment/`](local_environment/). Un client SSH (Terminal sous Mac/Linux, ou [PuTTY](https://www.putty.org)/Windows Terminal sous Windows) reste utile pour la connexion au serveur INSP une fois celui-ci disponible.
- Accès à l'infrastructure réseau INSP/CRPE **si disponible** (voir [`logistique/guide_connexion_ssh_serveur_insp.md`](logistique/guide_connexion_ssh_serveur_insp.md)) — non bloquant pour suivre la formation, voir [`logistique/plan_contingence_infrastructure.md`](logistique/plan_contingence_infrastructure.md).

## Comment utiliser ce dépôt

```bash
git clone https://github.com/<votre-organisation>/formation-bioinfo-insp-2026.git
cd formation-bioinfo-insp-2026
```

Chaque participant peut suivre le programme dans l'ordre (`jour1` → `jour5`), consulter les exercices et travailler sur les jeux de données factices fournis, en utilisant l'[environnement local](local_environment/) tant que le serveur INSP n'est pas déployé, puis rejouer les mêmes commandes sur le serveur INSP avec les données réelles anonymisées une fois celui-ci disponible, sous la supervision des formateurs.

## Livrables institutionnels attendus

- Infrastructure réseau déployée et fonctionnelle (voir `logistique/plan_contingence_infrastructure.md` — **livrable révisé/reporté**, suivi désormais en parallèle de la formation ; solution de repli opérationnelle via `local_environment/`).
- Plan national de renforcement de la bio-informatique en surveillance 2026–2028 (`jour5_cloture/cloture/template_plan_national_bioinfo_2026_2028.md`).
- Rapport de formation avec recommandations (`docs/rapport_formation_template.md`).
- Annuaire des participants formés — réseau national bio-informatique laboratoire.

## Contact

Département Laboratoire — INSP Mali · Équipe bio-informatique CRPE

---
*Document de travail — INSP Mali, formation du 31 août au 04 septembre 2026. Distribution restreinte aux participants et partenaires de la formation.*
