$kmax=0;
for($i=999;$i>99;$i--) {
  for($j=999;$j>99;$j--) {
    $k=$i*$j;
    if($k eq (reverse $k)) {
     if($k>$kmax) {
       $kmax=$k;
     }
    }
  } 
}

print "The largest palindrome made from the product of two 3-digit numbers is:  $kmax\n";

<>;