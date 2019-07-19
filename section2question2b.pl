#!/usr/bin/env perl

$dna_filename = "sequence.txt";
chomp $dna_filename;
unless ( open(DNAFILE, $dna_filename) ) 
{
	print "Sorry the file does not exist!!! \n";
	print "Cannot open file \"$dna_filename\"\n";
	die;
}
@DNA = <DNAFILE>;
close DNAFILE;
$DNA = join( '', @DNA);
$DNA =~ s/\s//g;
$first_portion = length($DNA)/2;
print "$first_portion\n";
print length($DNA);
$DNA_first = substr $DNA, 0, $first_portion;
$DNA_last = substr $DNA, $first_portion, $first_portion;

print "$first_portion";
print "=========================  First Portion ====================";
print "$DNA_first\n\n";

print "=========================== Last Portion ====================\n";
print "$DNA_last";


