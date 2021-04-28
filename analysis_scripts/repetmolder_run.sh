#!/bin/sh

mkdir ./RepeatModeler
cd ./RepeatModeler
/RepeatModeler/BuildDatabase -name mydb genome.fasta > genome.rmodeler.log 
//RepeatModeler/RepeatModeler -pa 28 -database mydb > genome.repeatmmodeler.out
rm -r RM_*/round-*
mv RM_* result
