#!/usr/bin/perl -w 

#makes a TI-BASIC program with the contents of "program"
#first line is the name of the program

open SORC, "<", "program" or
	die "Couldn't open 'program', $!";
	
chomp (my $programName = <SORC>);
	
open PROG, ">", "$programName.TIProgram" or 
	die "Couldn't create 'completed-program', $!";

$START_PROG = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>cells</key>\n\t<array>\n\t\t<dict>\n\t\t\t<key>column</key>\n\t\t\t<integer>1</integer>\n\t\t\t<key>row</key>\n\t\t\t<integer>1</integer>\n\t\t\t<key>stringValue</key>\n\t\t\t<string>";
$END_PROG = "</string>\n\t\t</dict>\n\t</array>\n\t<key>device name</key>\n\t<string>$programName</string>\n\t<key>device type</key>\n\t<string>TI-84 Plus</string>\n\t<key>isProtected</key>\n\t<false/>\n\t<key>object type</key>\n\t<string>Program</string>\n</dict>\n</plist>";

$lineCounter = 0;
while (<SORC>) {
	chomp;
	++$lineCounter == 1 ? print PROG $START_PROG . $_ : print PROG "\r" . $_;
}
print PROG $END_PROG;
