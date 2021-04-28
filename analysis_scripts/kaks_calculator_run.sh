#!/bin/bash

cd $WORKDIR

./ParaAT.pl -h $SIGN.genepair -n $SIGN.cds.fa -a $SIGN.pep.fa -p proc -o $SIGN -f axt -k > $SIGN.log
cat ./$SIGN/*.kaks > $SIGN.kaks
awk 'NR%2==0' $SIGN.kaks > $SIGN.kaks.value

