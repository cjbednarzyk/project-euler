open(InFile,"<grid.txt");
while($line=<InFile>) {
  chomp $line;
  @line = split " ", $line;
  @grid=(@grid,@line);
}
close(InFile);
$szGrid=(scalar(@grid))**0.5;
$szOperand=4;

# Horizontal products
for($idxStart=0;$idxStart<scalar(@grid);$idxStart++) {
  if($idxStart%$szGrid>($szGrid-$szOperand)) {
    # Ignore these products as they include operands on 2 different rows
  }
  else {
    $prodTmp=1;
    for($idxOp=0;$idxOp<$szOperand;$idxOp++) {
      $prodTmp*=$grid[$idxStart+$idxOp];
    }
    if($prodTmp>$prodMax) { $prodMax = $prodTmp; }
  }
}

# Vertical products
for($idxStart=0;$idxStart<(scalar(@grid) - $szGrid*$szOperand);$idxStart++) {
  $prodTmp=1;
  for($idxOp=0;$idxOp<$szOperand;$idxOp++) {
    $prodTmp*=$grid[$idxStart+$szGrid*$idxOp];
  }
  if($prodTmp>$prodMax) { $prodMax = $prodTmp; }
}

# Diagonal-down-right products
for($idxStart=0;$idxStart<(scalar(@grid) - $szGrid*$szOperand);$idxStart++) {
  if($idxStart%$szGrid>($szGrid-$szOperand)) {
    # Ignore these products as they would include operands on 2 different rows
  }
  else {
    $prodTmp=1;
    for($idxOp=0;$idxOp<$szOperand;$idxOp++) {
      $prodTmp*=$grid[$idxStart+($szGrid+1)*$idxOp];
    }
    if($prodTmp>$prodMax) { $prodMax = $prodTmp; }
  }
}

# Diagonal-down-left products
for($idxStart=0;$idxStart<(scalar(@grid) - $szGrid*$szOperand);$idxStart++) {
  if($idxStart%$szGrid<$szOperand) {
    # Ignore these products as they would include operands on 2 different rows
  }
  else {
    $prodTmp=1;
    for($idxOp=0;$idxOp<$szOperand;$idxOp++) {
      $prodTmp*=$grid[$idxStart+($szGrid-1)*$idxOp];
    }
    if($prodTmp>$prodMax) { $prodMax = $prodTmp; }
  }
}

print "The greatest product of four adjacent numbers in any direction (up, down, left, right, or diagonally) in the $szGrid X $szGrid grid is:\n\n$prodMax\n";
<>;