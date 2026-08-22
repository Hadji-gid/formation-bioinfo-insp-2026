#!/usr/bin/env bash
# Vérifie que tous les outils de la formation sont disponibles et fonctionnels.
# À exécuter DANS l'environnement (conteneur Docker ou environnement conda activé).
set -uo pipefail

echo "=== Vérification de l'environnement — Formation Bio-informatique INSP 2026 ==="
echo

FAIL=0
check() {
    name="$1"; shift
    if "$@" > /tmp/check_out 2>&1; then
        echo "  [OK]   $name"
    else
        echo "  [FAIL] $name"
        FAIL=1
    fi
}

check "FastQC"          fastqc --version
check "Fastp"            fastp --version
check "Bowtie2"          bowtie2 --version
check "Minimap2"         minimap2 --version
check "metaSPAdes"       metaspades.py --version
check "Kraken2"          kraken2 --version
check "Bracken"          bracken -h
check "AMRFinderPlus"    amrfinder --version
check "Snakemake"        snakemake --version
check "MultiQC"          multiqc --version
check "samtools"         samtools --version
check "seqkit"           seqkit version

echo
if [ "$FAIL" -eq 0 ]; then
    echo "Tous les outils sont opérationnels. L'environnement est prêt pour la formation."
else
    echo "Au moins un outil est manquant ou non fonctionnel — voir les lignes [FAIL] ci-dessus."
    echo "Consultez local_environment/README.md, section Dépannage."
fi
exit $FAIL
