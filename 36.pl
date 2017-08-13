$max=1000000;

for($idx=1;$idx<$max;$idx++) {
  if(isPalindromic($idx)&&isPalindromic(decToBase($idx))) {
    $nbrPalindromes++;
print "Found palindromic nbrs:  $idx - ".decToBase($idx)."\n";
    $total+=$idx;
  }
  else {
#    print "$idx - ".decToBase($idx)."\n";
  }
}
print "There are $nbrPalindromes palindromic numbers (decimal and binary) < $max.  The sum is $total\n";

sub decToBase {
  my $dec=shift;
  my $exp;
  my $base=2;
  for($exp=0;$base**$exp<=$dec;$exp++) {
  }
  my $bin='';
  for($exp--;$dec>0;$exp--) {
    if($dec-$base**$exp>=0) {
      $bin.=1;
      $dec-=$base**$exp;
    }
    else {
      $bin.=0;
    }
  }
  while($exp>-1) {
    $bin.=0;
    $exp--;
  }
  return $bin;
}  

sub isPalindromic {
  my $str=shift;
  my $len=length $str;
  my $mid;
  my $l;
  my $r;
  if($len%2==0) {
    $mid=$len/2;
    $l=substr($str,0,$mid);
    $r=reverse(substr($str,$mid,$mid));
  }
  else {
    $mid=($len-1)/2;
    $l=substr($str,0,$mid);
    $r=reverse(substr($str,$mid+1,$mid));
  }
  if($l eq $r) {
    return 1;
  }
  else {
    return 0;
  }
}