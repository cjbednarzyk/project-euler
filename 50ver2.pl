$maxPrime=1000000;
&findPrimes;

print findMaxSumPrimes()."\n";
<>;

sub findPrimes {
  my @primesTbl;
  print "Finding prime numbers < $maxPrime...\n";
  print "Initializing...\n";
  for($num=2;$num<$maxPrime;$num++) {
    $primesTbl[$num] = 1;
  }
  print "Eliminating non-primes...\n";
  for($num=2;$num<$maxPrime;$num++) {
    for($ctr=2;$ctr*$num<=$maxPrime;$ctr++) {
      $primesTbl[$ctr*$num] = 0;
    }
  }
  print "Dumping primes into a clean array...\n";
  $#primes = -1;
  %primes = ();
  for($num=2;$num<$maxPrime;$num++) {
    if($primesTbl[$num]==1) {
      push @primes,$num;
      $primes{$num}='';
    }
  }
  print "Primes have been dumped into a clean array...\n";
}

sub findMaxSumPrimes {

  print "Finding max consecutive primes adding up to a prime < $maxPrime...\n";

  $sumConsec=0;
  for($idxMax=0;($idxMax<=$#primes-1)&&($sumConsec<=$primes[$#primes]);$idxMax++) {
print ".";
    $sumConsec+=$primes[$idxMax];
  }
print "\n";

  for($len=$idxMax; $len > 0; $len--) {
    print "Looking for $len consecutive primes...\n";
    for($start=0;$start<$idxMax-$len;$start++) {
      $sumConsec=0;
      for($idxC=0;$idxC<$len;$idxC++) {
        $sumConsec+=$primes[$start+$idxC];
      }
      if(exists($primes{$sumConsec})) {
        return $sumConsec;
      }
    }
  }
}