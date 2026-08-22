# Exercice 4 — Intégration bio-informatique / DHIS2

**Durée estimée :** 30 min · **Track :** A & B (tous)

## Objectif
Comprendre comment un résultat bio-informatique validé est traduit en donnée exploitable dans DHIS2/IDSR.

## Étapes

1. Ouvrez [`../data/dhis2_payload_exemple.json`](../data/dhis2_payload_exemple.json).
2. Identifiez :
   - la structure organisationnelle (`orgUnit`) et la période concernées,
   - les éléments de données (`dataElement`) transmis,
   - les valeurs correspondant au résultat du mini-rapport de l'Exercice 3.
3. À partir du mini-rapport que vous avez produit à l'Exercice 3, remplissez un payload JSON similaire à la main (ou en modifiant une copie du fichier exemple) avec vos propres résultats.
4. Discutez en binôme Track A / Track B : qui, dans le circuit réel INSP, serait responsable de valider un résultat avant sa remontée automatique dans DHIS2 ?

## Démonstration (formateur)
Le formateur présente une démonstration (lecture seule) de la remontée d'un résultat de surveillance génomique dans une instance DHIS2 de test, via l'API `dataValueSets`.

## Question de vérification
Pourquoi est-il essentiel qu'un résultat bio-informatique soit validé par un humain avant remontée automatique dans un système de décision comme DHIS2/IDSR, plutôt que d'automatiser entièrement la chaîne du séquenceur jusqu'à l'alerte ?
