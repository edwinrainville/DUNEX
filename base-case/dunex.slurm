#!/bin/bash

## Job Name

#SBATCH --job-name=dunex

## Allocation Definition

## The account and partition options should be the same except in a few cases (e.g. ckpt queue and genpool queue).

#SBATCH --account=derakhti

#SBATCH --partition=compute-bigmem

## Resources

## Total number of Nodes

#SBATCH --nodes=1

## Number of cores per node

#SBATCH --ntasks-per-node=16

## Walltime (3 hours). Do not specify a walltime substantially more than your job needs.

#SBATCH --time=72:00:00

## Memory per node. It is important to specify the memory since the default memory is very small.

## For mox, --mem may be more than 100G depending on the memory of your nodes.

## For ikt, --mem may be 58G or more depending on the memory of your nodes.

## See above section on "Specifying memory" for choices for --mem.

#SBATCH --mem=100G

## Specify the working directory for this job

#SBATCH --chdir=/gscratch/derakhti/users/erainvil/dunex

#SBATCH --export=all

module load ompi/4.1.0

module use /gscratch/derakhti/shared/module
module load netcdf_c_gcc9
module load netcdf_fortran_gcc9

mpirun -np 16 /gscratch/derakhti/users/erainvil/dunex/coawstM /gscratch/derakhti/users/erainvil/dunex/coupling_dunex.in > /gscratch/derakhti/users/erainvil/dunex/logs/log.out 2>&1

rm slurm*.out
