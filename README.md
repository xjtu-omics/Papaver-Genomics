# Welcome to _Papaver_ Genomic page

## This is the Genomics Data resuorce of _Papaver_ species genome

Currently, it includes _Papaver somniferum_ (opium poppy), _Papaver rhoeas_ (common poppy), and _Papaver setigerum_ (troy poppy) genomic data

The raw genomic data and the genome assembly will released at [National Genomics Data Center (NGDC)](https://bigd.big.ac.cn) with accestion number of GWHAZPJ00000000, GWHAZPH00000000, and GWHAZPI00000000.

## In this repository, we released the genomic annotation fie.

- Papaver_rhoeas: the _Papaver rhoeas_ annotaion file
  - Papaver_rhoeas.gene.bed.tar.gz: the _Papaver rhoeas_ protein-coding genes annotation in `bed` file
  - Papaver_rhoeas.gene.gff3.tar.gz: the _Papaver rhoeas_ protein-coding genes annotation in `gff3` file
  - Papaver_rhoeas.cds.tar.gz: the _Papaver rhoeas_ `cds` sequences of annotated protein-coding genes data
  - Papaver_rhoeas.pep.tar.gz: the _Papaver rhoeas_ `protein` sequences of annotated protein-coding genes data

- Papaver_setigerum: the _Papaver setigerum_ annotaion file
  - Papaver_setigerum.gene.bed.tar.gz: the _Papaver setigerum_ protein-coding genes annotation in `bed` file
  - Papaver_setigerum.gene.gff3.tar.gz: the _Papaver setigerum_ protein-coding genes annotation in `gff3` file
  - Papaver_setigerum.cds.tar.gz: the _Papaver setigerum_ `cds` sequences of annotated protein-coding genes data
  - Papaver_setigerum.pep.tar.gz: the _Papaver setigerum_ `protein` sequences of annotated protein-coding genes data
  
- Papaver_somniferum: the _Papaver somniferum_ annotaion file
  - Papaver_somniferum.gene.bed.tar.gz: the _Papaver somniferum_ protein-coding genes annotation in `bed` file
  - Papaver_somniferum.gene.gff3.tar.gz: the _Papaver somniferum_ protein-coding genes annotation in `gff3` file
  - Papaver_somniferum.cds.tar.gz: the _Papaver somniferum_ `cds` sequences of annotated protein-coding genes data
  - Papaver_somniferum.pep.tar.gz: the _Papaver somniferum_ `protein` sequences of annotated protein-coding genes data


If you want to use these data, please contact Xiaofei Yang, xfyang@xjtu.edu.cn or Kai Ye, kaiye@xjtu.edu.cn 


## The analysis_scripts folder includes the scripts used in our research work

 - The files in the analysis_scripts as following:
   - `nextdenovo_run.pbs`  : the script used to assembly P. setigerum and P. rhoeas gneome based on Nanopore sequencing data by [NextDenovo](https://github.com/Nextomics/NextDenovo)
   - `scaffHic_breakhic_run.sh` : the script used to break the contigs with missing assembly based on Hi-C data by [scaffHic](https://github.com/wtsi-hpag/scaffHiC)
   - `3d-DNA-whole_pipeline.sh` : the script used to scaffold genomes based on Hi-C data by [3d-DNA](https://github.com/aidenlab/3d-dna)
   - `purge_dups-whole-pipeline.sh` : the script used to purge duplications in P. rhoease genome by [purge_dups](https://github.com/dfguan/purge_dups)
   - `P. rohoeas-Purge_dups-cutoffs`  : the `cutoffs` parameters used in P. rhoeas genome purge_dups
   - `busco3_evaluation.sh`  : [busco](https://busco-archive.ezlab.org/v3/) evaluation of the genome assembly 
   - `repetmolder_run.sh`  : script used to construt own repeat library by [RepeatMolder](http://www.repeatmasker.org/RepeatModeler/)
   - `maker_anno.sh` : Annotation genomes by [MAKER](http://www.yandell-lab.org/software/maker.html) pipeline
     - `maker_bopts.ctl`   : MAKER control file
     - `maker_exe.ctl` : MAKER control file
     - `maker_opts.ctl` : MAKER control file
   - `kaks_calculator_run.sh`  : Ks calculation by [Kaks_calculator](https://bigd.big.ac.cn/tools/kaks)
   - `mcscanx_run.sh` : McscanX analysis of genome by [Mcscanx](https://github.com/wyp1125/MCScanx)
   - `trinity_run.pbs` : script used to assembly transcripts based on RNA-seq data by [trinity](https://rnabio.org/module-06-trinity/0006/02/01/Trinity_Assembly_And_Analysis/)
   - `RNA-seq_analysis.sh` : script used to calculate `TPM` based on RNA-seq data by [hisat2](https://daehwankimlab.github.io/hisat2/), [stringtie](http://ccb.jhu.edu/software/stringtie/) and [ballgown](https://github.com/alyssafrazee/ballgown)

## Citation
Yang, X., Gao, S., Guo, L. et al. Three chromosome-scale Papaver genomes reveal punctuated patchwork evolution of the morphinan and noscapine biosynthesis pathway. Nat Commun 12, 6030 (2021). https://doi.org/10.1038/s41467-021-26330-8
