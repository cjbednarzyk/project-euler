$maxPrime=1000000;

print findMaxSumPrimes()."\n";
<>;

sub findMaxSumPrimes {

print "Finding prime numbers < $maxPrime...\n";

PRIME:  for($num=2;$num<$maxPrime;$num++) {
  for($ctr=0;$ctr<=$#primes;$ctr++) {
    if($num % $primes[$ctr] == 0) {
      next PRIME;
    }
  }
  if($#primes % 100 == 0) {
    print "Found prime number $num...\n";
  }
  push @primes, $num;
}

print "Finding max consecutive primes adding up to a prime < $maxPrime...\n";

for($len=$#primes - 1; $len > 0; $len--) {
  print "Looking for $len consecutive primes...\n";
  for($start=0;$start<$#primes-$len;$start++) {
    $sumConsec=0;
    for($idxC=0;$idxC<$len;$idxC++) {
      $sumConsec+=$primes[$start+$idxC];
    }
    for($idxP=$start+$len;$idxP<=$#primes;$idxP++) {
      if($primes[$idxP] == $sumConsec) {
        return $primes[$idxP];
      }
    }
  }
}
}