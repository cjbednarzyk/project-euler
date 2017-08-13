use bigint;

$maxLen=1000;
$term=2;
$f2=1;
$f1=1;
$f =$f1+$f2;
print "f2\n$f1\n";
while(length($f)<$maxLen) {
  $term++;
  $f=$f1+$f2;
  $f2=$f1;
  $f1=$f;
  print "$term\n";
}
<>;