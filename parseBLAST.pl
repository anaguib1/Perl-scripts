#!usr/bin/perl


my $filename = 'example_blast.txt';
open(my $fh, $filename)
  or die "Could not open file '$filename' $!";
 
while (my $row = <$fh>) {
  
  if ($row =~ m/Query\=/) {
  $query = $row;
  $query =~ m/\w+=\s(\w+\d+)/;
  #$sub_query = $1;
  print "Query ID: $1 \n";
  }
  if ($row =~ m/Length\=/) {
  $query_length = $row;
  $query_length =~ m/\w+=(\w+\d+)/;
  #$sub_length = $2;
  print "Query Length: $1 \n";
  #stop after getting the first length
  last;
  }
  chomp $row;
}

#Alignment #1: Accession = ref|XM_005094338.1| (Length = 2377, Score = 1098)
my $counter = 1;
while (my $row = <$fh>) {
	if ($i < 10) {
		if ($row =~ m/^\>/) {
  		$accession = $row;
  		$accession =~ m/^\>\w+\|(\w+\d+.\d)\|\s+\S+/;	
  		print "Alignment #$counter: Accession = ref|$1| (";
  		}	
  		if ($row =~ m/Length\=/) {
  		$length = $row;
  		$length =~ m/\w+=(\d+)/;
  		print "Length: $1, ";
  		}
  		if ($row =~ m/Score\s\=/) {
  		$score = $row;
  		$score =~ m/\w+\s=\s+(\d+)\s+\S+/;
  		print "Score: $1) \n";
  		$counter++;
  		$i++;
  		}
  	}
	chomp $row;
}
print "\n";
