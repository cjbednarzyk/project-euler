for($n=1;;$n++) {
  $t=($n**2+$n)/2;
  $p=(3*$n**2-$n)/2;
  $h=2*$n**2-$n;
  $t{$t}=$n;
  $p{$p}=$n;
  $h{$h}=$n;
  print "$n - $t{$t} - $p{$p} - $h{$h}\n";
  if($n>285&&exists($p{$t})&& exists($h{$t})) {
    print "$t\n";
    last;
  }
}
<>;