use bigint;
@digits = (0,1,2,3,4,5,6,7,8,9);
@nbrs   = @digits;
for($i=0;$i<=$#digits;$i++) {
  print "Iteration $i\n";
  $#nbrsTmp=-1;
  for($j=0;$j<=$#digits;$j++) {
    for($k=0;$k<=$#nbrs;$k++) {
      if(index($nbrs[$k],$j)==-1) {
        push @nbrsTmp,$nbrs[$k].$j;
      }
    }
  }
  @nbrs=@nbrsTmp;
  print join("\n", @nbrs)."\n";
  print scalar(@nbrs)." lexicographic permutations have been derived...\n";
}
@nbrs = sort {$a <=> $b} @nbrs;
print "$nbrs[999999] is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9.\n";
<>;