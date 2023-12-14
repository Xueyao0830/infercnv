#!/bin/bash -l
#
#SBATCH -n 20 
#SBATCH -t 200:00:00
#SBATCH -A [projectid] -J infercnv
#SBATCH -o infercnv_output_path/outputs/slurm.%A.%a.out   # standard output (STDOUT) redirected to these files (with Job ID and array ID in file names)
#SBATCH -e infercnv_output_path/outputs/slurm.%A.%a.err   # standard error  (STDERR) redirected to these files (with Job ID and array ID in file names)

echo START: `date`


# Start work
module load R/4.3.1 R_packages/4.3.1

Rscript --vanilla infercnv.R
    

echo END: `date`
