for($perim=1;$perim<=1000;$perim++) {
  $slnCurr=findRightTriangles4Perim($perim);
  print "Found $slnCurr solutions for p = $perim...\n";
  if($slnCurr>$max) {
    $max=$slnCurr;
    $perimMax=$perim;
  }
}
print "The number of solutions is maximized for p = $perimMax\n";
<>;

sub findRightTriangles4Perim {
  my $p = shift;
  my $c;
  my $solNbr;
  for(my $a=1;$a<=$p;$a++) {
    for(my $b=$a;$b<=($p-$a);$b++) {
      $c = ($a**2+$b**2)**0.5;
      if($a+$b+$c==$p) {
#        print "{$a,$b,$c}\n";
        $solNbr++;
      }
    }
  }
  return $solNbr;
}