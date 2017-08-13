$primes = findPrimes(1000,10000);
@primes = @{$primes};

print "Checking for differences between ".scalar(@primes)." prime numbers...\n";
Diff:  for($i=0;$i<=$#primes;$i++) {
TestJ:  for($j=$i+1;$j<=$#primes;$j++) {
    for($k=$j+1;$k<=$#primes;$k++) {
      if($primes[$k]==2*$primes[$j]-$primes[$i]) {
        @testi=split '',$primes[$i];
        @testj=split '',$primes[$j];
        @testk=split '',$primes[$k];

        @testi=sort {$a <=> $b} @testi;
        @testj=sort {$a <=> $b} @testj;
        @testk=sort {$a <=> $b} @testk;

        for($idxTest=0;$idxTest<=$#testi;$idxTest++) {
          if(($testi[$idxTest]!=$testj[$idxTest])||($testj[$idxTest]!=$testk[$idxTest])) {
            next TestJ;
          }
        }

        $num=$primes[$i].$primes[$j].$primes[$k];
        $seq++;
        if($seq>1) {
          last Diff;
        }
      }
    }
  }
}
print "$num\n";
<>;

sub findPrimes {
  my $min=shift;
  my $max=shift;
  my @primes;
  for(my $idxPrime=$min;$idxPrime<$max;$idxPrime++) {
    if(&isPrime($idxPrime)==1) {
      push @primes,$idxPrime;
    }
  }
  return \@primes;
}

sub isPrime {
  my $x = shift;
  my $limit = $x;
  my $numDiv = 0;
  
  for(my $currInt=1;$currInt<$limit;++$currInt) {
    if($x % $currInt == 0) {
      $limit = $x / $currInt;
      $numDiv++;
      if($numDiv>1) {return 0;}
    }
  }
  return 1;
}