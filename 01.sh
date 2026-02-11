#!/usr/bin/env bash
#SBATCH --job-name=01.demultiplex-3
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --time=4:00:00
#SBATCH --output=%x_%j.out
module purge
module load miniforge

conda activate qiime2-amplicon-2024.10

snakemake \
        -c $SLURM_NTASKS \
        -s 01.demultiplex \
        --verbose \
        --printshellcmds \
        demux_summarize_filtered

