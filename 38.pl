TestLoop:  for($nbr=1;$nbr<987654;$nbr++) {
  $num='';
  for($n=1;;$n++) {
    $num.=($nbr*$n);
    if(length($num)>=9) {
      last;
    }
  }
  if(length($num)==9) {
    @num=sort(split('',$num));
    for($idx=0;$idx<=$#num;$idx++) {
      if($num[$idx]!=$idx+1) {
        next TestLoop;
      }
    }
    print "Found pandigital concatenated products $nbr - $n - $num\n";
    if($num>$max) {
      $max=$num;
    }
  }
}
print "The max is $max\n";
<>;