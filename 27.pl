print "Populating coefficients hash table...\n";
for($a=-999;$a<1000;$a++) {
  for($b=-999;$b<1000;$b++) {
    $coeffs{"$a,$b"}='';
  }
}

LOOPN:  for($n=0;;$n++) {
  print "Looking for primes at $n...";
  $nbrPrimes=0;
  foreach $coeff(keys %coeffs) {
    ($a,$b) = split ",",$coeff;
    $nbr=$n**2+$a*$n+$b;
    if(getNumDivisors($nbr)==2) {
      $nbrPrimes++;
      $product=$a*$b;
print "$nbr is prime...\n";
    }
    else {
      delete $coeffs{$coeff};
    }
  }
  if($nbrPrimes==1) {last LOOPN;}
}
print "a = $a, b = $b, n = $n, a*b = $product\n";
<>;

sub getNumDivisors {
  my $x = shift;
  my $limit = $x;
  my $numDiv = 0;
  
  for(my $currInt=1;$currInt<$limit;++$currInt) {
    if($x % $currInt == 0) {
      $limit = $x / $currInt;
      $numDiv++;
    }
  }
  return $numDiv * 2;
}