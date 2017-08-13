for($i=1;$i<1000000;$i++) {
  $chainLen=1;
  $seqNum=$i;
  while($seqNum!=1) {
    if($seqNum%2==0) {
      $seqNum/=2;
    }
    else {
      $seqNum=$seqNum*3+1;
    }
    $chainLen++;
  }
  if($chainLen>$chainLenMax) {
    $startNumMax=$i;
    $chainLenMax=$chainLen;
    print "Current Max Chain Length:  $chainLen, Current Start Number:  $startNumMax\n";
  }
}
print "$startNumMax produces the longest chain ($chainLenMax) for the given iterative sequence\n";
<>;