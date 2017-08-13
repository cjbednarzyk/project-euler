$exp=6;
for($i=0;$i<10;$i++) {
  $nbrs{$i}=$i**$exp;
}
foreach $nbr(sort keys %nbrs) {
  print "$nbr - $nbrs{$nbr}\n";
}
<>;

for($i=1;$i*$nbrs{9}>10**$i;$i++) {
  $max=$i*$nbrs{9};
}

for($i=2;$i<=$max;$i++) { # digit i
  $sum=0;
  for($j=0;$j<length($i);$j++) {
    $sum+=$nbrs{substr($i,$j,1)};
  }
  if($sum==$i) {
    $tot+=$sum;
    print "$i\n";
  }
}
print "The sum of all the numbers that can be written as the sum of $exp powers of their digits is:\n\n";
print "$tot\n";
<>;