for($i=1;$i<1000;$i++) {
  if(($i % 3 == 0) || ($i % 5 == 0)) {
    $total+=$i;
  }
}

print "The sum of all multiples of 3 or 5 below 1000 is:  $total\n";
<>;