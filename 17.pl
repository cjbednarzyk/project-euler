$numToWordOnes{1}="one";
$numToWordOnes{2}="two";
$numToWordOnes{3}="three";
$numToWordOnes{4}="four";
$numToWordOnes{5}="five";
$numToWordOnes{6}="six";
$numToWordOnes{7}="seven";
$numToWordOnes{8}="eight";
$numToWordOnes{9}="nine";
$numToWordTens{10}="ten";
$numToWordTens{11}="eleven";
$numToWordTens{12}="twelve";
$numToWordTens{13}="thirteen";
$numToWordTens{14}="fourteen";
$numToWordTens{15}="fifteen";
$numToWordTens{16}="sixteen";
$numToWordTens{17}="seventeen";
$numToWordTens{18}="eighteen";
$numToWordTens{19}="nineteen";
$numToWordTens{2}="twenty";
$numToWordTens{3}="thirty";
$numToWordTens{4}="forty";
$numToWordTens{5}="fifty";
$numToWordTens{6}="sixty";
$numToWordTens{7}="seventy";
$numToWordTens{8}="eighty";
$numToWordTens{9}="ninety";
$numToWordHundredsNoTensOnes="hundred";
$numToWordHundredsWithTensOnes="hundredand";
$numToWordThousands="thousand";

for($i=1;$i<=1000;$i++) {

  $thousands = substr($i,-4,1);
  $hundreds  = substr($i,-3,1);
  $tens      = substr($i,-2,1);
  $ones      = substr($i,-1,1);

  if($thousands ne '') {
    $thousandsInWords=$numToWordOnes{$thousands}.$numToWordThousands;
  }
  else {
    $thousandsInWords='';
  }
  if($hundreds ne '' && $hundreds > 0) {
    $hundredsInWords=$numToWordOnes{$hundreds}.$numToWordHundredsNoTensOnes;
  }
  else {
    $hundredsInWords='';
  }

  if($tens == 1) {
    $tens = substr($i,-2,2);
    $ones = 0;
  }
  $tensInWords = $numToWordTens{$tens};
  $onesInWords = $numToWordOnes{$ones};

  if(($hundreds > 0)&&(($tens > 0)||($ones > 0))) {
    $hundredsInWords=$numToWordOnes{$hundreds}.$numToWordHundredsWithTensOnes;
  }

  $word=$thousandsInWords.$hundredsInWords.$tensInWords.$onesInWords;
  $lenWord=length($word);
  $lenTotal+=$lenWord;
  print "$i:\t$word:\t$lenWord\n";
}
print "The total number of letters is:  $lenTotal\n";
<>;