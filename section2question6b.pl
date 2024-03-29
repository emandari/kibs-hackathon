#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature 'switch';

sub dna2peptide {
	my ($dna) = @_;
	my $protein = '';

	for (my $i = 0; $i < (length($dna) - 2); $i+=3) {
		$protein .= codon2aa( substr($dna,$i,3));
	}
	return $protein;
}

sub codon2aa {
	my ($codon) = @_;

	if ( $codon =~ /TCA/i )    { return 'S' }    # Serine
	elsif ( $codon =~ /TCC/i )    { return 'S' }    # Serine
	elsif ( $codon =~ /TCG/i )    { return 'S' }    # Serine
	elsif ( $codon =~ /TCT/i )    { return 'S' }    # Serine
	elsif ( $codon =~ /TTC/i )    { return 'F' }    # Phenylalanine
	elsif ( $codon =~ /TTT/i )    { return 'F' }    # Phenylalanine
	elsif ( $codon =~ /TTA/i )    { return 'L' }    # Leucine
	elsif ( $codon =~ /TTG/i )    { return 'L' }    # Leucine
	elsif ( $codon =~ /TAC/i )    { return 'Y' }    # Tyrosine
	elsif ( $codon =~ /TAT/i )    { return 'Y' }    # Tyrosine
	elsif ( $codon =~ /TAA/i )    { return '_' }    # Stop
	elsif ( $codon =~ /TAG/i )    { return '_' }    # Stop
	elsif ( $codon =~ /TGC/i )    { return 'C' }    # Cysteine
	elsif ( $codon =~ /TGT/i )    { return 'C' }    # Cysteine
	elsif ( $codon =~ /TGA/i )    { return '_' }    # Stop
	elsif ( $codon =~ /TGG/i )    { return 'W' }    # Tryptophan
	elsif ( $codon =~ /CTA/i )    { return 'L' }    # Leucine
	elsif ( $codon =~ /CTC/i )    { return 'L' }    # Leucine
	elsif ( $codon =~ /CTG/i )    { return 'L' }    # Leucine
	elsif ( $codon =~ /CTT/i )    { return 'L' }    # Leucine
	elsif ( $codon =~ /CCA/i )    { return 'P' }    # Proline
	elsif ( $codon =~ /CCC/i )    { return 'P' }    # Proline
	elsif ( $codon =~ /CCG/i )    { return 'P' }    # Proline
	elsif ( $codon =~ /CCT/i )    { return 'P' }    # Proline
	elsif ( $codon =~ /CAC/i )    { return 'H' }    # Histidine
	elsif ( $codon =~ /CAT/i )    { return 'H' }    # Histidine
	elsif ( $codon =~ /CAA/i )    { return 'Q' }    # Glutamine
	elsif ( $codon =~ /CAG/i )    { return 'Q' }    # Glutamine
	elsif ( $codon =~ /CGA/i )    { return 'R' }    # Arginine
	elsif ( $codon =~ /CGC/i )    { return 'R' }    # Arginine
	elsif ( $codon =~ /CGG/i )    { return 'R' }    # Arginine
	elsif ( $codon =~ /CGT/i )    { return 'R' }    # Arginine
	elsif ( $codon =~ /ATA/i )    { return 'I' }    # Isoleucine
	elsif ( $codon =~ /ATC/i )    { return 'I' }    # Isoleucine
	elsif ( $codon =~ /ATT/i )    { return 'I' }    # Isoleucine
	elsif ( $codon =~ /ATG/i )    { return 'M' }    # Methionine
	elsif ( $codon =~ /ACA/i )    { return 'T' }    # Threonine
	elsif ( $codon =~ /ACC/i )    { return 'T' }    # Threonine
	elsif ( $codon =~ /ACG/i )    { return 'T' }    # Threonine
	elsif ( $codon =~ /ACT/i )    { return 'T' }    # Threonine
	elsif ( $codon =~ /AAC/i )    { return 'N' }    # Asparagine
	elsif ( $codon =~ /AAT/i )    { return 'N' }    # Asparagine
	elsif ( $codon =~ /AAA/i )    { return 'K' }    # Lysine
	elsif ( $codon =~ /AAG/i )    { return 'K' }    # Lysine
	elsif ( $codon =~ /AGC/i )    { return 'S' }    # Serine
	elsif ( $codon =~ /AGT/i )    { return 'S' }    # Serine
	elsif ( $codon =~ /AGA/i )    { return 'R' }    # Arginine
	elsif ( $codon =~ /AGG/i )    { return 'R' }    # Arginine
	elsif ( $codon =~ /GTA/i )    { return 'V' }    # Valine
	elsif ( $codon =~ /GTC/i )    { return 'V' }    # Valine
	elsif ( $codon =~ /GTG/i )    { return 'V' }    # Valine
	elsif ( $codon =~ /GTT/i )    { return 'V' }    # Valine
	elsif ( $codon =~ /GCA/i )    { return 'A' }    # Alanine
	elsif ( $codon =~ /GCC/i )    { return 'A' }    # Alanine
	elsif ( $codon =~ /GCG/i )    { return 'A' }    # Alanine
	elsif ( $codon =~ /GCT/i )    { return 'A' }    # Alanine
	elsif ( $codon =~ /GAC/i )    { return 'D' }    # Aspartic Acid
	elsif ( $codon =~ /GAT/i )    { return 'D' }    # Aspartic Acid
	elsif ( $codon =~ /GAA/i )    { return 'E' }    # Glutamic Acid
	elsif ( $codon =~ /GAG/i )    { return 'E' }    # Glutamic Acid
	elsif ( $codon =~ /GGA/i )    { return 'G' }    # Glycine
	elsif ( $codon =~ /GGC/i )    { return 'G' }    # Glycine
	elsif ( $codon =~ /GGG/i )    { return 'G' }    # Glycine
	elsif ( $codon =~ /GGT/i )    { return 'G' }    # Glycine     
	else {
		print STDERR "Bad codon \"$codon\"!!\n";
		exit;
		}
	}

my $filename = 'claudin_5_protein.fasta';
open(my $fh, "<", $filename) or die "Cannot open '$filename' $!";

my $sequence = '';
while (my $row = <$fh>) {
	chomp $row;
 	# print "$row\n" if($row !~ m/\>/);
 	$sequence = $sequence . "" . $row if($row !~ m/\>/);
}

say "### Section 2 Question 6 ###";
say "i. The length of the sequence is: ".length($sequence);
say "==================================================";
say "ii. Complementary sequence of the nucleotide";
my $reverse_sequence = reverse $sequence;
$reverse_sequence =~ tr/ACGT/TGCA/;
say $reverse_sequence;

my $first_portion = length($sequence)/2;

my $sequence_first = substr $sequence, 0, $first_portion;
my $sequence_second = substr $sequence, $first_portion, $first_portion;
say "==================================================";
say "iii. ";
say "First portion ###".$sequence_first."###";
say "";
say "Second portion ###".$sequence_second."###";

say "v. =========";

my $protein1 = '';
my $codon1;

for(my $i=0; $i < (length($sequence_first) - 2) ; $i += 3) {
	$codon1 = substr($sequence_first,$i,3);
	$protein1 .= codon2aa($codon1);
}

print "The DNA sequence: \n\n$sequence_first\n\n  results into the protein\n\n$protein1\n\n";

say "=========";