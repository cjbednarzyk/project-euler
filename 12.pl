print findTriangleNumWithOverXDivisors(500)."\n";
<>;

sub findTriangleNumWithOverXDivisors {
  my $numDivisorsMin = shift;
  my $triNum=0;
  my $i = 0;
  while($numDivisors<=$numDivisorsMin) {
    $i++;
    $triNum = $triNum+$i;
    $numDivisors = findNumDivisors($triNum);
    print "Number of Divisors:  $numDivisors, Triangle Number:  $triNum\n";
  }
  return $triNum;
}

sub findTriangleNum {
  my $ithNum = shift;
  my $triNum;
  while($ithNum>0) {
    $triNum+=$ithNum;
    $ithNum--;
  }
  return $triNum;
}

sub findNumDivisors {
  my $num = shift;
  my @divisors;
  my $divisor;
  for($divisor=1;$divisor<=$num;$divisor++) {
    if($num%$divisor==0) {
      push @divisors,$divisor;
    }
  }
  return scalar(@divisors);
}