#!/bin/sh

cd $annotationDir
/opt/mpi/mpich-3.2/bin/mpirun -n 94 /opt/software/maker/bin/maker 2> maker.log
