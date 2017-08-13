$fib1=0;
$fib2=1;
while(1) {
  $fib = $fib1+$fib2;
  $fib1= $fib2;
  $fib2= $fib;

  if($fib>4000000) {
    last;
  }
  if($fib % 2 == 0) {
    $total+=$fib;
    print "$fib\n";
  }
}

print "The sum of even-valued terms less than four million in the Fibonacci sequence is:  $total\n";
<>;