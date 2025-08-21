# Basic commands for scheduling jobs on Argos HPC cluster

This assumes that you have access to HPC cluster which can be logged in as e.g. ssh username@argos

## Some common directives
-N : name of the job

-l h_vmem=size: Total memory requested per job

-l h_rt=hh:mm:ss Requested walltime per job

-pe pvm/smp <n_slots>: Parallel environment "smp" with n_slots (cores) ~ usually not more than 8 (only for Arhos)

-cwd: Run in current working directory

-o <output_log>: output log file

-e <error_log>: error log file

## Basic qsub scripts for submission

Following is a an example of a very basic submission script-
 
nano path/to/script/example.qsub

```

#!/bin/bash
source /etc/profile
#$ -S /bin/bash
#$ -N star_genome_index      # Job name
#$ -cwd                      # Run job in the current working directory
#$ -o rsem_p_slecs_out.log  # Standard output file
#$ -e rsem_p_slecs_error.log   # Standard error file
#$ -pe pvm 8                 # Request 8 CPU cores

```

## Job status checks

To check the status of your submitted job-

```
qstat
```
To delete a job-

```
qdel <jobid>
```
To cancel or hold-

```
qhold <jobid>
```

To check details-
```
qstat -j <jobid>
```

## Example

An example job submission ```example_submission.sh``` to estimate gene and isoform level expression against a mouse reference using RSEM of a bulk-RNAseq data has been given. This script parallelizes across 6 samples: -j 6 means process 6 samples concurrently. Here, each RSEM run uses -p 8 threads internally (allocation per job) and quantifies expression with RSEM against the GRCm39 RSEM reference which was built earlier.


