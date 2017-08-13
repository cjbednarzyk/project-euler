print "Generating pentagonal numbers...\n";
for($i=1;$i<10000;$i++) {
  print "Iteration $i...\n";
  $p=((3*$i**2)-$i)/2;
  push @p,$p;
  $p{$p}=$i;
}
print "Generating pentagonal number differences...\n";
$minDiff=99999999;
for($idxP1=0;$idxP1<$#p;$idxP1++) {
  for($idxP2=$idxP1+1;$idxP2<=$#p;$idxP2++) {
    if(
  (exists($p{$p[$idxP2]-$p[$idxP1]}))
&&(exists($p{$p[$idxP2]+$p[$idxP1]}))) {
      if($p[$idxP2]-$p[$idxP1] < $minDiff) {
        $minDiff=$p[$idxP2] - $p[$idxP1];
        print  "$p[$idxP2] - $p[$idxP1] - $minDiff\n";
      }
    }
  }
}
# print join(", ",@p);
print "Done...\n";
<>;