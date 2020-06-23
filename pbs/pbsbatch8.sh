#!/bin/sh
### Set the job name (for your reference)
#PBS -N regex_box
### Set the project name, your department code by default
#PBS -P mausam.inlp.cs
### Request email when job begins and ends
#PBS -m bea
### Specify email address to use for notification.
#PBS -M $USER@iitd.ac.in
####
#PBS -l select=1:ncpus=4:ngpus=1
### Specify "wallclock time" required for this job, hhh:mm:ss
#PBS -l walltime=40:00:00

# After job starts, must goto working directory. 
# $PBS_O_WORKDIR is the directory from where the job is fired. 
echo "==============================="
echo $PBS_JOBID
cat $PBS_NODEFILE
echo "==============================="
cd $PBS_O_WORKDIR
#job 
cd /home/cse/staff/adlakhav.cstaff/scratch/KnowledgeGraphEmbedding
python -u codes/run.py --do_train --cuda --do_valid --do_test --model RotatE -d 400 -adv -de --only_ltr --uni_weight