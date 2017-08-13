$dir=readpipe('dir /b *.pl.txt');
@dir=split /\n/,$dir;
foreach $file(@dir) {
  $file1=$file;
  $file1=~s/.pl.txt$/.pl/;
  system("ren \"$file\" \"$file1\"\n");
}
$dir=readpipe('dir /b *.bat.txt');
@dir=split /\n/,$dir;
foreach $file(@dir) {
  $file1=$file;
  $file1=~s/.bat.txt$/.bat/;
  system("ren \"$file\" \"$file1\"\n");
}