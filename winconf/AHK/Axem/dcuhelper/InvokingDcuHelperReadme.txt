//---------------------------------------------------------------------------
This tiny helper utility will let your program check for updates by invoking the
 isntalled DcUpdater tool on their computer, or explaining to them how to get it
 and directing them to the DcUpdater web page (and your program's web page)
 if it's not installed.

For help, more examples, sample scripts, see this thread on our forum:
 http://www.donationcoder.com/Forums/bb/index.php?topic=9607.0

Main DcUpdater web page:
 http://www.donationcoder.com/Software/Mouser/Updater/index.html
//---------------------------------------------------------------------------


//---------------------------------------------------------------------------
Version info:
  v1.03.01 - August 1, 2008 - added -t commandline option
              fixed bug in opening dcupdater page
              improved dialog on updater not installed
              if no commandline options are passed it will try to load .dcupdate file in current dir and check for updates
	v1.02.02 - September 8, 2007 - added a few more easier exported funcs.
	v1.02.01 - September 8, 2007 - added dll exports, improved help,
		opens program webpage if updater not installed.
		added version info to usage display (invoke with no arguments).
	v1.01.01 - August 16, 2007 - first public release
//---------------------------------------------------------------------------


//---------------------------------------------------------------------------
1. To run dcuhelper to check for update to a .dcupdate file in current directory just do:
  dcuhelper.exe

2. To register your program's directory with the system updater:
	dcuhelper.exe -r "program_labelname" "full_path_to_app_directory"

3. To invoke the updaterwith various commandline options:
	dcuhelper.exe -[r]i "program_labelname" "full_path_to_app_directory_or_._for_currentdir" "missingupdatertitle_or_._for_silent" [commandline options to be passed to updater]

   e.g. if they explicitly ask to check for updates, do so and report results no matter what:
    dcuhelper.exe -ri "ProcessTamer" "C:\Program Files\ProcessTamer" "Error"
    ----> NOTE: THIS IS THE MOST COMMON USE <----

   e.g. or if you want to check for updates at startup silently (dont report if no update found):
    dcuhelper.exe -ri "ProcessTamer" "C:\Program Files\ProcessTamer" "."

4. To UNregister your program's directory with the system updater (not really necessary):
	dcuhelper.exe -u "program_labelname"

5. To test behavior on a system without dcupdater installed:\n");
  dcuhelper.exe -t "program_labelname" "full_path_to_app_directory_or_._for_currentdir" "missingupdatertitlemessage_or_._for_silent" [extra commandline options to be passed to updater]

6. Anything else (dcuhelper.exe ?) to show this list

Note: program_labelname is just a unique arbitrary label that is used to create the redirect files (see below).
//---------------------------------------------------------------------------



//---------------------------------------------------------------------------
How does dcuhelper.exe register your program with the updater?
It creates a file:
	%COMMONAPPDATA%\\DonationCoder\\DcUpdater\\RedirectFiles\program_labelname.dcupdateredirect
Which points to your program's directory.
//---------------------------------------------------------------------------



//---------------------------------------------------------------------------
You can also load the dcuhelper.exe from within your program as if it were
 a dll, and invoke it that way (and check for updater path/existence):

extern "C" __declspec( dllexport ) int DLLMainCall(int argc, char** argv);
//returns 0 on success

extern "C" __declspec( dllexport ) int __stdcall DLLMainCall2(int argc, char* arg1, char* arg2, char* arg3, char* arg4, char* arg5, char* arg6, char* arg7, char* arg8);
// same as above, but pass a bunch of arguments to the call as strings

extern "C" __declspec( dllexport ) char* DLLGetDcUpdaterPath(char *appdir);
// returns a blank string on not installed

extern "C" __declspec( dllexport ) int __stdcall DLLGetDcUpdaterPath2(char *appdir, int maxlen);
// this version returns 1 if updater is installed, and copies the path into the passed appdir string buffer, with maximum length maxlen
// and returns 0 if not installed
//---------------------------------------------------------------------------
