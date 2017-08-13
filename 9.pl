LOOP:  for($a=1;$a<1000;$a++) {
  for($b=$a+1;$b<1000;$b++) {
    for($c=$b+1;$c<1000;$c++) {
      if($a*$a+$b*$b == $c*$c) {
        print "Found Pythagorean triplet ($a, $b, $c)\n";
        if($a+$b+$c == 1000) {
          print "The only Pythagorean triplet where a + b + c = 1000 is ($a, $b, $c)\n";
          print "The product is ".($a*$b*$c)."\n";
          last LOOP;
        }
      }
    }
  }
}
<>;