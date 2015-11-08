#!/bin/bash

genomes="ftp://ftp.ncbi.nlm.nih.gov/genomes/Homo_sapiens/"
rna="RNA/rna.gbk.gz"
rna_file="rna.gbk.gz"
chr6="CHR_06/hs_ref_GRCh38.p2_chr6.gbk.gz"
chr6_file="hs_ref_GRCh38.p2_chr6.gbk.gz"

if [ ! -d "data" ]
then
    mkdir "data"
else
    cd "data"
    if [ ! -f "$rna_file" ]
    then
	echo "Download the RNA file for human genome"
	wget "$genomes""$rna"
    else
	echo "File $rna already downloaded"
    fi

    if [ ! -f "$chr6_file" ]
    then
	echo "Download the chromosome 6 for human genome"
	wget "$genomes""$chr6"
    else
	echo "File $chr6 already downloaded"
    fi

    echo "Done"
fi

