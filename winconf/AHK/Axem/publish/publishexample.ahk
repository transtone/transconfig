; Axem Publishing Script
#NoEnv
SetWorkingDir %A_ScriptDir%\..  ; Ensures a consistent starting directory.
FileList =
Loop *.ahk
   FileList = %FileList%%A_LoopFileLongPath%`n
Loop *.exe
   FileList = %FileList%%A_LoopFileLongPath%`n
Loop, parse, FileList, `n
	 runwait, c:\utils\fbzip\FbZip.exe -a "%A_ScriptDir%\..\Releases\Axem.zip" "%A_LoopField%" 
