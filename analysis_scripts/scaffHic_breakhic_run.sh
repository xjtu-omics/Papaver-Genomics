#!/bin/sh

NO_THREAD=$t
SCAFFHICDIR=/home/software/scaffhic/src

cd $WORKDIR
$SCAFFHICDIR/breakhic -nodes $NO_THREAD -grid 100  -fq1 $fq1 -fq2 $fq2 $contig $contig.break.fasta
