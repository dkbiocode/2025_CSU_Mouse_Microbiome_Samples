#!/bin/bash

#SBATCH --job-name=03.taxonomy_greengenes
#SBATCH --nodes=1
#SBATCH --ntasks=12
#SBATCH --partition=amilan
#SBATCH --time=2:00:00
#SBATCH --qos=normal
#SBATCH --output=%x_%j.out

module load miniforge

conda activate qiime2-amplicon-2024.10

export TMPDIR=$SLURM_SCRATCH

snakemake \
        -c $SLURM_NTASKS \
        -s 03.taxonomy_greengenes \
        --verbose \
        --printshellcmds \
        --forcerun rarefaction \
        "/scratch/alpine/dcking@colostate.edu/esdaile_project/03_mouse_fecal_sampless_alpha_rarefaction_curves_samples_3_reads_50_greengenes.qzv" \
        "/scratch/alpine/dcking@colostate.edu/esdaile_project/03_mouse_fecal_sampless_alpha_rarefaction_curves_samples_3_reads_100_greengenes.qzv"

