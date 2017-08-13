$max=1000000;
findPrimes($max);
for(my $idx=10;$idx<$max;$idx++) {
  if(isTruncatablePrime($idx)) {
    print "Found truncatable prime $idx\n";
    $sum+=$idx;
    $nbrPrimes++;
    if($nbrPrimes>10) {
      last;
    }
  }
}
print "The sum of the only eleven primes that are both truncatable from left to right and right to left is:  $sum\n";

<>;

sub findAllTruncations {
  my $str = shift;
  my $len = length $str;
  my @trunc1;
  my @trunc2;
  for(my $idxStart=0;$idxStart<$len;$idxStart++) {
    push @trunc1,substr($str,$idxStart);
    push @trunc2,substr($str,0,$len-$idxStart);
  }
  my @trunc = (@trunc1,@trunc2);
  return \@trunc;
}

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

sub isPrime {
  my $nbrTest = shift;
  if(exists($primes{$nbrTest})) {
    return 1;
  }
  else {
    return 0;
  }
}

sub isTruncatablePrime {
  my $nbrTest = shift;
  my $truncs = findAllTruncations($nbrTest);
  my @truncs = @{$truncs};
  my $trunc;
  foreach $trunc(@truncs) {
    if(!isPrime($trunc)) {
      return 0;
    }
  }
  return 1;
}