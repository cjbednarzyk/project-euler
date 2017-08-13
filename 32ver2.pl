# $a + $b = $c || $a + $b = $c + 1 digits when multiplying
# 1 + 1 = 2 || 1 (total = 4 || 3)
# 1 + 2 = 3 || 2 (total = 6 || 5)
# 1 + 3 = 4 || 3 (total = 8 || 7)
# 1 + 4 = 5 || 4 (total = 10 || 9) ->  This is a combination:  1 + 4 = 5 digits
# 1 + 5 = 6 || 5 (total = 12 || 11)
# 2 + 2 = 4 || 3 (total = 8 || 7)
# 2 + 3 = 5 || 4 (total = 10 || 9) -> This is a combination:  2 + 3 = 4 digits
# 2 + 4 = 6 || 5 (total = 12 || 11)
# 3 + 3 = 6 || 5  (total = 12 || 11)

for($i=1;$i<100;$i++) {
JLoop:  for($j=100;$j<10000;$j++) {
    $k=$i*$j;
    $num=$i.$j.$k;
    if(length $num == 9) {
      @num=sort(split('',$num));
      for($idx=0;$idx<=$#num;$idx++) {
        if($num[$idx]!=$idx+1) {
          next JLoop;
        }
      }
      print "Found pandigital equation $i*$j=$k...\n";
      $products{$k}='';
    }
  }
}
foreach $prod(keys %products) {
  $tot+=$prod;
}
print "The total is $tot\n";
<>;