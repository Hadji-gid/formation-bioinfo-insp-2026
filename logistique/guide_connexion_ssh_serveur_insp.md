# Guide de connexion SSH au serveur bio-informatique INSP/CRPE

> ℹ️ **Serveur pas encore disponible ?** Un [serveur SSH simulé](../local_environment/README.md#serveur-ssh-simulé-exercice-2-jour-1) (testé et fonctionnel) permet de pratiquer la connexion avec les mêmes commandes (`ssh stagiaire@localhost -p 2222`). L'[environnement local](../local_environment/) complet (Docker/conda) reproduit par ailleurs tous les outils bio-informatiques pour les Jours 2 à 4. Ce guide reste la référence pour la connexion une fois le vrai serveur opérationnel.

## 1. Avant la formation (équipe informatique INSP)
- Créer un compte utilisateur individuel pour chaque participant (pas de comptes partagés).
- Générer et distribuer les identifiants de façon sécurisée (canal séparé du support de formation).
- Vérifier l'accès réseau depuis la salle de formation vers le serveur (test complet **J-7 minimum**, conformément au TDR).
- Prévoir un compte de secours par formateur en cas de problème d'accès individuel.

## 2. Connexion — Windows
1. Ouvrir Windows Terminal (ou PowerShell).
2. Exécuter :
   ```powershell
   ssh identifiant@serveur.insp-crpe.ml
   ```
   Alternative graphique : [PuTTY](https://www.putty.org) (renseigner l'adresse du serveur, port 22).

## 3. Connexion — macOS / Linux
```bash
ssh identifiant@serveur.insp-crpe.ml
```

## 4. Première connexion
- Accepter l'empreinte de sécurité (`fingerprint`) affichée au premier lancement — normal et attendu.
- Changer le mot de passe temporaire fourni dès la première connexion si applicable :
  ```bash
  passwd
  ```

## 5. Problèmes fréquents

| Symptôme | Cause probable | Solution |
|---|---|---|
| `Connection refused` | Serveur inaccessible / pare-feu | Vérifier le réseau, contacter l'équipe informatique |
| `Permission denied` | Identifiant/mot de passe incorrect | Revérifier les identifiants transmis |
| Connexion très lente | Réseau local surchargé | Vérifier le nombre de connexions simultanées, la qualité du Wi-Fi/Ethernet |
| `Host key verification failed` | Le serveur a changé de clé (réinstallation) | Contacter l'équipe informatique avant de forcer la suppression de l'ancienne clé |

## 6. Bonnes pratiques
- Toujours se déconnecter (`exit`) en fin de session.
- Ne jamais transmettre son mot de passe/clé à un tiers.
- Signaler tout comportement anormal immédiatement à l'équipe informatique INSP.
