$numStart=600851475143;
$currNumber=$numStart;
$currFactor=2;
@factorList;
while($currNumber>1) {
  while($currNumber % $currFactor == 0) {
    $currNumber/=$currFactor;
    push @factorList,$currFactor;
  }
  $currFactor++;
}
print "$numStart can be factored into the following numbers:  \n".(join ", ", @factorList)."\n";
<>;