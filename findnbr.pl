print "The smallest positive # evenly divisible by 1 - 20 is:  ";
CHECK:  while(true) {
  $i += 20;
  for($j=1;$j<20;$j++) {
    if($i % $j != 0) {
      next CHECK;
    }
  }
  last CHECK;
}
print "$i\n";
<>;