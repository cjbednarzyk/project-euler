use bigint;

$base=2;
$exp=1000;
$nbr = $base**$exp;
$len = length $nbr;
for($i=0;$i<$len;$i++) {
  $sumDigits+=substr($nbr,$i,1);
}

print "The sum of the digits of the number 2^1000 ($nbr) is:  $sumDigits\n";
<>;