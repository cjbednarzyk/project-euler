&test;
<>;

sub test {
  for($n=23;$n<=100;$n++) {
    print "Testing n=$n...\n";
    for($r=1;$r<=$n;$r++) {
      if(getC($r,$n)>1000000) {
        print "getC($r,$n)  ".getC($r,$n)."\n";
        $nbrVals++;
      }
    }
  }
  print "There are $nbrVals values > 1000000\n";
}

sub getC {
  my $r=shift;
  my $n=shift;
  my $c=fact($n)/(fact($r)*fact($n-$r));
  return $c;
}

sub fact {
  my $f=shift;
  my $r=1;
  while($f>1) {
    $r*=$f--;
  }
  return $r;
}