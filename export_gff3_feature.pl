#!usr/bin/perl


$filename = @ARGV[0];
$input2 = @ARGV[1];
$input3 = @ARGV[2];
$input4 = @ARGV[3];

open(INPUT_FILE, $filename)
		or die "Couldn't open $filename ";
	

while (<INPUT_FILE>) {
 #if a line matches with any part having YAR003W then store into array @values
 if ($_ =~ m/$input4/ && $_ =~ m/$input1/ && $_ =~ m/$input2/) {
  
  push(@values, $_);
}

 push @fasta_seq, $_ if /\#\#FASTA/ .. 0
   
}

#if the array is empty due to no matches, prints no features found
if (@values == 0) {
print "No features found \n";
}
#if the array has more than one line (aka >1 feature), tell user
if (@values > 1) {
print "More than one feature found \n";
}


shift(@fasta_seq);
#take out first element of array since it's not nucleotides yet
splice(@fasta_seq, 0, 1);
#puts the lines of the array into one string
$fasta_lines = join ('', @fasta_seq);



#puts the lines of the array into one string
$lines = join ("", @values);
#puts each element of the string lines into an array
@elements = split('\s', $lines);

#searches the array for the coordinates
while ($i < @elements) {

if ($elements[$i] =~ m/^\d+$/ || $elements[$i]=~ m/^\+$/ || $elements[$i]=~ m/^\-$/){
push(@coordinates, $elements[$i]);

}

$i++;

}

#printing header based on query of the user
print ">" . $input2 . ":" . $input3 . ":" . $input4 . "\n";


#position 0, 1, _, 3, 4, _, 6, 7, _, 9, 10, _
$final_seq_length = @coordinates[1] - @coordinates[0];
$final_seq = substr($fasta_lines, @coordinates[0], $final_seq_length);

#print $final_seq_length;
#print "@coordinates[0] \n";
#print "@coordinates[1] \n";

#print $final_seq;

print substr($final_seq, 0, 60, '') while (length($final_seq));

print "\n";
