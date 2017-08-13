for($i=987654321;$i>2140;$i--) {
#  if(nDigPandigital($i)==1) {
  if(isPandigital($i)) {
    if(isPrime($i)) {
      print "$i is the largest n-digit pandigital prime that exists\n";
break;
    }
  }
}



sub genPandigitalNbrs {
  my $num = shift;
  my $fact= 1;
  for(my $idx=1;$idx<=$num;$idx++) {
    $fact*=$idx;
  }
  for(my $dig=1;$dig<=$num;$dig++) {
    for(my $pos=0;$pos<$num;$pos++) {
      
    }
  }
}

sub isPandigital {
  my $num = shift;
  print "Is $num pandigital?\n";
  my @num=sort(split('',$num));
  for(my $idx=0;$idx<=$#num;$idx++) {
    if($num[$idx]!=$idx+1) {
      return 0;
    }
  }
  return 1;
}

sub nDigPandigital {
  my $num = shift;
  my $len = length($num);
  for(my $idx=1;$idx<=$len;$idx++) {
    if(index($num,$idx)==-1) {
      return 0;
    }
  }
  return 1;
}

sub isPrime {
  my $x = shift;
  print "Is $x prime?\n";
  my $limit = $x;
  my $numDiv = 0;
  
  for(my $currInt=1;$currInt<$limit;++$currInt) {
    if($x % $currInt == 0) {
      $limit = $x / $currInt;
      $numDiv++;
      if($numDiv>1) { return 0;}
    }
  }
  return $1;
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