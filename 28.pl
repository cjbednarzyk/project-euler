$size=1001;
$currSqNbr=2;
for($idx=1;$idx<=$size**2;$idx++) {
  if($idx>($currSqNbr*2-1)**2) {
    $currSqNbr++;
  }
  if(($idx-1)%(2*($currSqNbr-1))==0) {
print "$idx\n";
    $tot+=$idx;
  }
}
print "$tot\n";
<>;