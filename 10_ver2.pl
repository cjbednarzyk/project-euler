$numMax=2000000;

for($i=1;$i<$numMax;$i++) {
  $primes[$i]=1;
}

for($i=2;$i<$numMax;$i++) {
  if($primes[$i]==1) {
    print "Found prime:  $i\n";
    $sumPrimes+=$i;
  }
  for($j=1;$i*$j<$numMax;$j++) {
    $primes[$i*$j]=0;
  } 
}

print "The sum of all the primes below $numMax is:  $sumPrimes\n";
<>;