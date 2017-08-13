$maxNum = 1000000;
&findPrimes($maxNum);
foreach $prime(sort {$a <=> $b} keys %primes) {
  if(isCircularPrime($prime)) {
    print "Found circular prime $prime\n";
    $numCirc++;
  }
}
print "There are $numCirc circular primes < $maxNum\n";
<>;

sub findPrimes {
  my $maxPrime=shift;
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

sub isCircularPrime {
  my $nbrTest = shift;
  my $len=length $nbrTest;
  my $pTest;
  for(my $start=0;$start<$len;$start++) {
    $pTest='';
    for(my $pos=0;$pos<$len;$pos++) {
      $pTest.=substr($nbrTest,($start+$pos)%$len,1);
    }
    if(!isPrime($pTest)) {
      return 0;
    }
  }
  return 1;
}

sub isPrime {
  my $nbrTest = shift;
  if(exists($primes{$nbrTest})) {
    return 1;
  }
  else {
    return 0;
  }
}