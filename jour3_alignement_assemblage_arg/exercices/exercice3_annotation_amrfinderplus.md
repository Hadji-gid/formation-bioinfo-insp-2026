# Exercice 3 — Annotation ARG avec AMRFinderPlus

**Durée estimée :** 45 min · **Track :** A (exécution) / B (interprétation)

## Objectif
Annoter les gènes de résistance aux antimicrobiens sur des contigs assemblés et interpréter un profil ARG.

## Partie 1 — Lecture d'un exemple (tous)

Ouvrez [`../data/arg_profile_exemple.tsv`](../data/arg_profile_exemple.tsv) et répondez :
1. Combien de gènes ARG différents sont détectés ?
2. Quelles classes d'antibiotiques sont concernées ?
3. Quel gène a la couverture et l'identité les plus élevées vis-à-vis de la référence ? Que signifie concrètement une couverture de 100 % et une identité proche de 100 % ?
4. Le gène `mcr-1.1` (résistance à la colistine) est présent : pourquoi ce gène en particulier justifie-t-il une alerte prioritaire en santé publique ?

## Partie 2 — Exécution sur le serveur INSP (Track A)

```bash
mkdir -p results/arg
amrfinder -n results/assembly/contigs.fasta \
  -o results/arg/sample_amrfinder.tsv --plus
```

Examinez le fichier de sortie :
```bash
column -t -s $'\t' results/arg/sample_amrfinder.tsv | less -S
```

## Partie 3 — Pipeline complet sur 5 échantillons

En groupe (Track A), exécutez la chaîne complète (QC → trimming → assemblage → annotation ARG) sur 5 échantillons fournis par les formateurs, puis comparez les profils ARG obtenus dans un tableau récapitulatif :

| Échantillon | Gènes ARG détectés | Classes concernées | Observations |
|---|---|---|---|
| S1 | | | |
| S2 | | | |
| S3 | | | |
| S4 | | | |
| S5 | | | |

## Discussion finale (Track A + B)
Si 3 des 5 échantillons partagent le même profil ARG inhabituel, quelle serait votre première hypothèse en tant que responsable de laboratoire (contamination croisée en laboratoire, transmission clonale réelle, artefact bio-informatique) ? Quelles vérifications complémentaires demanderiez-vous ?
