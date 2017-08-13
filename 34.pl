for($i=0;$i<10;$i++) {
  $nbrs{$i}=1;
  for($j=1;$j<=$i;$j++) {
    $nbrs{$i}*=$j;
  }
}
foreach $nbr(sort keys %nbrs) {
  print "$nbr - $nbrs{$nbr}\n";
}
<>;

for($i=1;$i*$nbrs{9}>10**$i;$i++) {
  $max=$i*$nbrs{9};
}
print "max = $max\n";

for($i=3;$i<=$max;$i++) {
  $sum=0;
  for($j=0;$j<length($i);$j++) {
    $sum+=$nbrs{substr($i,$j,1)};
  }
  if($sum==$i) {
    $tot+=$sum;
    print "$i\n";
  }
}
print "The sum of all the numbers that are equal to the sum of the factorial of their digits is:\n\n";
print "$tot\n";
<>;