for($i=1;$i<101;$i++) {
  $isqTot+=$i*$i;
  $iTot+=$i;
}
$iTotSq=$iTot*$iTot;

$diff=abs($iTotSq-$isqTot);
print "The difference between the sum of the squares of the first one hundred natural numbers and the square of the sum is:  $diff\n";
<>;