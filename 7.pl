@primes;
$currNbr=1;
$numPrimes = 10001;

CHECKPRIME:
while($#primes<$numPrimes-1) {
  $currNbr++;
  foreach $prime(@primes) {
    if($currNbr % $prime == 0) {
      next CHECKPRIME;
    }
  }
  print "Prime\n";
  push @primes,$currNbr;
}

print "The first $numPrimes prime numbers are:\n".(join "\n", @primes);
<>;