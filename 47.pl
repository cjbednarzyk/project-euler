print "The first number is:  ".findConsecNbrsWithPrimeFactors(4);

sub findConsecNbrsWithPrimeFactors {
  my $nbrPrimeFactors=shift;
  for(my $idxPrimeFactors=1;$idxPrimeFactors<=$nbrPrimeFactors;$idxPrimeFactors++) {
    push @primeFactors,1;
  }
  for(my $nbrNew=2;;$nbrNew++) {
print ".";
    &findPrimes($nbrNew);
    $primeFactors[$#primeFactors] = &findNbrPrimeFactorsForNum($nbrNew);
    $invalidSeq=0;
    for(my $idxPrimeFactors=0;$idxPrimeFactors<$#primeFactors;$idxPrimeFactors++) {
      if($primeFactors[$idxPrimeFactors]!=$nbrPrimeFactors) {
        $invalidSeq=1;
      }
      $primeFactors[$idxPrimeFactors]=$primeFactors[$idxPrimeFactors+1];
    }
    if($primeFactors[$#idxPrimeFactors]!=$nbrPrimeFactors) {
      $invalidSeq=1;
    }
    if($invalidSeq==0) {
      for(my $idxNbr=$nbrPrimeFactors-1;$idxNbr>-1;$idxNbr--) {
        print "".($nbrNew-$idxNbr)." ";
      }
      print "\n";
      return ($nbrNew - $nbrPrimeFactors + 1);
    }
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