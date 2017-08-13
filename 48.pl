use bigint;
for($i=1;$i<=1000;$i++) {
print "Calculating for $i...\n";
  $num+=$i**$i;
}
print substr($num,-10,10)."\n";
<>;