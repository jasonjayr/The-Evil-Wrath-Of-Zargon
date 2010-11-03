The Wrath Of Zargon!
====================
Version: (filled out by release script)

Release Date: (filled out by release script)

[Github project](https://github.com/jasonjayr/The-Evil-Wrath-Of-Zargon)

[Home page](http://www.jjayr.com/zargon/)

This codebase represents the efforts of a bunch of high-school kids back in
1998-1999.  We've all moved on and grown up, some of us on to professional
software development too, but this project still lingers at the back of our
heads as one of our first multi-developer projects.

DISCLAIMER
==========

Heh.  This code is *FULL* of bugs.  You will overflow the stack.  You will
crash the interpreter.  You will force QB to mess up the UI and prompt you to
'Redo from start'.  Sorry :)  Perhaps it ought to be fixed, or perhaps it's
part of whole experience of the game :)  Although we reccomend running it in
the dosbox emulator to isolate it from the rest of your system, we assume no
liability if this breaks your system.  You get to keep both pieces.


LICENSE
=======

This work is licensed under the terms of the GNU Public License, Version 2.0.
See COPYING in this bundle for details.


REQUIREMENTS
============

You will need a few things to make this work.


* [Dosbox](http://www.dosbox.com/)
  
  Debian/Ubuntu users can simply:

    apt-get install dosbox

  Windows users will need the windows installer on the [downloads](http://www.dosbox.com/download.php?main=1)
  page.

* QBASIC

  QBasic is copyrighted software by Microsoft, So we can't distribute it in
  this bundle.  However you can simply download it from 
  [this link](http://support.microsoft.com/kb/135315).
  This is all the old dos utilities you'd find on the Windows 95 'Extras' cd (that no one every looked at anyway)
  Search for the "Download olddos.exe now" link on that page. This contains a
  few old dos utilities, including qbasic.exe.  The .exe is simply a
  Self-extracting PKZip archive, you can open it with Windows' built in
  compressed folders or [7zip](http://www.7-zip.org/)


INSTALLATION
============

This version does not have an integrated installer, and requires some steps on
your part.

1. Download and Install DOSBox from the link described above.
2. Download zargon-$VERSION.zip and extract it's contents to a folder.  For
   simplicity, we reccomend C:\Zargon (Note that there will be a subfolder named
   'ZARGON' in there, this is normal)
3. Download olddos.exe from http://support.microsoft.com/kb/135315
4. Extract the contents of olddos.exe into the 'DOS' subfolder created in Step 1.
5. Windows users, double click run_windows.bat, Linux users, chmod a+x run_linux.sh, and run ./run_linux.sh

Enjoy!

NOTES
=====

In the interest of nostalgia, I've left the original codebase mostly intact.
I had made a few edits to this version over the past to try to make it work
with the QB 4.5 compiler, but when even QB 4.5 choked on compiling this, I
figured it was best to leave it be.  Please refer to this readme for accurate
email address information, and not in the source code.

CONTRIBUTORS
============

I (Jason Rodrigues jasonjayr@gmail.com) have had this code lingering
(festering?) on random systems untill I decided to see if we could get it
published in 2010. I only had a small hand in this, making a tool that could
assemble the graphics into a 'wad' file format (Which I've lost the writer for
at this point), and more recently arranging it into a runable state with
dosbox.

Other contributors, which put much more effort into the original codebase:
(This is from memory, this was a long time ago)

Snappahed Software 98 is

* Greg Millette
* Geoff Graves
* Aaron Sokoloski
* Jeff Gariepy
