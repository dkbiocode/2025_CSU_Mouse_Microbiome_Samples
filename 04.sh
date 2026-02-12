#!/bin/bash

#SBATCH --job-name=04.ancom
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --partition=amilan
#SBATCH --time=2:00:00
#SBATCH --qos=normal
#SBATCH --output=04.ancom_%j.out

module load anaconda

conda activate qiime2-amplicon-2024.10
export TMPDIR=$SLURM_SCRATCH
snakemake \
        -c $SLURM_NTASKS \
        -s 04.ancom \
        --verbose \
        --printshellcmds

