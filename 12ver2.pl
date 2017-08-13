$minDivisors = 500;
print "The first triangle number to have over $minDivisors divisors is:  ".findTriangleNumWithOverXDivisors($minDivisors)."\n";
<>;

sub findTriangleNumWithOverXDivisors {
  my $numDivisorsMin = shift;
  my $triNum=0;
  my $i = 0;
  while($numDivisors<=$numDivisorsMin) {
    $i++;
    $triNum = $triNum+$i;
    $numDivisors = getNumDivisors($triNum);
#    $numDivisors = findNumDivisors($triNum);
    if($numDivisors>$maxDivisors) {
      print "Found $numDivisors divisors in $triNum...\n";
      $maxDivisors=$numDivisors;
    }

  }
  return $triNum;
}

sub findPrimes {
  my $numToTest = shift;
  if($lastNumPrimeTest==0) { $lastNumPrimeTest = 2;}
PTEST:  for(my $idxNumTest=$lastNumPrimeTest;$idxNumTest<=$numToTest;$idxNumTest++) {
    for(my $primeCtr=0;(($primeCtr<=$#primes)&&($primeCtr<$idxNumTest**0.5));$primeCtr++) {
      if($idxNumTest % $primes[$primeCtr]==0) {
        next PTEST;
      }
    }
    push @primes,$idxNumTest;
  }
  $lastNumPrimeTest = $numToTest;
#  print join(", ", @primes)."\n";
}

sub findPrimeFactorsForNum {
  my $numIn = shift;
  my $num = $numIn;
  my %primesForNum = ();
FindPrimeFactors:  for(my $primeCtr=$#primes;$primeCtr>-1;$primeCtr--) {
    while($num % $primes[$primeCtr] == 0) {
      $primesForNum{$primes[$primeCtr]}++;
      $num /= $primes[$primeCtr];
      if($num == 1) {
        last FindPrimeFactors;
      }
    }
  }
#  print "Prime Factors for $numIn:\n\n1";
#  foreach $key(sort keys %primesForNum) {
#    print ", $key^$primesForNum{$key}";
#  }
#  print "\n------------------------\n";
  return \%primesForNum;
}


sub deriveNumFactorsFromPrimeFactors {
  my $primesForNum = shift;
  my %primesForNum = %{$primesForNum};
  my $base;
  my $numFactors = 1;
  foreach $base(keys %primesForNum) {
    $numFactors *= ($primesForNum{$base}+1);
  }
  return $numFactors;
}

sub deriveAllFactorsFromPrimeFactors {
  my $primesForNum = shift;
  my %primesForNum = %{$primesForNum};
  my $base;
  my $exp;
  my @valsForBase;
  foreach $base(keys %primesForNum) {
    $exp = $primesForNum{$base};
    my @valsForBase;
    for(;$exp>-1;$exp--) {
      unshift @valsForBase,$base**$exp;
    }
    $primesForNum{$base} = \@valsForBase;
  }
  my @factors=(1);
  my $factor;
  foreach $base(keys %primesForNum) {
    my @factorsTmp;
    foreach $factor(@factors) {
      @valsForBase = @{$primesForNum{$base}};
      for($idxVals=0;$idxVals<=$#valsForBase;$idxVals++) {
        push @factorsTmp, $valsForBase[$idxVals]*$factor;
      }
    }
    @factors = @factorsTmp;
  }
  @factors = sort {$a <=> $b} @factors;
  return \@factors;
}

sub getNumDivisors {
  my $x = shift;
  my $limit = $x;
  my $numDiv = 0;
  
  for(my $currInt=1;$currInt<$limit;++$currInt) {
    if($x % $currInt == 0) {
      $limit = $x / $currInt;
      $numDiv++;
    }
  }
  return $numDiv * 2;
}


sub findNumDivisors {
  my $num = shift;
  if($num == 1) {return 1};
  findPrimes($num);
  $primeFactors = findPrimeFactorsForNum($num);
  #my $factors = deriveAllFactorsFromPrimeFactors($primeFactors);
  #my @factors = @{$factors};
#  print "All ".scalar(@factors)." factors for $num:  ".join(", ",@factors)."\n";
  return deriveNumFactorsFromPrimeFactors($primeFactors);
}