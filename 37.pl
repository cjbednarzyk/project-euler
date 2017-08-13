%primes=(1,'',2,'',3,'',5,'',7,'');

PRIMECHECK:  while(scalar(%primes)>0) {
  $iter++;
  print "$iter:  \n";
  for($dig=1;$dig<10;$dig++) {
    foreach $prime(keys %primes) {
      $testPrimeLeft=$dig.$prime;
      $testPrimeRight=$prime.$dig;

      if((getNumDivisors($testPrimeLeft)==2)&&(!exists($tmpPrimes{$testPrimeLeft}))) {
        $tmpPrimes{$testPrimeLeft}='';
        $sum+=$testPrimeLeft;
        $ctPrime++;
        print "Found truncatable prime $ctPrime $testPrimeLeft...\n";
        if($ctPrime>12) {last PRIMECHECK;}
      }
      if((getNumDivisors($testPrimeRight)==2)&&(!exists($tmpPrimes{$testPrimeRight}))) {
        $tmpPrimes{$testPrimeRight}='';
        $sum+=$testPrimeRight;
        $ctPrime++;
        print "Found truncatable prime $ctPrime $testPrimeRight...\n";
        if($ctPrime>12) {last PRIMECHECK;}
      }
    }
  }
  %primes=%tmpPrimes;
}
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