@digits = (0,1,2,3,4,5,6,7,8,9);
@nbrs   = @digits;
for($i=0;$i<3;$i++) {
  print "Iteration ".($i+1)." out of ".(scalar(@digits))."\n";
  $#nbrsTmp=-1;
  for($j=0;$j<=$#digits;$j++) {
    for($k=0;$k<=$#nbrs;$k++) {
      if(index($nbrs[$k],$j)==-1) {
        push @nbrsTmp,$nbrs[$k].$j;
      }
    }
  }
  @nbrs=@nbrsTmp;
  @nbrs=sort @nbrs;
  $nbrs{$i+1}=\@nbrs;
  print scalar(@nbrs)." lexicographic permutations have been derived for length ".($i+1)."...\n";
}

foreach $nbr(@nbrs) {
  if($nbr%2==0) {
    push @nbrs2,$nbr;
  }
  if($nbr%3==0) {
    push @nbrs3,$nbr;
  }
  if($nbr%5==0) {
    push @nbrs5,$nbr;
  }
  if($nbr%7==0) {
    push @nbrs7,$nbr;
  }
  if($nbr%11==0) {
    push @nbrs11,$nbr;
  }
  if($nbr%13==0) {
    push @nbrs13,$nbr;
  }
  if($nbr%17==0) {
    push @nbrs17,$nbr;
  }
}
print "Constraints part 1 have been derived...\n";
print ".\n";
foreach $nbr(@nbrs) {
  foreach $nbr2(@nbrs2) {
    if(substr($nbr,1,2) == substr($nbr2,0,2)) {
      push @nbrc,$nbr;
      push @nbr2c,$nbr2;
    }
  }
}
print ".\n";
foreach $nbr2c(@nbr2c) {
  foreach $nbr3(@nbrs3) {
    if(substr($nbr2c,1,2) == substr($nbr3,0,2)) {
      push @nbr2f,$nbr2c;
      push @nbr3c,$nbr3;
    }
  }
}
print ".\n";
foreach $nbr3c(@nbr3c) {
  foreach $nbr5(@nbrs5) {
    if(substr($nbr3c,1,2) == substr($nbr5,0,2)) {
      push @nbr3f,$nbr3c;
      push @nbr5c,$nbr5;
    }
  }
}
print ".\n";
foreach $nbr5c(@nbr5c) {
  foreach $nbr7(@nbrs7) {
    if(substr($nbr5c,1,2) == substr($nbr7,0,2)) {
      push @nbr5f,$nbr5c;
      push @nbr7c,$nbr7;
    }
  }
}
print ".\n";
foreach $nbr7c(@nbr7c) {
  foreach $nbr11(@nbrs11) {
    if(substr($nbr7c,1,2) == substr($nbr11,0,2)) {
      push @nbr7f,$nbr7c;
      push @nbr11c,$nbr11;
    }
  }
}
print ".\n";
foreach $nbr11c(@nbr11c) {
  foreach $nbr13(@nbrs13) {
    if(substr($nbr11c,1,2) == substr($nbr13,0,2)) {
      push @nbr11f,$nbr11c;
      push @nbr13c,$nbr13;
    }
  }
}
print ".\n";
foreach $nbr13c(@nbr13c) {
  foreach $nbr17(@nbrs17) {
    if(substr($nbr13c,1,2) == substr($nbr17,0,2)) {
      push @nbr7f,$nbr7c;
      push @nbr17c,$nbr17;
    }
  }
}
print ".\n";
foreach $nbr2f(@nbr2f) {
  foreach $nbrc(@nbrsc) {
    if(substr($nbrc,1,2) == substr($nbr2f,0,2)) {
      push @nbrf,$nbrc;
    }
  }
}
print "Constraints part 2...\n";
<>;
foreach $nbr17(@nbrs17) {
  foreach $nbr13(@nbrs13) {
    if(substr($nbr13,1,2) == substr($nbr17,0,2)) {
      foreach $nbr11(@nbrs11) {
        if(substr($nbr11,1,2) == substr($nbr13,0,2)) {
          foreach $nbr7(@nbrs7) {
            if(substr($nbr7,1,2) == substr($nbr11,0,2)) {
              foreach $nbr5(@nbrs5) {
                if(substr($nbr5,1,2) == substr($nbr7,0,2)) {
                  foreach $nbr3(@nbrs3) {
                    if(substr($nbr3,1,2) == substr($nbr5,0,2)) {
                      foreach $nbr2(@nbrs2) {
                        if(substr($nbr2,1,2) == substr($nbr3,0,2)) {
                          foreach $nbr(@nbrs) {
                            if(substr($nbr,1,2) == substr($nbr2,0,2)) {
                              $pandigital=$nbr.substr($nbr2,2,1).substr($nbr5,2,1).substr($nbr7,2,1).substr($nbr11,2,1).substr($nbr13,2,1).substr($nbr17,2,1);
                              $sum+=$pandigital;
                              print "Found pandigital #:  $pandigital\n";
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
print "The sum of all 0 to 9 pandigital numbers with this property is:  $sum\n";
<>;