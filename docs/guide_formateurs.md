# Guide formateurs — Formation Bio-informatique INSP 2026
### 31 août – 04 septembre 2026

## Équipe de facilitation

- **Dr Cheickna Cissé** — Coordinateur adjoint du Master de bio-informatique, Centre d'Excellence Africain en Bio-informatique (ACE-B)
- **Dr Alhadji Alassane Dicko** — Pharmacien, Unité de bio-informatique de l'INSP
- **M. Noumou Yakhouba Keita** — Ingénieur biomédical, Plateforme de surveillance génomique de l'INSP

**Responsable de mise en œuvre :** Dr Boubacar Doumbia, INSP — Chef de Département Laboratoire.

## Rôle attendu des formateurs
- Assurer le lien entre le contenu théorique (matinée) et la pratique encadrée (après-midi).
- Adapter en continu le rythme selon le niveau réel du groupe (hétérogénéité attendue entre structures partenaires).
- Alimenter quotidiennement le suivi des lacunes observées (pour le rapport de formation final).

## Avant la formation
- Prendre connaissance de l'ensemble des modules (`jour1_*` à `jour5_cloture/`) et des jeux de données factices associés.
- Vérifier la disponibilité des outils sur le serveur INSP (voir tableau `ressources/liens_outils.md`) **ou, tant que le serveur n'est pas déployé, tester l'environnement local** (`local_environment/`, exécuter `verifier_environnement.sh`) sur au moins un poste par sous-groupe de participants — voir `logistique/plan_contingence_infrastructure.md`.
- Préparer, en complément des données factices de ce dépôt, les jeux de données réelles anonymisées (COVID/AMR/nasal) qui seront utilisées en séance sur le serveur INSP, une fois celui-ci disponible.
- Participer à la réunion de coordination préformation (J-2, cf. TDR).
- Se familiariser avec le contenu de la nouvelle séance d'ouverture du Jour 1 (Module 1 — séquençage & bio-informatique, incluant la pyramide du laboratoire et les leçons de la COVID-19, Mpox, Diphtérie) — support détaillé dans `ressources/support_discussion_pyramide_laboratoire_covid19.md`.
- **Important :** la simulation "Outbreak X" a lieu le **Jour 4 après-midi** (après le Module 6 DHIS2), pas le Jour 5 — bien caler le minutage du Jour 4, qui est désormais une journée dense (Module 5 + Module 6 + simulation 3h).

## Pendant la formation
- Démarrer chaque matinée (J2–J5) par le quiz rapide de 5 min (`evaluation/quiz_quotidiens.md`).
- Veiller à l'équilibre de participation entre Track A et Track B lors des sessions transversales (DHIS2, simulation Outbreak X — Jour 4).
- Documenter les incidents techniques (accès serveur, réseau) dans un journal de session partagé.

## Gestion des deux tracks
| | Track A — Professionnels | Track B — Leaders |
|---|---|---|
| Objectif | Exécution technique autonome | Interprétation et décision |
| Encadrement | Rapproché, sur poste, en petits groupes | Facilitation de discussion, études de cas |
| Évaluation | Capacité à exécuter un pipeline QC de bout en bout | Capacité à lire un rapport et formuler une décision motivée |

## Après la formation
- Compiler les résultats des pré/post-tests et du questionnaire de satisfaction.
- Rédiger le rapport de formation (`docs/rapport_formation_template.md`).
- Planifier l'enquête de suivi à 3 mois (`evaluation/suivi_3mois.md`).
