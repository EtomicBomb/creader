#!/usr/bin/perl

open BOOK, "<", "book" or
	die "Couldn't open book, $!";
open PROG, ">", "program"
	or warn "Lol, creating a file failed, $!, but don't worry!\n";

my @blocks = (); #blocks of about 9000 bytes of text
my $blockIndex = 0;
my $lengthCounter = 1;
my $CHARSPERPAGE = 184;

while (chomp (my $line = <BOOK>) ) {
	$line .= " "; #put a space at the end of the line
	$line = uc $line; #make line uppercase
	
	$line =~ s/"/''/g; #you can't use double quotes!!
	$line =~ s/[^A-Z0-9.,()\[\[\/\-*='_ ]/?/g; #replaces
		#characters that arent legal with ?'s 
	$line =~ s/\s+/ /g; #make duplicated spaces one space

	if ($line =~ /(?<color>BLUE|RED|BLACK|MAGENTA|GREEN|ORANGE|BROWN|NAVY|YELLOW|WHITE|GRAY)/) { #colors are illigal for some reason
		$line =~ s/BLUE/?CYAN?/g;
		$line =~ s/RED/R-D/g;
		$line =~ s/BLACK/SLATE/g;
		$line =~ s/MAGENTA/M-GENTA/g;
		$line =~ s/GREEN/EMERALD/g;
		$line =~ s/ORANGE/OR*NGE/g;
		$line =~ s/BROWN/BR-WN/g;
		$line =~ s/NAVY/INDIGO/g;
		$line =~ s/YELLOW/GOLD/g;
		$line =~ s/WHITE/MILKY/g;
		$line =~ s/GRAY/GREY/g;
	}

	$lengthCounter += length $line;
	
	$blocks[$blockIndex] = $blocks[$blockIndex] . $line;	
		
		
	if ($lengthCounter > 4100) { #start new block
		$lengthCounter = 1;
		my $text = $blocks[$blockIndex];

		my $firstIndex = $CHARSPERPAGE * int( length($text)/$CHARSPERPAGE );
		my $first = substr $text, 0, $firstIndex;
		my $second = substr $text, $firstIndex;
		$blocks[$blockIndex] = $first;
		$blockIndex++;
		$blocks[$blockIndex] = $second;

	}
}

#output blocks

open LIST, ">", "LEN.TIList" or 
	die "Couldn't create list, $!\n";

my $LIST_START = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>cells</key>\n\t<array>\n";
my $LIST_END = "\t</array>\n\t<key>columnCount</key>\n\t<integer>1</integer>\n\t<key>containsComplex</key>\n\t<false/>\n\t<key>device name</key>\n\t<string>⌊LEN</string>\n\t<key>device type</key>\n\t<string>TI-83 Plus</string>\n\t<key>object type</key>\n\t<string>List</string>\n\t<key>rowCount</key>\n\t<integer>10</integer>\n</dict>\n</plist>";
print LIST $LIST_START;


my $fileName = "θCRSTO";
my $fileNameNum = 0;

for my $string (@blocks) {
	$fileNameNum++;

	my $listElement = &listElement(length $string);
	print LIST $listElement;
	
	open PROG, ">", "program"
		or die "Failed to create program, $!";
	
	print PROG $fileName . $fileNameNum . "\n";
	print PROG "DelVar Str2:\"" . $string . "→Str2";
	
	system "perl make-program.pl";
	close PROG;	
}
system "rm program";

print LIST $LIST_END;


sub listElement {
	my $index = $fileNameNum-1;	
	my $number = shift;
	my $string = "\t\t<dict>\n\t\t\t<key>column</key>\n\t\t\t<integer>0</integer>\n\t\t\t<key>numberValue</key>\n\t\t\t<integer>$number</integer>\n\t\t\t<key>row</key>\n\t\t\t<integer>$index</integer>\n\t\t</dict>\n";
	return $string;
}
