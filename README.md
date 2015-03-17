# Perl-scripts

reverseComplement.pl

Program that prompts the user to enter an oligonucleotide sequence, such as TATGAGCCCGTA. 
If the user entered a valid oligo sequence consisting only of the characters A, C, G, or T, 
the program should then display the reverse complement of that sequence, in this case TACGGGCTCATA, 
along with text indicating that it is the reverse complement.

After displaying the reverse complement, the program should then prompt the user to enter another sequence. 
The program should continue this pattern of prompting the user for a new oligo sequence and displaying 
its reverse complement until the user enters a sequence with at least one character that is invalid 
(i.e. a character other than A, C, G, or T). At this point, the program should end its run with 
a message that mentions that an invalid character was found, with no further prompting to the user.

=====================================================================================================

export_gff3_feature.pl

GFF3 feature exporter.  A user should be able to run your script like this:

	$  export_gff3_feature.pl  /path/to/some.gff3  gene  ID  YAR003W

There are 4 arguments here that correspond to values in the GFF3 columns.  In this case, script should read the path to a GFF3 file, find any gene (column 3) which has an ID=YAR003W (column 9).   When it finds this, it should use the coordinates for that feature (columns 4, 5 and 7) and the FASTA sequence at the end of the document to return its FASTA sequence.

Script should work regardless of the parameters passed, warning the user if no features were found that matched their query.  (It should also check and warn if more than one feature matches the query.)

The output should just be printed on STDOUT (no writing to a file is necessary.) The sequence portion of the FASTA output formated as 60-characters per line. It should have a header which matches their query, like this:

	>gene:ID:YAR003W
	…. sequence here …


=====================================================================================================

parseBLAST.pl

For just the first ten hits, parse out only the accession (located between the first set of pipe symbols, | | ), length and score. For each of these hits, these three fields should then be written to STDOUT in exactly this format including capitalization, spacing, and punctuation (as shown here using the real values for the first hit; study the file to understand exactly where these values came from):

	Alignment #1: Accession = ref|XM_005094338.1| (Length = 2377, Score = 1098)


=====================================================================================================

parseFR_HIT.pl

Using FR-HIT alignment output file in .sop format. Store the
coordinates that are parsed out of the alignment file.
Coordinates are saved to be plotted in R.


=====================================================================================================

parseBLAST_FRHIT

Using BLAST alignment output file in .txt format. Store the coordinates
that are parsed out of the alignment file.
Coordinates are saved to be plotted in R.


