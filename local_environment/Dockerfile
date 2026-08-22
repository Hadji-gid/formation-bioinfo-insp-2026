# =============================================================================
# Environnement local de repli — Formation Bio-informatique INSP 2026
# =============================================================================
# Reproduit tous les outils utilisés pendant la formation (FastQC, Fastp,
# Bowtie2, Minimap2, metaSPAdes, Kraken2, Bracken, Krona, AMRFinderPlus,
# Snakemake, MultiQC, samtools, seqkit), afin que les Jours 1 à 4 soient
# exécutables sur le PC de chaque participant, indépendamment de la
# disponibilité du serveur INSP/CRPE (cf. Objectif 4 du TDR, en cours de
# déploiement — voir ../logistique/plan_contingence_infrastructure.md).
#
# Construction :
#   docker build -t insp-bioinfo .
# Utilisation (depuis la racine du dépôt, pour accéder à tous les jourX/) :
#   docker run -it --rm -v "$(pwd)":/formation -w /formation insp-bioinfo
# =============================================================================

FROM mambaorg/micromamba:1.5.8

LABEL maintainer="INSP Mali - Departement Laboratoire"
LABEL description="Environnement local de repli - Formation Bio-informatique INSP 2026"

COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/environment.yml

RUN micromamba install -y -n base -f /tmp/environment.yml && \
    micromamba clean --all --yes

ARG MAMBA_DOCKERFILE_ACTIVATE=1

WORKDIR /formation

# Vérification au moment du build : le build échoue si un outil manque,
# ce qui garantit que l'image livrée est réellement fonctionnelle.
RUN fastqc --version && \
    fastp --version && \
    bowtie2 --version | head -1 && \
    minimap2 --version && \
    kraken2 --version && \
    bracken --help > /dev/null && \
    snakemake --version && \
    multiqc --version && \
    samtools --version | head -1 && \
    seqkit version

CMD ["/bin/bash"]
