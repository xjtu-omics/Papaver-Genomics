#!/bin/bash
#PBS -N juicer_contig_brk
#PBS -l nodes=1:ppn=90
#PBS -l walltime=999:00:00
#PBS -V
#PBS -q fat

#### step 1
BWA=/opt/software/bwa/bwa
SAMTOOLS=~/software/miniconda3/bin/samtools
BASEDIR=/home/xfyang/poppy_project/poppy_HN1_contig/3dDNA_contig_break
REFNAME=poppy_HN1_contig.fa.break
REF=$BASEDIR/references/$REFNAME.fasta

cd $BASEDIR/references/

$BWA index $REF

$SAMTOOLS faidx $REF
cut -f 1,2 $REF.fai > $REF.size

## step 2
PYTHON=/opt/anaconda2/bin/python
GENSCRIPT=/home/xfyang/software/juicer/misc/generate_site_positions.py
cd $BASEDIR/restriction_sites/
$PYTHON $GENSCRIPT DpnII $REFNAME $REF

## step 3
export PATH=/opt/software/bwa/:/opt/anaconda2/bin/:$PATH
JUICERSH=$BASEDIR/scripts/juicer.sh
t=90

cd $BASEDIR 
$JUICERSH -S early -D $BASEDIR -d $BASEDIR -z $REF -y $BASEDIR/restriction_sites/$REFNAME"_DpnII.txt" -p $REF.size -g poppy_HN1 -t $t -s DpnII 2>juicer_log

# run the 3d-dna/run-asm-pipeline.sh that takes the assembly and the $BASEDIR/aligned/merged_nodups.txt. I use --rounds 1 which actually two rounds of missjoin correction (round 0 and round 1, it seems to count from zero). For the cockle however I had to use three rounds (--rounds 1) to get the superscaffolds look as the actual chromosomes (the 'squares' in the contact map).
cd $BASEDIR

#bash 3d-dna/run-asm-pipeline.sh --sort-output --rounds 1 $BASEDIR/references/$REF $BASEDIR/aligned/merged_nodups.txt

# this last script produces three files ended in FINAL.fasta (the actual scaffolds), FINAL.assembly (the assembly map) and final.hic (the contact map). The last two files are visulized in juicebox
# The whole process took me about seven days to run, the /scripts/juicer.sh uses 24 CPU, I used 64Gb RAM (more than enough I think)

