@SETLOCAL ENABLEEXTENSIONS
@perl.exe -x "%~f0" %*
@exit /b %ERRORLEVEL%
# Thanks to ijprest for the scripting trick (https://stackoverflow.com/a/1056231/509928)

#!perl

use strict; 
use warnings;
use File::Basename;

($#ARGV == 0) or die "expected exactly 1 filename argument.";

my $input_file=$ARGV[0];
my($filename, $dirs, $suffix) = fileparse($input_file);
my $output_file= $dirs . "vgfix_" . $filename . $suffix;

open(INPUT, '<', $input_file) or die "could not open $input_file";
open(OUTPUT, '>', $output_file) or die "could not open $output_file";

while (<INPUT>) {
  $_ =~ s/<INCOMETYPE>REINVEST/<INCOMETYPE>DIV/;
  print OUTPUT;
}

close (INPUT); 
close (OUTPUT);
