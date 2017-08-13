&solve;

sub solve {
my $num=1;
my $den=1;
for(my $i=10;$i<100;$i++) {
  for(my $j=$i+1;$j<100;$j++) {
    if((substr($i,1,1)==0)&&(substr($j,1,1)==0)) {
      # trivial fraction
      next;
    }
    if(( substr($i,0,1) == substr($j,0,1) ) && (substr($j,1,1) != 0)) {
      if($i/$j == ( substr($i,1,1) / substr($j,1,1))) {
        $num*=$i;
        $den*=$j;
      }
    }
    if(( substr($i,0,1) == substr($j,1,1) ) && (substr($j,0,1) != 0)) {
      if($i/$j == ( substr($i,1,1) / substr($j,0,1))) {
        $num*=$i;
        $den*=$j;
      }
    }
    if(( substr($i,1,1) == substr($j,0,1) ) && (substr($j,1,1) != 0)) {
      if($i/$j == ( substr($i,0,1) / substr($j,1,1))) {
        $num*=$i;
        $den*=$j;
      }
    }
    if(( substr($i,1,1) == substr($j,1,1) ) && (substr($j,0,1) != 0)) {
      if($i/$j == ( substr($i,0,1) / substr($j,0,1))) {
        $num*=$i;
        $den*=$j;
      }
    }
  }
}
print "Denominator:  ".getLCD($num,$den)."\n";
}
<>;

sub getLCD {

  my $num = shift;
  my $den = shift;
  print "$num/$den -> ";
  my $rangeFraction=($den-($den%$num)+$num)/$num;
  if($rangeFraction>$den) {
    for(my $div=$rangeFraction;$div>=$den;$div--) {
      while(($num%$div==0)&&($den%$div==0)) {
        $num/=$div;
        $den/=$div;
      }
    }
  }
  else {
    for(my $div=$den;$div>=$rangeFraction;$div--) {
      while(($num%$div==0)&&($den%$div==0)) {
        $num/=$div;
        $den/=$div;
      }
    }
  }
  print "$num/$den\n";
  return $den;
}