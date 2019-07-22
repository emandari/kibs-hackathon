#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature 'switch';

my $filename = 'claudin_5_protein.fasta';
open(my $fh, "<", $filename) or die "Cannot open '$filename' $!";

my $sequence = '';
while (my $row = <$fh>) {
	chomp $row;
 	$sequence = $sequence . "" . $row if($row !~ m/\>/);
}

say "### Section 2 Question 6 ###";
say "i. The length of the sequence is: ".length($sequence);
say "";
say "ii. Complementary sequence of the nucleotide";
my $reverse_sequence = reverse $sequence;
$reverse_sequence =~ tr/ACGT/TGCA/;
say $reverse_sequence;

my $first_portion = length($sequence)/2;
print "$first_portion\n";
my $sequence_first = substr $sequence, 0, $first_portion;
my $sequence_second = substr $sequence, $first_portion, $first_portion;

say "iii. ";
say "First portion ###".$sequence_first."###";
say "";
say "Second portion ###".$sequence_second."###";

say "v. "
