print "The first number is:  ".findConsecNbrsWithPrimeFactors(4);

sub findConsecNbrsWithPrimeFactors {
  my $nbrPrimeFactors=shift;
  my $nbrPFMinus1=$nbrPrimeFactors-1;
TestString:  for(my $nbrNew=2;;$nbrNew++) {
if($nbrNew%100==0) {
  print "$nbrNew\n";
}
    &findPrimes($nbrNew+$nbrPFMinus1);
    for($idxNbrAdd=$nbrPFMinus1;$idxNbrAdd>-1;$idxNbrAdd--) {
      if(&findNbrPrimeFactorsForNum($nbrNew+$idxNbrAdd)!=$nbrPrimeFactors) {
        $nbrNew+=$idxNbrAdd;
        next TestString;
      }
    }
    return $nbrNew;
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

sub findPrimeFactorsForNum {
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
  return \%primesForNum;
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