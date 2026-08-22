# Note de cadrage — Révision de l'Objectif spécifique 4 du TDR

**À :** Direction Générale INSP · Coordination formation
**Objet :** Adaptation du dispositif de formation face au retard de déploiement de l'infrastructure réseau
**Réfère à :** TDR — Formation en Bio-informatique Appliquée, Objectif spécifique 4 : *« Mettre en place l'infrastructure réseau nécessaire à la connexion aux serveurs bio-informatiques de l'INSP pour les formations et la surveillance continue »*

## 1. Constat

À la date de préparation des supports de formation, le serveur bio-informatique INSP/CRPE et l'infrastructure réseau associée ne sont **pas encore déployés**. Le TDR (Section VII) prévoyait la réception et le test du matériel réseau au minimum 7 jours avant le début de la formation ; cette échéance ne peut être garantie en l'état.

Or, dans la conception initiale du programme, la quasi-totalité des travaux pratiques (Jours 1 à 4) suppose une connexion SSH au serveur INSP/CRPE. Un maintien strict de cette dépendance ferait courir un risque réel d'annulation ou de report de la formation dans son ensemble.

## 2. Analyse — ce qui dépend réellement du serveur

L'Objectif 4 du TDR recouvre en réalité **deux finalités distinctes**, qu'il convient de découpler :

| Finalité | Dépend du serveur INSP/CRPE ? |
|---|---|
| **Acquisition des compétences individuelles** (Track A : exécuter un pipeline QC/alignement/ARG ; Track B : lire et interpréter un rapport) | **Non** — reproductible à l'identique sur un environnement local correctement outillé |
| **Continuité de la surveillance génomique après la formation** (connexion pérenne, accès aux données réelles et aux bases de données de référence complètes) | **Oui** — c'est la finalité propre à l'infrastructure serveur, non substituable |

Cette distinction permet de proposer une solution qui ne sacrifie ni le calendrier de la formation, ni l'atteinte de ses objectifs pédagogiques.

## 3. Solution proposée

### 3.1 Court terme — pendant la formation
Un **environnement local reproduisant l'ensemble des outils du serveur INSP** (FastQC, Fastp, Kraken2, Bracken, AMRFinderPlus, Snakemake, etc.) est mis à disposition de chaque participant, installable sur son propre poste via Docker ou conda — voir [`../local_environment/`](../local_environment/). Les exercices des Jours 1 à 4 ont été conçus pour fonctionner indifféremment sur cet environnement local ou sur le serveur INSP, avec des jeux de données factices/anonymisées et une mini-base Kraken2 de test permettant une exécution complète hors ligne.

Un **serveur SSH simulé** (testé et fonctionnel) complète ce dispositif pour l'Exercice 2 du Jour 1 : les participants pratiquent une vraie connexion SSH authentifiée (`ssh stagiaire@localhost -p 2222`), avec les commandes strictement identiques à celles qu'ils utiliseront sur le vrai serveur INSP/CRPE le moment venu.

**Conséquence directe :** la formation peut se dérouler aux dates prévues, sans dépendre de la disponibilité du serveur, et sans dégrader l'atteinte des indicateurs de succès du TDR (gain pré/post-test, capacité Track A à exécuter un QC, etc.).

### 3.2 Moyen terme — après la formation
Le déploiement du serveur bio-informatique INSP/CRPE et de son infrastructure réseau reste un **chantier institutionnel à part entière**, distinct du calendrier de la formation, à piloter en parallèle par l'équipe informatique et la Direction Administrative. Recommandations :
- Maintenir le budget prévu (Section VII du TDR — maintenance MiSeq, kit bio-informatique, projecteur, forfaits internet) pour cette finalité propre.
- Fixer une échéance de déploiement révisée, communiquée aux participants formés (qui pourront alors migrer leurs habitudes de travail de l'environnement local vers le serveur réel sans changement de commandes).
- Organiser une **session de transition courte** (demi-journée) une fois le serveur opérationnel, pour connecter les participants déjà formés et valider l'accès individuel de chacun.

## 4. Impact sur les livrables institutionnels du TDR

| Livrable (TDR) | Statut révisé |
|---|---|
| Infrastructure réseau déployée et fonctionnelle | **Reporté** — devient un livrable post-formation, suivi séparément (cf. 3.2) |
| Plan national de renforcement bio-informatique 2026-2028 | Inchangé — sera enrichi d'un axe explicite sur le déploiement de l'infrastructure (cf. Jour 5) |
| Rapport de formation avec recommandations | Inchangé — intégrera un bilan de l'utilisation de l'environnement local comme solution transitoire |
| Annuaire des participants formés | Inchangé |

## 5. Décision demandée

Validation par la Direction Générale INSP de :
1. Le maintien des dates de formation, sur la base de l'environnement local comme solution principale d'exécution pratique.
2. Le traitement du déploiement de l'infrastructure réseau comme chantier parallèle, avec échéance à fixer et à communiquer à l'équipe bio-informatique et aux participants.
3. L'intégration de cette question dans le Plan National Bio-informatique 2026-2028 restitué le Jour 5.

---
*Document préparé par l'équipe pédagogique dans le cadre de la préparation de la formation — à joindre au dossier TDR pour validation.*
