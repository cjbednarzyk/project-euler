@digits = (0,1,2,3,4,5,6,7,8,9);
@nbrs   = @digits;
for($i=0;$i<=5;$i++) {
  print "Iteration ".($i+1)." out of ".(scalar(@digits))."\n";
  $#nbrsTmp=-1;
  for($j=0;$j<=$#digits;$j++) {
    for($k=0;$k<=$#nbrs;$k++) {
      if(index($nbrs[$k],$j)==-1) {
        push @nbrsTmp,$nbrs[$k].$j;
      }
    }
  }
  @nbrs=@nbrsTmp;
  @nbrs=sort @nbrs;
  $nbrs{$i+1}=\@nbrs;
#  print join("\n", @nbrs)."\n";
  print scalar(@nbrs)." lexicographic permutations have been derived for length ".($i+1)."...\n";
}

print "Looking for pandigital equations...\n";
for($i=1;$i<scalar(@digits);$i++) {
  for($j=$i;$j<scalar(@digits);$j++) {
    if(($i+$j==4)||($i+$j==5)) {
      print "Looking for pandigital equations where the numeric lengths are:  $i * $j = ??...\n";
      @i = @{$nbrs{$i}};
      @j = @{$nbrs{$j}};
      for($idxI=0;$idxI<=$#i;$idxI++) {
J:      for($idxJ=0;$idxJ<=$#i;$idxJ++) {
          if($i[$idxI]<$j[$idxJ]) {
            last J;
          }
          $k=$i[$idxI]*$j[$idxJ];
          $pandigitalTest=$i.$j.$k;
print "$i, $j:  $i[$idxI]*$j[$idxJ]=$k\n";
          %pandigitalTest={};
          for($pandigitalIdx=0;$pandigitalIdx<=length $pandigitalTest;$pandigitalIdx++) {
            if(exists($pandigitalTest{substr($pandigitalTest,$pandigitalIdx,1)})) {
              next J;
            }
            $pandigitalTest{substr($pandigitalTest,$pandigitalIdx,1)}='';
          }
          $totalProducts+=$k;
        }
      }     
    }
  }
}

print "The sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital is:\n\n";
print "$totalProducts\n";
<>;