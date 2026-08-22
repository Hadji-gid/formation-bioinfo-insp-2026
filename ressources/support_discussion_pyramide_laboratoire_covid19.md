# Support de discussion — La pyramide du laboratoire et la bio-informatique : leçons de la COVID-19

*Document formateur — support détaillé pour l'animation de l'Exercice 0, Jour 1 (Module 1 — Séquençage et bio-informatique). Répond à l'Objectif spécifique 2 du TDR de la formation : "Illustrer concrètement, à travers les leçons de la COVID-19, comment la pyramide du laboratoire s'articule avec les outils bio-informatiques à chaque niveau." Le Module 1 élargit également la focale à deux autres épisodes récents (Mpox 2025, résurgence de la diphtérie depuis 2023) — ce document reste centré sur la COVID-19, exemple le plus détaillé et le plus vécu par les participants, mais le formateur peut faire des ponts vers ces deux autres cas présentés en séance.

## 1. Pourquoi commencer par ce sujet ?

Cette formation ne vise pas à former des bio-informaticiens, mais à créer une **culture commune** entre professionnels de laboratoire (Track A) et responsables/leaders (Track B). Avant d'entrer dans les commandes et les pipelines, chacun doit pouvoir situer son propre rôle dans la chaîne complète — du prélèvement à la décision. La COVID-19 offre un exemple vécu par tous les participants, ce qui en fait un point d'entrée pédagogique efficace.

## 2. La pyramide du laboratoire au Mali — détail par niveau

### Niveau national de référence — INSP/LRB, CRPE
- Réceptionne les échantillons et/ou séquences transmis par les niveaux inférieurs.
- Réalise le séquençage complet (NGS) et l'ensemble de la chaîne bio-informatique : contrôle qualité, assemblage/alignement, annotation (ARG, taxonomie), classification des variants, analyse phylogénétique.
- Soumet les données aux bases internationales de partage (type GISAID) et aux réseaux régionaux (Africa CDC).
- Produit la synthèse épidémiologique qui alimente la décision nationale (via DHIS2/IDSR — voir Jour 4).
- Le Centre de Recherche sur les Pathogènes Émergents (CRPE), inauguré en juillet 2025 avec des laboratoires P3 et P2, renforce structurellement cette capacité et positionne l'INSP comme un nœud bio-informatique émergent pour l'Afrique de l'Ouest sahélienne.

### Niveau intermédiaire régional — LBMA, UCRC, CICM
- Réalise le criblage RT-PCR et, selon les capacités, un séquençage partiel.
- Prépare et transmet les échantillons ou données brutes vers le niveau national.
- Rôle pivot : c'est souvent ici que se joue la **rapidité** de la remontée d'information (délai de transport, qualité de conservation des échantillons, complétude des métadonnées).

### Niveau périphérique — sites de diagnostic rapide
- Réalise le prélèvement et les tests de dépistage de première ligne (antigéniques, RT-PCR simple).
- Ne pratique pas de bio-informatique directement, mais **génère la matière première** : sans prélèvement de qualité et métadonnées correctes à ce niveau, rien de ce qui suit n'est exploitable.
- C'est aussi le niveau le plus proche de la population — celui qui capte le signal épidémiologique en premier.

**Message clé pour la discussion :** la pyramide n'est pas qu'une hiérarchie administrative, c'est un **circuit d'information à double sens** — les échantillons/données montent, les résultats et décisions redescendent (alertes, ajustement des protocoles, retour aux structures régionales et périphériques).

## 3. Chronologie détaillée — la COVID-19 au Mali et en Afrique

| Période | Événement | Portée pour la formation |
|---|---|---|
| **Mars 2020** | Début officiel de l'épidémie de COVID-19 au Mali | Point de départ : la pyramide sanitaire malienne (dépistage, y compris à l'INSP même, qui a testé jusqu'à plusieurs centaines de voyageurs et cas suspects par jour) est mobilisée en urgence. |
| **2020** | L'OMS et l'Africa CDC établissent un réseau africain de laboratoires de séquençage COVID-19 | Première tentative de structuration régionale de la capacité de séquençage — préfigure les réseaux dans lesquels s'inscrit aujourd'hui l'INSP/CRPE. |
| **2020-2021** | Plus de 43 000 séquences produites par ce réseau africain ; pourtant l'Afrique ne représente qu'environ **1 %** du séquençage mondial du SARS-CoV-2 à cette période | Illustre concrètement le déficit de capacité locale que cette formation vise à combler. L'OMS recommandait que les pays acheminent au moins 5 % de leurs échantillons positifs vers un laboratoire de séquençage de référence — un objectif difficile à tenir sans capacité nationale suffisante. |
| **Avril–Octobre 2021** | Vagues successives de COVID-19 au Mali ; les variants Alpha, Beta et Delta sont caractérisés dans le pays (étude publiée : *Dynamics of SARS-CoV-2 variants characterized during different COVID-19 waves in Mali*) | Premier exemple concret, malien, de séquençage génomique utilisé pour caractériser la circulation virale — exactement le type de travail que les participants Track A s'exercent à reproduire cette semaine (Jours 2-4). |
| **2021-2023** | Programme **AFROSCREEN** (Initiative Santé en Commun, coordination Africa CDC) : renforcement de la capacité de séquençage dans 13 pays africains dont le Mali — objectif d'environ 34 000 séquences et 54 000 PCR de criblage via 19 laboratoires | Exemple concret de coopération internationale ciblant précisément le maillon "capacité locale" identifié comme faible en 2020-2021. |
| **2022-2024** | Étude INSP (R. Sanogo et al.) sur la diversité des variants SARS-CoV-2 par RT-PCR de criblage au Mali : circulation des sous-variants Omicron documentée | Preuve que la chaîne pyramide → séquençage → analyse bio-informatique → publication fonctionne déjà à l'INSP, sur laquelle cette formation vient bâtir. |
| **Juillet 2025** | Inauguration du CRPE (laboratoires P3/P2) | Aboutissement institutionnel de cette trajectoire — et point de départ de la présente formation. |

*Sources : OMS/AFRO, Africa CDC, Institut Pasteur (AFROSCREEN), ScienceDirect (Dynamics of SARS-CoV-2 variants... Mali), actes de congrès AFROSCREEN 2024, TDR de la formation.*

## 4. Ce que la COVID-19 enseigne sur l'articulation pyramide/bio-informatique

1. **Le goulot d'étranglement n'est presque jamais au moment du prélèvement, mais dans la chaîne qui suit.** Un pays peut prélever des milliers d'échantillons par jour (comme l'a fait l'INSP en 2020) sans pour autant produire une information épidémiologique exploitable, si la capacité d'analyse bio-informatique en aval est insuffisante.
2. **La centralisation du séquençage au niveau national n'est utile que si la remontée est rapide.** Un variant détecté trois mois après sa circulation réelle a une valeur opérationnelle très limitée pour la décision.
3. **La coopération régionale/internationale (Africa CDC, AFROSCREEN) comble un déficit, mais ne remplace pas une capacité nationale pérenne** — d'où l'investissement dans le CRPE et cette formation elle-même.
4. **Chaque niveau de la pyramide a besoin d'un niveau de culture bio-informatique différent, pas nécessairement d'une expertise technique complète** — ce qui justifie directement la distinction Track A (exécution) / Track B (interprétation et décision) de cette formation.

## 5. Grille d'animation pour le formateur

| Temps | Action | Points de vigilance |
|---|---|---|
| 0-5 min | Introduire le sujet à partir du vécu personnel des participants pendant la COVID-19 (« Où étiez-vous, que faisiez-vous en mars 2020 ? ») | Éviter de tourner en débat purement sanitaire/politique — recentrer vite sur la question de l'information et des données. |
| 5-10 min | Projeter la frise chronologique et le schéma de la pyramide (slides dédiées) | Bien insister sur le chiffre "1 % du séquençage mondial" — c'est le déclic pédagogique le plus efficace pour justifier l'existence même de la formation. |
| 10-25 min | Questions de discussion en sous-groupes (voir Exercice 0) | Veiller à mélanger Track A et Track B dans chaque sous-groupe — l'objectif est justement de faire dialoguer les deux perspectives. |
| 25-30 min | Restitution courte, notée par le formateur | Les goulots d'étranglement identifiés par les participants doivent être conservés (photo du paperboard, note) : ils seront réutilisés le Jour 5 pour nourrir le Plan National Bio-informatique 2026–2028. |

## 6. Pour prolonger (facultatif, entre midi et deux ou en fin de semaine)
- Demander aux participants de la région de Ségou ou Sikasso s'ils ont un souvenir précis du délai réel entre prélèvement et résultat pendant la pandémie — ancrage local supplémentaire.
- Relier explicitement cette discussion à la simulation "Outbreak X au Mali" du Jour 5, qui rejoue un scénario structurellement identique.
