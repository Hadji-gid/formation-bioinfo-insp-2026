# Données de l'exercice — Jour 4

## `kraken2_report_exemple.txt`
Rapport taxonomique **factice** au format de sortie réel de Kraken2 (colonnes : % de reads, nombre de reads clade/taxon, code de rang, ID taxonomique, nom). Les pourcentages et taxons sont illustratifs — pathogènes classiquement rencontrés en surveillance (E. coli, Salmonella, S. aureus, M. tuberculosis, virus grippal, SARS-CoV-2) choisis pour leur pertinence pédagogique.

## `dhis2_payload_exemple.json`
Exemple de structure de payload JSON pour l'API DHIS2 (`dataValueSets`), illustrant comment un résultat bio-informatique (pathogène détecté, lignée, profil ARG) peut être traduit en éléments de données DHIS2. Les identifiants (`dataElement`, `orgUnit`) sont des exemples génériques — la configuration réelle DHIS2 de l'INSP devra être fournie par l'administrateur DHIS2 national.
