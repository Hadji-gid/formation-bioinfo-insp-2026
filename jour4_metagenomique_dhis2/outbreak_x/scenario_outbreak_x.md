# Scénario — "Outbreak X au Mali"

## Contexte fictif
Depuis 10 jours, une augmentation inhabituelle de syndromes respiratoires fébriles est signalée simultanément dans **trois régions maliennes** : Bamako (District 4), Ségou et Sikasso. Les cas se concentrent dans des établissements scolaires et des marchés. Le système IDSR a déclenché une alerte de niveau 2.

Le CRPE/INSP reçoit, via ses laboratoires partenaires (LBMA, UCRC, CICM), un premier lot de 9 échantillons respiratoires (3 par région) pour analyse bio-informatique en urgence.

## Objectif de la simulation
Reproduire, en conditions de temps contraint (3h), le circuit complet **échantillon → analyse bio-informatique → interprétation → décision de santé publique**, en mobilisant Track A et Track B de façon coordonnée.

## Déroulement

| Temps | Étape |
|---|---|
| T+0 | Briefing général : présentation du scénario et remise des jeux de données par région à Track A |
| T+0 à T+1h30 | Track A : QC → alignement/assemblage → annotation ARG et/ou profil taxonomique sur les 9 échantillons |
| T+1h à T+2h | Track B : préparation du cadre de décision (quelles questions poser, quels seuils déclenchent quelle action) en parallèle |
| T+1h30 | Point de synchronisation : Track A transmet un rapport intermédiaire à Track B |
| T+1h30 à T+2h30 | Track B interprète les résultats et rédige la décision de santé publique motivée |
| T+2h30 à T+3h | Debriefing collectif (Track A + Track B + formateurs) |

## Données de la simulation
Les formateurs fournissent, le matin même, 9 jeux de données FASTQ anonymisées (3 par région) construits à partir des jeux d'exercices des jours précédents, avec des profils volontairement différenciés entre régions pour nourrir la discussion (ex. une région avec un profil ARG préoccupant, une autre avec une co-détection virale).

## Contrainte pédagogique clé
Track B **ne doit pas** accéder directement aux données brutes ni exécuter les pipelines : la simulation reproduit volontairement la séparation réelle des rôles, pour entraîner la communication structurée entre les deux équipes (rapport écrit, points de synchronisation, questions de clarification).

## Debriefing — questions guides
- Le rapport transmis par Track A était-il compréhensible et actionnable pour Track B sans connaissances techniques préalables ?
- Track B a-t-il posé les bonnes questions à Track A pour affiner la décision ?
- Quel a été le principal goulot d'étranglement (temps de calcul, clarté de communication, données manquantes) ?
- Que faudrait-il changer dans le circuit réel INSP pour gagner en réactivité lors d'une vraie alerte ?
