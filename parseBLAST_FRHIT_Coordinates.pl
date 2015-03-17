#!usr/bin/perl
use 5.010;
#open the FR-HIT alignment file in either .sop or .txt format
my $filename = '20557.txt';
open(my $fh, $filename)
 or die "Could not open file '$filename' $!";
#use a second file to store the coordinates that are parsed out of the alignment file
my $filename2 = 'blast_coord_20557.txt';
open(my $fh2, '>>', $filename2) or die "Could not open file '$filename' $!";
#loop through the file row by row
while (my $row = <$fh>) {
#parse the coordinates using regex that pull the xy coordinate and the percent identity
 #store the xy coordinate and the percent identity in separate arrays

 if ($row =~ m/^>\w+\|\d+\s\w+\s\w+\=\d+\s\w+\=\d+\_/) {
 $coordinate = $row;
 $coordinate =~ m/^>\w+\|\d+\s\w+\s\w+\=\d+\s\w+\=(\d+)\_/;
 #print "Coordinate: $1 \n";
 push(@coord, $1);
 }
 if ($row =~ m/\s+\Identities\s\=\s\d+\/\d+\s\((\d+)/) {
 $identity = $row;
 $identity =~ m/\s+\Identities\s\=\s\d+\/\d+\s\((\d+)/;
 #print "Identity: $1 \n";
 push(@ident, $1);
 }
chomp $row;
}
print "\n";
$size_c = @coord;
$size_i = @ident;
while($size_c < $size_i){
pop(@ident);
$size_i--;
}
print $size_c;
print "\n";
print $size_i;
#write the the xy coordinate and the percent identity to the output file
#the first row, coordinates, will be the x axis for the Fragment recruitment plot
#the second row, percent identity, will be the y axis for the Fragment recruitment plot
say $fh2 "@coord";
say $fh2 "@ident";
close $fh2;
say 'done';