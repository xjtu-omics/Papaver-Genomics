#!/bin/bash

t=30
OUTDIR=$WORKDIR
mkdir $OUTDIR
HISAT2DIR=/home/software/hisat2/hisat2-2.2.1
STRINGTIEDIR=/home/software/stringTie/stringtie-2.1.4.Linux_x86_64

cd $OUTDIR
GFF=gene.gff
GTF=gene.gtf
GENOME=genome.fa

## S1, extract exon and splice
$HISAT2DIR/extract_splice_sites.py $GTF  > gene.ss
$HISAT2DIR/extract_exons.py $GTF > gene.exon

## S2, buid hisat2 index
$HISAT2DIR/hisat2-build --ss gene.ss --exon gene.exon -p $t $GENOME hisat2_tran

## S3, mapping RNA-seq
$HISAT2DIR/hisat2 -p $t --dta -x hisat2_tran -1 $FQ1 -2 $FQ2 -S $SIGN.sam
$SAMTOOLS sort -@ $t -o $SIGN.bam $SIGN.sam

## S4, Assemble and quantify expressed genes and transcripts
$STRINGTIEDIR/stringtie -p $t -G $GFF -o $SIGN.gtf -l $SIGN $SIGN.bam

## S5, merge transcripts from all samples:
$STRINGTIEDIR/stringtie --merge -p $t -G $GFF -o $SIGN"_merged.gtf" $MERGELIST


## S6, Estimate transcript abundances and create table counts for Ballgown
$STRINGTIEDIR/stringtie -e -B -p $t -G $MERGEDGTF -o $onetis/$SIGN.gtf $ALIGNDIR/$SIGN.bam

