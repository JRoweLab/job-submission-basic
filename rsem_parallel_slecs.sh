#!/bin/bash
source /etc/profile
#$ -S /bin/bash
#$ -N star_genome_index      # Job name
#$ -cwd                      # Run job in the current working directory
#$ -o rsem_p_slecs_out.log  # Standard output file
#$ -e rsem_p_slecs_error.log   # Standard error file
#$ -pe pvm 8                 # Request 8 CPU cores

source /home/ma1111/miniconda3/bin/activate
conda activate
conda init bash

# Define log file paths

ref_dir=/home/ma1111/jared_lab/ref/mouse/gencode/m36_GRCm39
file_dir=/home/ma1111/jared_lab/bulk_rnaseq/240430_AR11999_fastq/outputs

cat path/to/samples.txt | parallel -j 6 rsem-calculate-expression -p 8 \
--paired-end --bam --estimate-rspd --append-names \
--output-genome-bam {} $ref_dir/GRCm39.primary_assembly_rsem_ref_build \
$file_dir/{/.}_GRCm39_rsem_exp
