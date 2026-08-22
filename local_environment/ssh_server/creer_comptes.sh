#!/usr/bin/env bash
# Crée un compte SSH par participant sur le serveur SSH simulé.
# À exécuter DANS le conteneur : docker exec -it insp-ssh-server bash puis lancer ce script,
# ou directement depuis l'hôte : docker exec insp-ssh-server bash /creer_comptes.sh
#
# Usage : ./creer_comptes.sh <nombre_de_participants> [mot_de_passe_commun]
set -euo pipefail

N=${1:-26}
PASSWORD=${2:-formation2026}

echo "Création de $N comptes (participant1 à participant$N), mot de passe commun : $PASSWORD"

for i in $(seq 1 "$N"); do
    user="participant${i}"
    if id "$user" &>/dev/null; then
        echo "  $user existe déjà, ignoré."
        continue
    fi
    useradd -m -s /bin/bash "$user"
    echo "${user}:${PASSWORD}" | chpasswd
    mkdir -p "/home/${user}/formation2026"
    chown -R "${user}:${user}" "/home/${user}"
    echo "  [OK] $user créé."
done

echo "Terminé. Chaque participant peut se connecter avec :"
echo "  ssh participantN@localhost -p 2222   (remplacer N par son numéro, mot de passe : $PASSWORD)"
