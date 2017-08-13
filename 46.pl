Test:  for($nbrTest=9;;$nbrTest+=2) {
  print "Testing $nbrTest...\n";
  &findPrimes($nbrTest);
  if(findNbrPrimeFactorsForNum($nbrTest)>1) {
    foreach $prime(keys %primes) {
      if((($nbrTest - $prime)/2)**0.5 !~ /\.\d+/) {
        next Test;
      }
    }
    print "$nbrTest\n";
    last Test;
  }
}
<>;

sub findPrimes {
  my $maxPrime=shift;
  if($minPrime<2) { $minPrime=2;}
#  print "Finding prime numbers in the range ($minPrime <= n <= $maxPrime)...\n";
#  print "Initializing...\n";
  for(my $num=$minPrime;$num<=$maxPrime;$num++) {
    $primes{$num} ='';
  }
#  print "Eliminating non-primes...\n";
  foreach $idxPrime(keys %primes) {
    for($ctr=2;$ctr*$idxPrime<=$maxPrime;$ctr++) {
      delete $primes{$ctr*$idxPrime};
    }
  }
  for($num=$minPrime;$num<$maxPrime;$num++) {
    for($ctr=2;$ctr*$num<=$maxPrime;$ctr++) {
      delete $primes{$num*$ctr};
    }
  }
  $minPrime=$maxPrime+1;
}

sub findNbrPrimeFactorsForNum {
  my $numIn = shift;
  my $num = $numIn;
  my %primesForNum = ();
  my $primeToTest;
FindPrimeFactors:  foreach $primeToTest(keys %primes) {
    while($num % $primeToTest == 0) {
      $primesForNum{$primeToTest}++;
      $num /= $primeToTest;
      if($num == 1) {
        last FindPrimeFactors;
      }
    }
  }
  return scalar(keys %primesForNum);
}