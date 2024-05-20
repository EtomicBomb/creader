Read this for an incomplete tutorial 

I. Initial configuration
=============================================================================
	A. BACK IT UP BEFORE YOU DO ANYTHING!!!!!
	B. Make sure that the folder titled CReader is on your desktop
	C. Make sure you have Perl 5 or later installed
		1. type ‘perl -v’ on your terminal to check
	D. Make sure you have administrator privileges
	E. This entire thing will be easier if you use a mac
	F. Make sure you have some version of TI-Connect on your computer
	G. Make sure you have a link cable (the one you use to charge it)
	H. Make sure your calculator is empty 
		1. This would be a good time to back it up if you haven’t already
		2. Type [2nd][MEM][7][RIGHT][RIGHT][1][2]
		3. This will get rid of all programs and apps that are on your graphing calculator
	
II. Making the files
=============================================================================
	A. Download a book from the internet in plain-text UTF-8 format
		1. You can use sites like gutenberg.org or goodreads.com (not recommended)
	B. Put the file in the CReader folder
	C. Rename the file ‘book’ WITH NO EXTENSION!1!!!
	D. Open your terminal 
		1. If you have a Mac, the path will be ‘/Applications/Utilities/Terminal.app’
	E. change you working directory to the CReader folder
		2. You can do this through ‘cd ~/Desktop/CReader’
	F. type ‘perl booktoprogram.pl’ and hit enter
		1. This will probably say something like colors are illegal a lot of times
		2. If you have a PC, figure it out, I can’t help you

III. Loading them on your calculator
=============================================================================
	A. Plug your graphing calculator into the usb port on your computer
	B. Open the TI Device Explorer Application on your computer
	C. Drag the ‘.8xp’ files onto the graphing calculator icon who’s title doesn’t include CRSTO
	D. Drag the first CRSTO file onto your graphing calculator 
	E. on your calculator, go to [2nd][MEM][7][2] and scroll down until you see the file
	F. Press enter and archive the file
	G. repeat step D through G until you have all of the files on your computer
		1. you might be able to do these two or three at a time, depending on how much 		    
                memory your calculator has
		2. DON’T archive the non-CRSTO programs

IV. Troubleshooting/FAQ
=============================================================================
	A. I don’t understand something in your readme
		1. Sorry
	B. My graphing calculator says an error
		1. If it’s ERR:MEMORY, then you don’t have all of the CRSTO programs archived
			a. Also try running ‘Clear Entries’ and DelVar Str2 if that doesn’t work
		2. If it’s anything else, I’m sorry, I can’t help you
	C. My computer says ‘Alert there was an error transferring’ etc, and when I click 	        
            ’Show History’ it says there wasn’t enough space on my calculator even though when I 	          
            pressed [2nd][MEM][2] it says there is
		1. turn your graphing calculator on and off twice and try again
	D. The perl script has some error
		1. Ignore it, and if there are further problems, try it again
	E. Why do the names of some of your programs start with theta?
		1. To separate the sub programs from the rest of the programs. When you have a bunch 		    
                of programs on your graphing calculator, you want the ones at the top to be the ones 
		    that you can execute 
		
