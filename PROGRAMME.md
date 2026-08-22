# Programme détaillé — 5 jours

**Dates :** du 31 août au 04 septembre 2026 (validé — TDR du 20/08/2026)
**Horaires :** 08h00–13h00 (théorie) · 14h00–17h00 (pratique / ateliers)
**Format :** Présentiel, INSP Bamako (Salle Bioinformatique + Salle de conférence)

| Jour | Date | Module | Contenu |
|---|---|---|---|
| **J1** | 31/08 | Ouverture + Module 1 — Séquençage et bio-informatique | Mot du représentant DG INSP, validation du calendrier, pré-test. Technologies de séquençage (1ère à 3ème génération), données et leçons des épidémies (COVID-19, Mpox, Diphtéries), résistance antimicrobienne |
| **J1** | 31/08 | Module 2 — Environnement Linux et ligne de commande | Navigation Linux (`ls`, `cd`, `cp`, `mv`, `grep`, `nano`), connexion SSH au serveur INSP, organisation des fichiers de données biologiques, exercice de création de projet |
| **J2** | 01/09 | Module 3 — Contrôle qualité et pre-processing NGS | FastQC (génération/interprétation), Fastp (trimming/filtrage), exercice guidé sur jeu de données NGS réel (COVID/AMR anonymisées) |
| **J3** | 02/09 | Module 4 — Alignement, assemblage et annotation ARG | Alignement (Bowtie2, Minimap2), assemblage de novo (metaSPAdes), annotation ARG (AMRFinderPlus), pipeline complet sur 5 échantillons |
| **J4 (matin)** | 03/09 | Module 5 — Métagénomique et profil taxonomique | Kraken2 + Bracken, visualisation Krona, exercice intégré (pipeline Snakemake simplifié), mini-rapport de résultats |
| **J4 (après-midi)** | 03/09 | Module 6 — Bio-informatique et DHIS2 + Simulation "Outbreak X" | Intégration DHIS2/IDSR (JSON, CSV, API) ; puis scénario fictif d'émergence d'un pathogène respiratoire dans 3 régions maliennes — Track A produit les analyses en temps réel, Track B interprète et décide ; debriefing collectif |
| **J5** | 04/09 | Clôture et certification | Amendement et validation du Plan National Bio-informatique 2026–2028, restitution au DG INSP et partenaires, remise des attestations, post-test + questionnaire de satisfaction |

> ℹ️ **Changement notable (TDR validé du 20/08/2026) :** la simulation "Outbreak X" est désormais programmée le **Jour 4 après-midi** (avec le Module 6 DHIS2), et non plus le Jour 5. Le Jour 5 est désormais consacré exclusivement à la clôture (plan national, restitution, certification, évaluation finale) — voir [`jour5_cloture/`](jour5_cloture/).

## Détail par journée

Voir le `README.md` de chaque dossier `jourX_*/` pour les objectifs pédagogiques, le contenu théorique et les exercices pas-à-pas correspondants.

## Dispositif d'évaluation

| Moment | Outil | Indicateur cible |
|---|---|---|
| Jour 1 matin | Pré-test (26 questions) | Niveau de départ |
| Chaque matin | Quiz rapide 5 min (récapitulatif J-1) | Rétention quotidienne |
| Jour 5 | Post-test (même questionnaire) | Gain moyen ≥ 40% |
| Jour 5 | Questionnaire de satisfaction anonyme | Score ≥ 4/5 |
| 3 mois après | Enquête courte de suivi (formulaire numérique) | Application des acquis |

## Indicateurs clés de succès

- Gain moyen de connaissance pré/post-test ≥ 40 %.
- 100 % des participants Track A capables d'exécuter un QC basique sur le serveur INSP (ou l'environnement local, voir `local_environment/`) à la fin de la formation.
- 1 note de plaidoyer bio-informatique produite par le Track B et validée par la direction INSP.
- Plan d'action bio-informatique 2026–2028 adopté formellement par la direction en séance de clôture (Jour 5).
