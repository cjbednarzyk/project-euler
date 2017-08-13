$maxNbr=1000000;
&findPrimes($maxNbr);
&findNbrUniquePrimeFactors($maxNbr);
print "".&findConsecNbrFactors(4);
<>;

sub findPrimes {
  my $maxPrime=shift;
  if($minPrime<2) { $minPrime=2;}
  print "Finding prime numbers in the range ($minPrime <= n <= $maxPrime)...\n";
  print "Initializing...\n";
  for(my $num=$minPrime;$num<=$maxPrime;$num++) {
    $primes{$num} ='';
  }
  print "Eliminating non-primes...\n";
  foreach $idxPrime(keys %primes) {
print "Eliminating multiples of $idxPrime...\n";
    for($ctr=2;$ctr*$idxPrime<=$maxPrime;$ctr++) {
      delete $primes{$ctr*$idxPrime};
    }
  }
  for($num=$minPrime;$num<$maxPrime;$num++) {
print "Eliminating multiples of $num...\n";
    for($ctr=2;$ctr*$num<=$maxPrime;$ctr++) {
      delete $primes{$num*$ctr};
    }
  }
  $minPrime=$maxPrime+1;
}

sub findNbrUniquePrimeFactors {
print "Finding Unique factors...\n";
  my $maxNbrCheck=shift;
  for(my $idxCheck=0;$idxCheck<=$#maxNbrCheck;$idxCheck++) {
    push @factors,0;
  }
  foreach $idxPrime(keys %primes) {
print "Filtering for $idxPrime...\n";
    for($ctr=2;$ctr*$idxPrime<=$maxNbrCheck;$ctr++) {
      $factors[$ctr*$idxPrime]++;
    }
  }
}

sub findConsecNbrFactors {
  my $nbrFactors=shift;
Factor:  for($idxFactors=0;$idxFactors<=$#factors-$nbrFactors;$idxFactors++) {
    for($idxFactorsInRow=0;$idxFactorsInRow<$nbrFactors;$idxFactorsInRow++) {
      if($factors[$idxFactors+$idxFactorsInRow]!=$nbrFactors) {
        next Factor;
      }
    }
    return $idxFactors;
  }
}