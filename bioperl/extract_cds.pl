#!/usr/bin/env perl

use warnings;
use strict;
use Bio::SeqIO;

my $rnafile = "data/rna.gbk.gz";

my $gbk_read = Bio::SeqIO->new(-file => "zcat $rnafile |", -format=>"genbank");

# Example for CRISP3 gene
my $gi = 300244559;

my $cpt = 0;
# while (my $seq = $gbk_read->next_seq() ){
#     print $seq->primary_id() . "\n";
#     my @ao_features = $seq->get_all_SeqFeatures();
#     for my $feature (@ao_features){
# 	print $feature->primary_tag()."\n";
# 	if ($feature->primary_tag() =~ 'CDS'){
# 	    print $feature->start().",";
# 	    print $feature->end()."\n";
# 	}
#     }
#     print "----\n";
#     $cpt++;
#     last if $cpt == 10;
# }

# this while loop took to long time, looks to accelerate the search
while (my $seq = $gbk_read->next_seq() ){
    $cpt++;
    if ( $gi == $seq->primary_id() ){
	print "GI:".$gi . "\n";
	print $seq->primary_id() . "\n";
	print "Sequence number: $cpt\n";
	my @ao_features = $seq->get_all_SeqFeatures();
	for my $feature (@ao_features){
	    print $feature->primary_tag()."\n";
	    if ($feature->primary_tag() =~ 'CDS'){
		print $feature->start().",";
		print $feature->end()."\n";
	    }
	}
	last;
    }	
}
1;
