@primes;
$currNbr=1;
$numMax=2000000;

CHECKPRIME:
while($currNbr<$numMax) {
  $currNbr++;
  foreach $prime(@primes) {
    if($currNbr % $prime == 0) {
      next CHECKPRIME;
    }
  }
  print "Found Prime:  $currNbr\n";
  push @primes,$currNbr;
  $sumPrimes+=$currNbr;
}

print "The sum of all the primes below $numMax is:  $sumPrimes\n";
<>;