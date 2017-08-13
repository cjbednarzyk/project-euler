use bigint;

$max=100;
$fact=1;
for($i=1;$i<$max;$i++) {
  $fact *= $i;
}
$len = length $fact;
for($i=0;$i<$len;$i++) {
  $factSum+=substr($fact,$i,1);
}

print "The sum of the digits in the number $max! is:  $factSum\n";
<>;