#!/bin/bash

MINIMAP2=/opt/software/minimap2/minimap2
PURGE_DUP_BIN=/home/software/purge_dups/bin

echo "#####################################"
echo "REF=$REF"
echo "QUERY=$QUERY"
echo "####################################"

cd $WORKDIR
## Step 1.1
$MINIMAP2 -x map-ont -t $t $REF $QUERY | gzip -c - > $QUERY.mini.paf.gz

## Step 1.2
$PURGE_DUP_BIN/split_fa $REF > $REF.split
$MINIMAP2 -xasm5 -DP -t $t $REF.split $REF.split | gzip -c - > $REF.split.self.paf.gz

## Step 1.3
$PURGE_DUP_BIN/pbcstat *.mini.paf.gz #(produces PB.base.cov and PB.stat files)
$PURGE_DUP_BIN/calcuts PB.stat > cutoffs 2>calcults.log
python purge_dups/scripts/hist_plot.py -c cutoffs PB.stat covs.png

#Step 2. Purge haplotigs and overlaps with the following command.
$PURGE_DUP_BIN/purge_dups -2 -T cutoffs -c PB.base.cov $REF.split.self.paf.gz > dups.bed 2> purge_dups.log
#Step 3. Get purged primary and haplotig sequences from draft assembly.
$PURGE_DUP_BIN/get_seqs dups.bed $REF
