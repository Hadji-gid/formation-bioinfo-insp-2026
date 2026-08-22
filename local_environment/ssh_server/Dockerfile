# =============================================================================
# Serveur SSH simulé — Exercice 2, Jour 1
# Formation Bio-informatique INSP 2026
# =============================================================================
# Simule une vraie connexion SSH à "un serveur INSP/CRPE", pour pratiquer
# l'Exercice 2 (jour1_linux_ssh/exercices/exercice2_connexion_ssh.md) sans
# dépendre du serveur réel. Le mécanisme (utilisateur, mot de passe, port,
# authentification) a été testé de bout en bout avant d'être intégré ici —
# voir la note de validation dans local_environment/README.md.
#
# Construction :
#   docker build -t insp-ssh-server .
# Démarrage :
#   docker run -d --name insp-ssh-server -p 2222:22 insp-ssh-server
# Connexion (depuis un autre terminal, exactement comme dans l'exercice) :
#   ssh stagiaire@localhost -p 2222        (mot de passe : formation2026)
# =============================================================================

FROM ubuntu:24.04

LABEL maintainer="INSP Mali - Departement Laboratoire"
LABEL description="Serveur SSH simule pour l'exercice de connexion du Jour 1"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        openssh-server \
        nano \
        grep \
        coreutils \
        findutils \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/run/sshd

# Port dédié (2222) pour ne jamais entrer en conflit avec un vrai serveur SSH
RUN sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && sed -i 's/PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

# Compte(s) de formation — un compte partagé "stagiaire" par défaut.
# Pour créer un compte par participant, voir creer_comptes.sh dans ce dossier.
RUN useradd -m -s /bin/bash stagiaire \
    && echo "stagiaire:formation2026" | chpasswd \
    && mkdir -p /home/stagiaire/formation2026 \
    && chown -R stagiaire:stagiaire /home/stagiaire

EXPOSE 22

# Message d'accueil affiché à la connexion, pour ancrer l'exercice
RUN echo '\n=== Serveur SSH simulé — Formation Bio-informatique INSP 2026 ===\nCeci est un environnement LOCAL qui simule la connexion au serveur INSP/CRPE.\nVoir jour1_linux_ssh/exercices/exercice2_connexion_ssh.md pour la suite.\n' > /etc/motd

CMD ["/usr/sbin/sshd", "-D"]
