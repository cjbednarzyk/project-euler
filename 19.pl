@days=(31,28,31,30,31,30,31,31,30,31,30,31);
for($yr=1900;$yr<=2000;$yr++) {
  if(($yr % 4 == 0)&&(($yr % 100 != 0)||($yr % 400 == 0))) {
    $days[1] = 29;
  }
  else {
    $days[1] = 28;
  }
  for($mon=0;$mon<=$#days;$mon++) {
    $daysTot+=$days[$mon];
    if(($daysTot%7 == 6)&&($yr>1900)) {
      $sundays++;
    }
  }
}
print "$sundays\n";
<>;