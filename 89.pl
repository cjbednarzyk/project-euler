open(InFile,"<89_roman.txt");
while($line = <InFile>) {
  chomp $line;
  $line2 = $line;
# Direct replacements
  $line2 =~ s/IIIII/V/;
  $line2 =~ s/VV/X/;
  $line2 =~ s/XXXXX/L/;
  $line2 =~ s/LL/C/;
  $line2 =~ s/CCCCC/D/;
  $line2 =~ s/DD/M/;
# Subtractive replacements
  $line2 =~ s/IIII/IV/;
  $line2 =~ s/VIV/IX/;
  $line2 =~ s/XXXX/XL/;
  $line2 =~ s/LXL/XC/;
  $line2 =~ s/CCCC/CD/;
  $line2 =~ s/DCD/CM/;
  if(length($line) > length($line2)) {
    print "$line reduced to $line2\n";
    $ctReduced+=length($line);
    $ctReduced-=length($line2);
  }
}
print "The total number of characters saved is $ctReduced";
<>;