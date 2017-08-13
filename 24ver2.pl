@digits = (0,1,2,3,4,5,6,7,8,9);

@nbrs=@digits;
for($pos=1;$pos<=$#digits;$pos++) {
  print "Position $pos\n";
  $#nbrsTmp=-1;
  for($nbrIdx=0;$nbrIdx<=$#nbrs;$nbrIdx++) {
    @digitsToAdd=@digits;
    for($tmpPos=0;$tmpPos<$pos;$tmpPos++) {
      $digitsToAdd[substr($nbrs[$nbrIdx],$tmpPos,1)]=-1;
    }
    # print "$nbrs[$nbrIdx], $pos:  ".join(", ", @digitsToAdd)."\n";
    for($idxDigitsToAdd=0;$idxDigitsToAdd<=$#digitsToAdd;$idxDigitsToAdd++) {
      if($digitsToAdd[$idxDigitsToAdd] != -1) {
        push @nbrsTmp,$nbrs[$nbrIdx].$idxDigitsToAdd;
      }
    }
  }
  @nbrs=@nbrsTmp;
  # print join("\n", @nbrs)."\n";
  print scalar(@nbrs)." lexicographic permutations have been derived...\n";
}
@nbrs = sort {$a <=> $b} @nbrs;
print "$nbrs[999999] is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9.\n";
<>;