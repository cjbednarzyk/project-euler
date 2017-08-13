use bigint;

$maxNbr=0;
open(InFile,"<base_exp.txt");
while($line=<InFile>) {
  chomp $line;
  ($base,$exp) = split ",",$line;
  $num=$base**$exp;
  print "$base^$exp=$num\n";
  if($num>$maxNbr) {$maxNbr = $num;
print "$maxNbr\n";}
}
print "$maxNbr\n";
<>;