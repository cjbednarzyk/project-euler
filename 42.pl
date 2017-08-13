&initNamesList;
&initAlphaValues;
for($idxNames=0;$idxNames<=$#names;$idxNames++) {
  $nameScore = getAlphaValue($names[$idxNames]);
  $names[$idxNames]=$nameScore;
  if($nameScore>$max) {
    $max=$nameScore;
  }
}
deriveTriangleNumbers($max);
for($idxNames=0;$idxNames<=$#names;$idxNames++) {
  if(exists($triNbr{$names[$idxNames]})) {
    $totScore++;
  }
}
print "There are $totScore triangle words in the file\n";
<>;
sub initNamesList {
  my $line;
  my @line;
  open(InFile,"<words.txt");
  while($line=<InFile>) {
    chomp $line;
    $line =~ s/\"//g;
    @line = split ",",$line;
    push @names,@line;
  }
  close(InFile);
  @names = sort @names;
}

sub initAlphaValues {
%alphaVals = (
"A",1,
"B",2,
"C",3,
"D",4,
"E",5,
"F",6,
"G",7,
"H",8,
"I",9,
"J",10,
"K",11,
"L",12,
"M",13,
"N",14,
"O",15,
"P",16,
"Q",17,
"R",18,
"S",19,
"T",20,
"U",21,
"V",22,
"W",23,
"X",24,
"Y",25,
"Z",26
);
}

sub getAlphaValue {
  my $name = shift;
  my $idxPos;
  my $alphaVal = 0;
  for($idxPos=0;$idxPos<length($name);$idxPos++) {
    $alphaVal+= $alphaVals{substr($name,$idxPos,1)};
  }
  return $alphaVal;
}

sub deriveTriangleNumbers {
  my $triMax=shift;
  my $triNbr;
  for(my $idx=1;;$idx++) {
    $triNbr=0.5*$idx*($idx+1);
    if($triNbr>$triMax) { last;}
    $triNbr{$triNbr}=$idx;
  }
}