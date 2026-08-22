# Exercice 2 — Connexion SSH au serveur INSP/CRPE

**Durée estimée :** 30 min · **Track :** A (pratique complète) / B (démonstration guidée)

## Objectif
Établir une connexion sécurisée au serveur bio-informatique INSP et vérifier son environnement de travail.

## Deux façons de faire cet exercice

| | Serveur réel | Serveur simulé (local) |
|---|---|---|
| **Quand l'utiliser** | Si le serveur INSP/CRPE est déployé et accessible | Tant que le serveur n'est pas encore disponible (voir `logistique/plan_contingence_infrastructure.md`) |
| **Adresse de connexion** | `ssh <identifiant>@serveur.insp-crpe.ml` | `ssh stagiaire@localhost -p 2222` |
| **Mise en place** | Compte fourni par l'équipe informatique INSP | `docker compose up -d ssh-server` depuis `local_environment/` (voir [`local_environment/README.md`](../../local_environment/README.md)) |

**Les commandes de l'exercice ci-dessous sont strictement identiques dans les deux cas** — seule l'adresse de connexion change. C'est tout l'intérêt du serveur simulé : pratiquer exactement le même geste avant de le refaire sur le vrai serveur.

## Prérequis
- **Serveur réel :** identifiants fournis par l'équipe informatique INSP (utilisateur + clé/mot de passe) ; connexion réseau testée (voir `logistique/infrastructure_reseau_checklist.md`).
- **Serveur simulé :** Docker installé sur votre poste ; aucun identifiant à demander, le compte `stagiaire` (mot de passe `formation2026`) est prêt à l'emploi.

## Étapes

1. Ouvrez un terminal et connectez-vous au serveur :
   ```bash
   # Serveur réel
   ssh <votre_identifiant>@serveur.insp-crpe.ml

   # OU serveur simulé (local)
   ssh stagiaire@localhost -p 2222
   ```
2. Lors de la première connexion, acceptez l'empreinte de sécurité (`fingerprint`) si le message s'affiche — c'est normal et attendu à la première connexion.
3. Une fois connecté, vérifiez votre position :
   ```bash
   pwd
   whoami
   ```
4. Vérifiez l'espace disque disponible dans votre répertoire personnel :
   ```bash
   df -h ~
   ```
5. Créez votre répertoire de travail personnel pour la semaine :
   ```bash
   mkdir -p ~/formation2026/<votre_nom>
   cd ~/formation2026/<votre_nom>
   ```
6. Déconnectez-vous proprement :
   ```bash
   exit
   ```

## Bonnes pratiques de sécurité
- Ne jamais partager vos identifiants de connexion.
- Toujours vous déconnecter (`exit`) en fin de session, surtout sur un poste partagé.
- Signaler immédiatement à l'équipe informatique toute connexion suspecte ou message d'erreur inhabituel.

## Question de vérification
Que signifie le "S" dans SSH, et pourquoi est-ce important lorsqu'on manipule des données de surveillance sanitaire ?
