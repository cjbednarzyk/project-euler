$szGrid=1000;
for($i=0;$i<$szGrid;$i++) {
  push @rowNew,0;
}
$rowNew = \@rowNew;
for($j=0;$j<$szGrid;$j++) {
  my $row = $rowNew;
  push @grid,$row;
}

$x = $szGrid/2;
$y = $x;
$dir=0;

for($i=1;$i<=1;$i++) {
  &move;
}

print "".countSquares()." squares are black...\n";
<>;

sub move {
  if($grid[$x][$y] == 1) {
    $grid[$x][$y]=0;
    $dir = ($dir-90)%360;
  }
  else {
    $grid[$x][$y]=1;
    $dir = ($dir+90)%360;
  }

  if($dir==0) {
    if($y==0) {
      my $row = $grid[$x];
      @row = @{$row};
      unshift @row,0;
      $row = \@row;
      $grid[$x]=$row;
    }
    $y--;
  }
  elsif($dir==90) {
    if($x==$#grid) {
      my @row = @{$rowNew};
      push @grid,$row;
    }
print "hi - $x\n";
    $x++;
  }
  elsif($dir==180) {
    $row = $grid[$x];
    @row = @{$row};
    if($y==$#row) {
      push @row,0;
      my $row = \@row;
      $grid[$x]=$row;
    }
    $y++;
  }
  else {
    if($x==0) {
      my $row = $rowNew;
      unshift @grid,$row;
    }
    $x--;
  }
}

sub countSquares {
  my $ct=0;
  foreach $row(@grid) {
    @row = @{$row};
#print (join " ", @row)."\n";
    foreach $col(@row) {
      if($col==1) {
#print "$ct\n";
        $ct++;
      }
    }
  }
  return $ct;
}
