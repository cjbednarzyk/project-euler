$maxNum=10000;

for($a=1;$a<$maxNum;$a++) {
  $sumProperDivisors=getSumProperDivisors($a);
  if($a != $sumProperDivisors) {
    $properDivisorSum{$a}=$sumProperDivisors;
  }
#  print "d($a) = $properDivisorSum{$a}\t";
#  if($a % 5 == 0) { print "\n"; }
}

foreach $a(keys %properDivisorSum) {
  if(($a<$properDivisorSum{$a})&&($properDivisorSum{$properDivisorSum{$a}} == $a)) {
    print "Amicable pair:  $a, $properDivisorSum{$a}\n";
    $sumAmicableNumbers+=$a+$properDivisorSum{$a};
  }
}
print "\nThe sum of all the amicable numbers under 10000 is:  $sumAmicableNumbers\n";
<>;

sub getSumProperDivisors {
  my $x = shift;
  my $limit = $x;
  my $sumDiv = 1;
  
  for(my $currInt=2;$currInt<$limit;++$currInt) {
    if($x % $currInt == 0) {
      $limit = $x / $currInt;
      $sumDiv+=$currInt+$limit;
    }
  }
  return $sumDiv;
}