#!/usr/bin/env perl

# print "ENTER THE FILENAME OF THE DNA SEQUENCE: ";
# $dna_filename = <STDIN>;
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
print " \n The original DNA file is:\n  $DNA \n";
$DNA =~ s/^>//g;
$DNA =~ s/^\s*#//g;
$DNA =~ s/\s//g;
@DNA = split( '', $DNA );
$count_of_A = 0;
$count_of_C = 0;
$count_of_G = 0;
$count_of_T = 0;
$errors     = 0;
foreach $base (@DNA) {
    if ( $base eq  'A' ) {
        ++$count_of_A;
    } elsif ( $base eq 'C' ) {
        ++$count_of_C;
    } elsif ( $base eq 'G' ) {
        ++$count_of_G;
    } elsif ( $base eq 'T' ) {
        ++$count_of_T;
    }
    else {
        print "Error - Unknown base: $base\n";
        ++$errors;
    }
}
print "Adenine = $count_of_A\n";
print "Cytosine = $count_of_C\n";
print "Guanine = $count_of_G\n";
print "Thymine = $count_of_T\n";

if ($errors) {
        print "There were $errors unrecognized bases.\n";
}