#!/bin/bash

#SBATCH --job-name=02.denoise
#SBATCH --nodes=1
#SBATCH --ntasks=6
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --time=02:00:00
#SBATCH --output=%x_%j.out

export TMPDIR=$SLURM_SCRATCH

module load miniforge

conda activate qiime2-amplicon-2024.10

snakemake \
        -c $SLURM_NTASKS \
        -s 02.denoise \
        --verbose \
        --printshellcmds

