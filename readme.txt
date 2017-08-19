

	Avanti GUI version 0.9.2
	========================

	1. Copy the "Avanti-ffmpeg-GUI-092" folder to a directory of your choice.
	   Windows 7 and 8 users should first read the notes on these OS' below.

	2. Copy a recent (January 2014+) "ffmpeg.exe" and "ffplay.exe" executable
	   to the "ffmpeg" folder at your Avanti install directory.

	3. Launch Avanti and open the "User Preferences" at the top left toolbar
	   button menu and select your preferred settings (optional).

	For information about supported FFmpeg/FFplay builds and other details,
	visit the Avanti home page at "http://avanti.arrozcru.org".
	
	For usage details and available options, run the included "Avanti-help.chm"
	help file. Avanti GUI supports context sensitive help. When you press <F1>
	on open windows, dialogs, selected pages, dropdown boxes and input fields,
	you'll be (often) directed to the related topic of this chm help.


	AVANTI on Windows 7 and 8.
	==========================

	Avanti has compatibility issues on Windows 7 but can run successfully on this
	operating system if you follow the installation suggestions below which may be
	also applicable on Windows 8 (not tested) ...
	
	General notes for all Windows 7 versions;

	Run Avanti from a desktop shortcut or the official Windows Explorer shell.
	Running from thirth party shells like e.g. "Total Commander" may get issues.

	The Avanti Install path should not exceed a total length of 256 characters
	including file names.

	Run Avanti as a native Windows 7 application.


	Windows 7 (32-bit).
	===================

	We had stable results at several install paths by keeping the application in the
	"Avanti-ffmpeg-GUI-092" folder but you can change the name as long as you keep it
	at exactly 21 chars long. Should Avanti still fail to launch or you experience
	other issues, change the length of the folder name a bit like e.g.;

	         "C:\your_path\Avanti-GUI-092"
	         "C:\your_path\Avanti-GUI"

	Even when you upgrade an older Avanti version that worked fine, you may need to
	follow this procedure to find a path that this version of Avanti "likes".

	Also run the "avanti_jobs_test.job" if you plan to use the batch processing option.
	The list should finish without any interruptions.


	Windows 7 x64 (64-bit).
	=======================

	According to the Microsoft recommendations, 32-bit applications should be installed
	in the "Program Files (x86)" folder at you boot drive. Everything written for the
	Windows 7 32-bit version is also applicable here.

	It is recommended to start with a full 32-bit tool chain i.e. do not use a 64-bit
	FFmpeg and/or AviSynth version. If this works without issues you could try a 64-bit
	FFmpeg or even 64-bit FFmpeg/AviSynth combo. Some users reported they could use this
	setup successfully with Avanti.


	April 2015 - Chris Kevany

