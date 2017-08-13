# Find maximum total from top to bottom of the triangle...

@origTriangle = @{&setUpDataStructure};
@pathTriangle = @{&calcPaths(\@origTriangle)};
@pathMarkedTriangle = @{&findPath(\@pathTriangle)};
@pathMarkedOrigTriangle = @{&copyPath(\@pathMarkedTriangle,\@origTriangle)};
&printTriangle(\@pathMarkedTriangle);
print "--------------------------------------------------------------------------------------------------------------------------------------------------\n";
&printTriangle(\@pathMarkedOrigTriangle);

sub setUpDataStructure {
my $triangle =
"75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23";
my @triangle = split /\n/,$triangle;
my $row;
foreach $row(@triangle) {
  my @row = split /\s+/, $row;
  $row = \@row;
}
return \@triangle;
}

sub calcPaths {
  my $triangle = shift;
  my @triangle = @{$triangle};
  my @pathTriangle;
  my $idxRow;
  my $idxCol;

  # Special case for 1st row...
  @triangleRowPrev = ();
  @triangleRowCurr = @{$triangle[0]} ;
  my @pathTriangleRow;
  push @pathTriangleRow, $triangleRowCurr[0] + $triangleRowPrev[0];
  push @pathTriangle, $triangle[0];
  @triangleRowPrev = @{$pathTriangle[0]};

  for($idxRow = 1; $idxRow<=$#triangle;$idxRow++) {
    @triangleRowCurr = @{$triangle[$idxRow]};
    
    my @pathTriangleRow;

    push @pathTriangleRow, $triangleRowCurr[0] + $triangleRowPrev[0];
    for($idxCol = 1; $idxCol<$#triangleRowCurr; $idxCol++) {
      push @pathTriangleRow, $triangleRowCurr[$idxCol] + max($triangleRowPrev[$idxCol - 1],$triangleRowPrev[$idxCol]);
    }
    push @pathTriangleRow, $triangleRowCurr[$#triangleRowCurr] + $triangleRowPrev[$#triangleRowCurr - 1];

    push @pathTriangle, \@pathTriangleRow;
    @triangleRowPrev = @pathTriangleRow;
  }
  return \@pathTriangle;
}

sub printTriangle {
  my $triangle = shift;
  my @triangle = @{$triangle};
  my $idxSpaces;
  my $spacing;
  my $numSize = &findMaxLen(\@triangle);
  # Calculate spacing size based on max number size
  for($idxSpaces=0;$idxSpaces<$numSize;$idxSpaces++) {
    $spacing.=' ';
  }
  my @row;
  my $idxRow;
  my $idxCol;
  my $offset;
  my $idxOffset;
  for($idxRow=0;$idxRow<=$#triangle;$idxRow++) {
    @row = @{$triangle[$idxRow]};
    $offset = $#triangle - $idxRow;
    for($idxOffset=0;$idxOffset<$offset;$idxOffset++) {
      print $spacing;
    }
    for($idxCol=0;$idxCol<$#row;$idxCol++) {
      print padNbr($row[$idxCol],$numSize).$spacing;
    }
    print padNbr($row[$#row],$numSize)."\n";
  }
}

sub max {
  my @array = @_;
  @array = sort {$a <=> $b} @array;
  return $array[$#array];
}

sub maxLen {
  my $maxLen = shift;
  my @array = @_;
  @array = sort {length($a) <=> length($b)} @array;
  return max($maxLen,length($array[$#array]));
}

sub findPath {
  my $triangle = shift;
  my @triangle = @{$triangle};
  my @lastRow = @{$triangle[$#triangle]};
  my $idxCol;
  my $max=-1;
  my $idxMax=-1;
  for($idxCol = 0;$idxCol <=$#lastRow;$idxCol++) {
    if($lastRow[$idxCol]>$max) {
      $idxMax=$idxCol;
      $max=$lastRow[$idxCol];
    }
  }
  $lastRow[$idxMax] = "[$lastRow[$idxMax]]";
  $triangle[$#triangle] = \@lastRow;

  my $idxRow;
  for($idxRow = $#triangle - 1; $idxRow > -1; $idxRow--) {
    my @row = @{$triangle[$idxRow]};
    if($row[$idxMax - 1] > $row[$idxMax]) {
      $idxMax--;
    }
    $row[$idxMax] = "[$row[$idxMax]]";
    $triangle[$idxRow] = \@row;
  }
  return \@triangle;
}

sub copyPath {
  my $srcTriangle = shift;
  my $tgtTriangle = shift;
  my @srcTriangle = @{$srcTriangle};
  my @tgtTriangle = @{$tgtTriangle};

  my $idxSrcRow;
  my @srcRow;
  my @tgtRow;
  my $idxSrcCol;

  for($idxSrcRow = 0; $idxSrcRow <=$#srcTriangle; $idxSrcRow++) {
    my @srcRow = @{$srcTriangle[$idxSrcRow]};
    my @tgtRow = @{$tgtTriangle[$idxSrcRow]};
    for($idxSrcCol=0;$idxSrcCol<=$#srcRow;$idxSrcCol++) {
      if($srcRow[$idxSrcCol] =~ /^\[.+\]$/) {
        $tgtRow[$idxSrcCol] = "[$tgtRow[$idxSrcCol]]";
      }
    }
    $tgtTriangle[$idxSrcRow] = \@tgtRow;
  }

  return \@tgtTriangle;
}

sub markMaxInArray {
  # Assumes all numbers are >= 0
  my $array = shift;
  my @array = @{$array};
  my $max=-1;
  my $idxMax=-1;
  my $idxScan;
  for($idxScan=0;$idxScan<=$#array;$idxScan++) {
    if($array[$idxScan]>$max) {
      $idxMax=$idxScan;
      $max=$array[$idxScan];
    }
  }
  $array[$idxMax] = "[$array[$idxMax]]";
  return @array;
}
    

sub findMaxLen {
  # Assumes max number is at the bottom of the triangle
  my $triangle = shift;
  my @triangle = @{$triangle};
  my $maxLen=-1;
  my $idxMaxLen;
  my @row = @{$triangle[$#triangle]};
  for($idxMaxLen=0;$idxMaxLen<=$#row;$idxMaxLen++) {
    $maxLen = maxLen($maxLen,$row[$idxMaxLen]);
  }
  return $maxLen;
}

sub padNbr {
  my $nbr = shift;
  my $amt = shift;
  my $shiftNbr=$amt - length($nbr);
  if($shiftNbr<0) {die("Can't pad a number that's greater than the max size allowed!\n")};
  my $idxPad;
  for($idxPad=0;$idxPad<$shiftNbr;$idxPad++) {
    $nbr.=' ';
  }
  return $nbr;
}
<>;