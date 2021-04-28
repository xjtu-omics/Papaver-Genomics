#!/bin/bash

export AUGUSTUS_CONFIG_PATH=/home/software/augustus-3.3.3/config
export BUSCO_CONFIG_FILE="/home/software/busco-master/config/config.ini"
export PATH=/home/software/augustus-3.3.3/bin:/home/xfyang/software/augustus-3.3.3/scripts:$PATH
cd /home/poppy_project/YMR_nextdenovo/purged_dups_res 
BUSCO=/home/software/busco-master/scripts/run_BUSCO.py
PYTHON=/home/software/miniconda2/bin/python
REF=$referenceFa

$PYTHON $BUSCO -o busco3_Res -i $REF -l /home/busco_lineage/embryophyta_odb9 -m genome -c 28


