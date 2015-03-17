#!usr/bin/perl
use 5.010;
#open the FR-HIT alignment file in either .sop or .txt format
my $filename = 'Age454d_31499.sop';
open(my $fh, $filename)
 or die "Could not open file '$filename' $!";
#use a second file to store the coordinates that are parsed out of the alignment file
my $filename2 = 'Age454d_31499_coordinates.txt';
open(my $fh2, '>>', $filename2) or die "Could not open file '$filename' $!";
#loop through the file row by row
while (my $row = <$fh>) {
#parse the coordinates using regex that pull the xy coordinate and the percent identity
 if($row =~ m/\S+\s+\S+\s+\S+\s+\d+\s+\d+\s+\d+\s+\S\s+\d+/){
 $row =~ m/\S+\s+\S+\s+\S+\s+\d+\s+(\d+)\s+\d+\s+\S\s+(\d+)/;
 print "Coordinate: $1 Identity $2\n";

 #store the xy coordinate and the percent identity in separate arrays
 push(@coord, $1);
 push(@ident, $2);
 }
chomp $row;
}
print "\n";
#write the the xy coordinate and the percent identity to the output file
#the first row, coordinates, will be the x axis for the Fragment recruitment plot
#the second row, percent identity, will be the y axis for the Fragment recruitment plot
say $fh2 "@coord";
say $fh2 "@ident";
close $fh2;
say 'done';