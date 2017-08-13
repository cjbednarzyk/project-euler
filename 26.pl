for($i=1;$i<1000;$i++) {
  $currCycle=findRecurringCycle($i);
  print "1/$i:  ".$currCycle."\n";
  if($currCycle>$maxCycle) {
    $maxCycle=$currCycle;
    $dmax=$i;
  }
}
print "The value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part is:\n\n$dmax (with a cycle length of $maxCycle)\n";

<>;

sub findRecurringCycle {
  my $den = shift;
  my $rem = 1;
  my $cycleLen = 0;
  my @remList;

  while($rem>0) {
    $rem*=10;
    $rem%=$den;
    for(my $idx=0;$idx<=$#remList;$idx++) {
      if($remList[$idx] == $rem) {
        $cycleLen=scalar(@remList)-$idx;
        $rem=0;
      }
    }
    push @remList,$rem;
  }
  return $cycleLen;
}