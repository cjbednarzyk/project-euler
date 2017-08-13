$maxNum=28123;

for($a=1;$a<$maxNum;$a++) {
  $sumProperDivisors=getSumProperDivisors($a);
  if($a < $sumProperDivisors) {
    print "Found abundant number $a\n";
    push @abundantNums,$a;
  }
}
for($i=0;$i<=$#abundantNums;$i++) {
  print "Finding sums of abundant numbers > $abundantNums[$i]...\n";
  for($j=$i;$j<=$#abundantNums;$j++) {
    $k=$abundantNums[$i]+$abundantNums[$j];
    if($k>$maxNum) { last; }
    $sumAbundantNums{$k}=1;
  }
}

for($i=1;$i<=$maxNum;$i++) {
  if(!(exists($sumAbundantNums{$i}))) {
    $notSumOfAbundantNumbers+=$i;
  }
}

print "\nThe sum of all the positive integers which cannot be written as the sum of two abundant numbers is:  $notSumOfAbundantNumbers\n";
<>;

sub getSumProperDivisors {
  my $x = shift;
  my $limit = $x;
  my $base;
  my %properDiv;
  my $sumDiv=1;
  
  for(my $currInt=2;$currInt<$limit;++$currInt) {
    if($x % $currInt == 0) {
      $limit = $x / $currInt;
      $properDiv{$limit}++;
      $properDiv{$currInt}++;
    }
  }
#  print "$x:  ";
  foreach $base(sort keys %properDiv) {
    $sumDiv+=$base;
#    print "$base^$properDiv{$base} ";
  }
#  print "= $sumDiv\n";
  return $sumDiv;
}