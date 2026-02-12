#!/bin/bash

#SBATCH --job-name=03.taxonomy_greengenes
#SBATCH --nodes=1
#SBATCH --ntasks=12
#SBATCH --partition=amilan
#SBATCH --time=2:00:00
#SBATCH --qos=normal
#SBATCH --output=%x_%j.out

module load anaconda

conda activate qiime2-amplicon-2024.10

export TMPDIR=$SLURM_SCRATCH

snakemake \
        -c $SLURM_NTASKS \
        -s 03.taxonomy_greengenes \
        --verbose \
        --printshellcmds

