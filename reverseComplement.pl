#!usr/bin/perl
use strict;
#cd ~/Desktop/Bioinformatics/practical/final

print "Enter oligo sequence: \n";
my $oligo = <STDIN>;
my $reverse_complement;
while ($oligo =~ /^[ATCG]+$/){

$reverse_complement = reverse("$oligo");
$reverse_complement =~ tr/ACGT/TGCA/;
print $reverse_complement, "\n";
$oligo = <STDIN>;

}
print "invalid character found\n";
