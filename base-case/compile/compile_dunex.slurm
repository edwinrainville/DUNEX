#!/bin/bash

#SBATCH --job-name=compile_dunex

#SBATCH --account=derakhti

#SBATCH --partition=compute-bigmem

#SBATCH --nodes=1

#SBATCH --ntasks-per-node=8

#SBATCH --time=1:00:00

#SBATCH --mem=100G

#SBATCH --chdir=/gscratch/derakhti/users/erainvil/dunex/base-case/compile

#SBATCH --export=all

module load ompi/4.1.0

module use /gscratch/derakhti/shared/module
module load netcdf_fortran_gcc9

export MCT_INCDIR=/gscratch/derakhti/shared/COAWST/MCT/include
export MCT_LIBDIR=/gscratch/derakhti/shared/COAWST/MCT/lib

./coawst_dunex.bash -j 8 1>/gscratch/derakhti/users/erainvil/dunex/base-case/compile/info.log 2>/gscratch/derakhti/users/erainvil/dunex/base-case/compile/warning.log
