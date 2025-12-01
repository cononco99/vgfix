@SETLOCAL ENABLEEXTENSIONS
@perl.exe -x "%~f0" %*
@exit /b %ERRORLEVEL%
#!perl

# thank you ijprest for the above scripting trick (https://stackoverflow.com/a/1056231/509928)

use FindBin;  # This is a module that finds the location of your script
BEGIN { chdir $FindBin::Bin }  # set context to that directory.


open OUTPUT, ">o.txt";
print OUTPUT "This is a test\n";

my $total = $#ARGV + 1;
my $counter = 1;
 
# get script name
my $scriptname = $0;
 
print OUTPUT "Total args passed to $scriptname : $total\n";
 
# Use loop to print all args stored in an array called @ARGV
foreach my $a(@ARGV) {
	print OUTPUT "Arg # $counter : $a\n";
	$counter++;
}
