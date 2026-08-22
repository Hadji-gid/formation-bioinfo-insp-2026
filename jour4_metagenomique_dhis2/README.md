# Jour 4 — Métagénomique, DHIS2 et simulation "Outbreak X" (03/09/2026)

*Module 5, Module 6 et simulation intégrée — conformément au programme validé du TDR (20/08/2026), la simulation "Outbreak X" a lieu cette journée, après le Module 6, et non plus le Jour 5.*

## Objectifs pédagogiques

À la fin de cette journée, chaque participant sera capable de :
- Profiler un échantillon clinique métagénomique avec Kraken2 et Bracken.
- Interpréter un graphe taxonomique généré avec Krona.
- Comprendre le fonctionnement d'un pipeline Snakemake simplifié intégrant les étapes des jours précédents.
- Comprendre comment les résultats bio-informatiques alimentent DHIS2 et le système IDSR (formats JSON, CSV, API).
- Mobiliser l'ensemble des compétences acquises (J1–J3) dans un scénario de simulation intégré, en collaboration Track A / Track B.

**Track A** : exécution du pipeline métagénomique, production d'un mini-rapport, puis production des analyses en temps réel lors de la simulation.
**Track B** : lecture des résultats taxonomiques, compréhension du flux DHIS2/IDSR, puis interprétation et décision lors de la simulation.

## Matinée — Module 5 : Métagénomique et profil taxonomique

### 1. Kraken2 + Bracken — profilage taxonomique
Kraken2 classe chaque read en le comparant à une base de données de k-mers associée à des taxons connus. Bracken affine ensuite les estimations d'abondance relative.

```bash
kraken2 --db /data/kraken2_db --paired \
  processed/clean_R1.fastq.gz processed/clean_R2.fastq.gz \
  --report results/kraken2/sample_report.txt \
  --output results/kraken2/sample_output.txt

bracken -d /data/kraken2_db -i results/kraken2/sample_report.txt \
  -o results/kraken2/sample_bracken.txt -l S
```

### 2. Visualisation avec Krona
Krona transforme un rapport Kraken2 en graphe interactif en anneaux, très utile pour une lecture rapide par des non-spécialistes (Track B).

```bash
kreport2krona.py -r results/kraken2/sample_report.txt -o results/kraken2/sample.krona.txt
ktImportText results/kraken2/sample.krona.txt -o results/kraken2/sample_krona.html
```

Un exemple de rapport Kraken2 factice est fourni dans [`data/kraken2_report_exemple.txt`](data/kraken2_report_exemple.txt) pour s'entraîner à la lecture avant l'exécution réelle.

### 3. Pipeline Snakemake simplifié
Snakemake permet d'enchaîner automatiquement QC → trimming → assemblage/alignement → annotation → profilage, en garantissant la reproductibilité. Un **pipeline réel et testé** est fourni dans [`pipeline/`](pipeline/) (Snakefile + config.yaml + mini-base Kraken2 de test) — voir [`pipeline/README.md`](pipeline/README.md).

## Après-midi (1/2) — Module 6 : Bio-informatique et DHIS2

Les résultats bio-informatiques (détection de variant, profil ARG, classification taxonomique) doivent être **traduits en information actionnable** pour le système national de surveillance.

| Format | Usage typique |
|---|---|
| **CSV** | Export tabulaire simple pour import manuel/batch dans DHIS2 |
| **JSON** | Échange structuré via API DHIS2 (`dataValueSets`), automatisable |
| **API REST DHIS2** | Remontée automatique d'un résultat de surveillance génomique dès sa validation |

Un exemple de payload JSON DHIS2 est fourni dans [`data/dhis2_payload_exemple.json`](data/dhis2_payload_exemple.json).

## Après-midi (2/2) — Simulation "Outbreak X au Mali"

**Scénario :** émergence simultanée d'un pathogène respiratoire dans 3 régions maliennes (Bamako, Ségou, Sikasso). Voir le scénario complet : [`outbreak_x/scenario_outbreak_x.md`](outbreak_x/scenario_outbreak_x.md).

| Rôle | Composition | Mission |
|---|---|---|
| **Track A** — équipe bio-informatique terrain | Sous-groupes Track A | Produire les analyses en temps réel (QC → alignement/assemblage → ARG/taxonomie) |
| **Track B** — cellule de crise et décision | Groupe Track B | Interpréter les résultats transmis par Track A et formuler une décision de santé publique motivée |

Détail des rôles : [`outbreak_x/roles_track_a.md`](outbreak_x/roles_track_a.md) · [`outbreak_x/roles_track_b.md`](outbreak_x/roles_track_b.md)

**Livrables :**
- Rapport d'analyse bio-informatique (Track A) — template : [`outbreak_x/livrable_template_rapport_analyse.md`](outbreak_x/livrable_template_rapport_analyse.md)
- Décision de santé publique motivée (Track B) — template : [`outbreak_x/livrable_template_decision_sante_publique.md`](outbreak_x/livrable_template_decision_sante_publique.md)

**Debriefing collectif :** qu'est-ce qui a fonctionné ? Quelles lacunes restent (techniques, organisationnelles, de communication entre les deux tracks) ?

## Jeux de données de la journée
- [`data/kraken2_report_exemple.txt`](data/kraken2_report_exemple.txt) — rapport taxonomique factice au format Kraken2 réel.
- [`data/dhis2_payload_exemple.json`](data/dhis2_payload_exemple.json) — exemple de payload d'import DHIS2.
- [`outbreak_x/`](outbreak_x/) — scénario, rôles et templates de livrables pour la simulation.

## Exercices et activités du jour
1. [Exercice 1 — Kraken2 + Bracken](exercices/exercice1_kraken2_bracken.md)
2. [Exercice 2 — Visualisation Krona](exercices/exercice2_krona_visualisation.md)
3. [Exercice 3 — Pipeline Snakemake simplifié](exercices/exercice3_pipeline_snakemake_simplifie.md)
4. [Exercice 4 — Intégration DHIS2](exercices/exercice4_dhis2_integration.md)
5. [Simulation Outbreak X — scénario complet](outbreak_x/scenario_outbreak_x.md)

## Points de vigilance formateur
- Le module DHIS2 doit rester conceptuel et pratique (lecture/modification d'un JSON exemple) — pas d'accès en écriture à une instance DHIS2 réelle pendant la formation.
- **Journée dense** : Module 5 + Module 6 + simulation complète (3h) dans une seule journée. Bien respecter le minutage — voir [`outbreak_x/scenario_outbreak_x.md`](outbreak_x/scenario_outbreak_x.md) pour le détail horaire de la simulation. Prévoir de démarrer le Module 6 (DHIS2) tôt dans l'après-midi pour garantir les 3h nécessaires à la simulation.
- Prévoir un mini-rapport à produire par chaque participant Track A en fin de matinée (livrable attendu selon le TDR), distinct du rapport de simulation de l'après-midi.
- Un modérateur dédié pour l'interface Track A / Track B est recommandé pendant la simulation, afin d'éviter que les deux groupes travaillent en silos.
