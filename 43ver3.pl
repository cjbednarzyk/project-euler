$pandig=&find0to9Permutations;
@pandig=@{$pandig};

foreach $pandig(@pandig) {
  if((substr($pandig,1,3)%2==0)&&
     (substr($pandig,2,3)%3==0)&&
     (substr($pandig,3,3)%5==0)&&
     (substr($pandig,4,3)%7==0)&&
     (substr($pandig,5,3)%11==0)&&
     (substr($pandig,6,3)%13==0)&&
     (substr($pandig,7,3)%17==0)
     ) {
    print "$pandig\n";
    $sum+=$pandig;
  }
}
print "The sum of all 0 to 9 pandigital numbers with this property is $sum\n";
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

sub find0to9Permutations {
  print "Deriving 0 to 9 pandigital numbers...\n";
  my @permutations=("0");
  my @permTemp;
  for(my $idxLen=1;$idxLen<=9;$idxLen++) {
    for(my $idxPerm=0;$idxPerm<=$#permutations;$idxPerm++) {
      for(my $idxCopy=0;$idxCopy<=$idxLen;$idxCopy++) {
        push @permTemp,$permutations[$idxPerm];
        $permTemp[$#permTemp]=substr($permTemp[$#permTemp],0,$idxLen-$idxCopy).$idxLen.substr($permTemp[$#permTemp],$idxLen-$idxCopy,$idxCopy);
      }
    }
    @permutations=@permTemp;
    $#permTemp=-1;
  }
  return \@permutations;
}