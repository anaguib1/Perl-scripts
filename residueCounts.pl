#!usr/bin/perl



$sequences = 0;
$residues = 0;


while (<>){

if ($_ =~ m/>/){
$sequences ++;
}
if ($_ =~ m/^(G|A|V|L|I|M|F|W|P|S|T|C|Y|N|Q|D|E|K|R|H)/){
$residues += length($_) - 2;

}

}
$residues++;
print "$sequences \n";
print "$residues \n";
