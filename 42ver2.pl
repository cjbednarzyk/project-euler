for($idx=3;$idx<10;$idx++) {
  $permTmp=findPermutations ($idx);
  @permTmp=@{$permTmp};
  @perm=(@perm,@permTmp);
  print "$#permTmp\n";
}
print "Sorting list of pandigital numbers...\n";
@perm=sort {$b <=> $a} @perm;

print "Testing ".scalar(@perm)." numbers for primality...\n"; 
for($idx=0;$idx<=$#perm;$idx++) {
  if($idx % 100 == 0) {
    print "Testing $idx of ".scalar(@perm)." numbers for primality...\n";  
  }
  if(isPrime($perm[$idx])) {
    last;
  }
}

print "The largest n-digit pandigital prime is:  $perm[$idx]\n";

<>;

sub findPermutations {
  my $nbrMax=shift;
  print "Deriving permutations of length = $nbrMax...\n";
  my @permutations=(1);
  my @permTemp;
  for(my $idxLen=2;$idxLen<=$nbrMax;$idxLen++) {
    for(my $idxPerm=0;$idxPerm<=$#permutations;$idxPerm++) {
      for(my $idxCopy=0;$idxCopy<$idxLen;$idxCopy++) {
        push @permTemp,$permutations[$idxPerm];
        $permTemp[$#permTemp]=substr($permTemp[$#permTemp],0,$idxLen-1-$idxCopy).$idxLen.substr($permTemp[$#permTemp],$idxLen-1-$idxCopy,$idxCopy);
      }
    }
    @permutations=@permTemp;
    $#permTemp=-1;
  }
  return \@permutations;
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