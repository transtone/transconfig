; Axem (AutoHotkey Script Manager)
#NoEnv
#SingleInstance
DetectHiddenWindows On  ; Allows a script's hidden main window to be detected.	
SetTitleMatchMode, 2  ; Avoids the need to specify the full path of the file below.
SendMode Input
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include includes\Anchor.ahk ; Thanks to Titan for their Anchoring & functions tools http://www.autohotkey.net/~Titan/
#Include includes\Functions.ahk

functions()
IgnoreSelf = 1
IniFile = settings.ini
AppTitle = Axem - AutoHotKey Scripts Manager
RegRead, Editor, HKEY_CLASSES_ROOT, AutoHotkeyScript\Shell\Edit\Command
RegRead, Compiler, HKEY_CLASSES_ROOT, AutoHotkeyScript\Shell\Compile\Command
If ErrorLevel
	Editor = notepad.exe
Else
	StringTrimRight, Editor, Editor, 3
RegRead, Compiler, HKEY_CLASSES_ROOT, AutoHotkeyScript\Shell\Compile\Command
If NOT ErrorLevel
	StringTrimRight, Compiler, Compiler, 4
	
ScanFolder =
LongFileList =
PathList = 
FileList = 
AppId =

Menu, tray, NoStandard
Menu, tray, Add, Show Axem,ButtonRescan
Menu, tray, Add,
Menu, tray, Standard
Menu, tray, Default, Show Axem
Menu,Options,Add,Edit,EditFile
Menu,Options,Add,Explore...,ShowFolder
Menu,Options,Add,
Menu,Options,Add,Compile,CompileFiles
Menu,Options,Add,Publish,PublishFiles
Menu,Options,Add,Compile && Publish,CompileAndPublish

Gosub,READINI
GoSub, ShowWindow
GoSub, RunStartup
GoSub, Wait

ShowWindow:
	EnableCheckboxEvents = 0
	Gui Destroy
	Gui, +Resize
	Gui, Add, Text,, Scripts found in %ScanFolder%:

	Gui, Add, ListView, r20 w740 Count20 Checked AltSubmit gMyListView vMyListView, Script|Synopsis
	GuiControl, -Redraw, MyListView ; for performance reasons
	counter = 0
	Loop, %ScanFolder%\*.ahk, , 1 
	{
		Counter := Counter+1
		If IgnoreSelf=1
		{
			If A_LoopFileDir = %A_ScriptDir%\includes ; ignore own script
				continue
			If A_LoopFileDir = %A_ScriptDir%\publish ; ignore own script
				continue
			If A_LoopFileLongPath = %A_ScriptFullPath%
				continue		
		}		

		LongFileList = %LongFileList%%A_LoopFileLongPath%`n
		PathList = %PathList%%A_LoopFileDir%`n
	  FileList = %FileList%%A_LoopFileName%`n
		
		FolderLen := StrLen(ScanFolder)+2
		EntryTitle := SubStr(A_LoopFileLongPath, FolderLen)

		FileReadLine, line, %A_LoopFileLongPath%, 1
		if ErrorLevel
				break
		if Substr(line,1,1) = ";" 
			synopsis := Substr(line,2)
		else
			synopsis =
		%Counter%active=0
		LV_Add("", EntryTitle,synopsis)
	}

	winget,ls,list,AutoHotkey ahk_class AutoHotkey
	counter=0
	Loop,%ls%
	{
		counter := counter + 1
		RunningScript := Regexreplace(Wingettitle("ahk_id " ls%a_index%),".*\\(.*)-.*","$1")
		runningscript = %RunningScript%
		MyIndex := GetIndex(FileList,RunningScript)
		If MyIndex > 0
		{
			%MyIndex%active=1
			myfile := GetValue(FileList,MyIndex)
			LV_Modify(MyIndex,"Check")
		}
	}
	
	
	
	
	LV_ModifyCol()  ; Auto-size each column to fit its contents.
	GuiControl, +Redraw, MyListView
	
	Gui, Add, Button, Section xs vRescan, &Rescan
	Gui, Add, Button, ys vChangeFolder, &Change Folder
	Gui, Add, Button, ys Default vHide, &Hide
	 
	Menu, FileMenu, Add, &Open `tCtrl+O, ButtonChangeFolder 
	Menu, FileMenu, Add, E&xit `tAlt-F4, MenuExit
	Menu, HelpMenu, Add, &About Axem `tF1, MenuAbout
	Menu, HelpMenu, Add, &Support, MenuOnline
	Menu, HelpMenu, Add, &Homepage, MenuHomepage
	Menu, HelpMenu, Add,
	Menu, HelpMenu, Add, &Check for Updates, CheckForUpdates	
	Menu, ViewMenu, Add, &Reload   `tCtrl+R, ButtonRescan 
	Menu, MyMenuBar, Add, &File, :FileMenu 
	Menu, MyMenuBar, Add, &View, :ViewMenu
	Menu, MyMenuBar, Add, &Help, :HelpMenu
	Gui, Menu, MyMenuBar
	Gui, Show,W760 H440 Center,%AppTitle%
	EnableCheckboxEvents =1

	;store appid
	GroupAdd, AppId,%AppTitle%
return

GuiSize: 
if A_EventInfo = 1  ; The window has been minimized.  No action needed.
{
	GoSub, ButtonHide
  return
}
; fix controls correctly when resizing
Anchor("MyListView", "wh")
Anchor("Rescan", "y",true)
Anchor("ChangeFolder", "y",true)
Anchor("Hide", "y",true)
return

MenuHomepage:
Url = http://justice.dcmembers.com
	msgbox,4,Visit Axem's Homepage,Information about this and other projects can be found on Justice's DcMembers page. Do you want to load the following webpage?`n`n%Url%
	IfMsgBox Yes
    Run, %url%
return

MenuAbout:
run, readme.txt
return


#IfWinActive, ahk_group AppId
F1::
MenuOnline:
	SupportUrl = http://www.donationcoder.com/Forums/bb/index.php?topic=15482.0
	msgbox,4,Visit Online Support,Support on Axem is given via the Donationcoder.com community forums. Do you want to load the following webpage?`n`n%SupportUrl%
	IfMsgBox Yes
    Run, %supporturl%
return

#IfWinActive, ahk_group AppId
!F4::
MenuExit:
	GoSub, WRITEINI
ExitApp
return

MyListView:
if EnableCheckboxEvents <> 1
	return
	
if A_GuiEvent = DoubleClick
{
		LV_GetText(RowText, A_EventInfo)  ; Get the text from the row's first field.
		If %A_EventInfo%active=1
		{
			LV_Modify(A_EventInfo,"-Check")
			%A_EventInfo%active=0
			GoSub, StopScript
			}
		Else
		{
			%A_EventInfo%active=1
			LV_Modify(A_EventInfo, "Check")  ; Uncheck all the checkboxes.
			GoSub, StartScript
		}
} 
else if A_GuiEvent = RightClick
{
		LV_GetText(RowText, A_EventInfo)  ; Get the text from the row's first field.
		LastRightClicked := A_EventInfo
		Menu,Options,Show
} 
else if A_GuiEvent = I
{
	If InStr(ErrorLevel, "C", true) OR InStr(ErrorLevel, "c", true)
	{
		LV_GetText(RowText, A_EventInfo)  ; Get the text from the row's first field.
		status := %A_EventInfo%active
		If status=1
		{
			%A_EventInfo%active=0
			GoSub, StopScript
		}
		Else
		{
			%A_EventInfo%active=1
			GoSub, StartScript
		}
	}
} 
return

EditFile:
	myindex := LastRightClicked
	LongFile := GetValue(LongFileList,myindex)
	run, %editor% "%LongFile%"
return

ShowFolder:
	myindex := LastRightClicked
	Path := GetValue(PathList,myindex)
	run, "%Path%"
return

CompileAndPublish:
	GoSub, CompileFiles
	GoSub, PublishFiles
return

CompileFiles:
	myindex := LastRightClicked
	LongFile := GetValue(LongFileList,myindex)
	ShortFile := GetValue(FileList,myindex)
	Path := GetValue(PathList,myindex)

	; default publish folder
	CompileFolder = %Path%
	
	; find compiled version as scriptname.exe
	; use that as path
	
	CompiledFile := SubStr(ShortFile,1,-3) "exe"
	Loop %CompileFolder%\%CompiledFile%,0,1
	{
		CompileFolder := A_LoopFileDir
		break
	}
	runWait, %compiler% "%LongFile%" /out "%CompileFolder%\%CompiledFile%"
	GoSub, ShowFolder
return

PublishFiles:
	myindex := LastRightClicked
	Path := GetValue(PathList,myindex)
	
	; default publish folder
	PublishFolder = %Path%\publish
	; look for publish.bat if this exist then use their folder as the publish folder
	Loop publish.bat,0,1
	{
   PublishFolder := A_LoopFileDir
	 break
	}
	PublishBat = publish.bat

	IfExist, %PublishBat%
		runWait, %PublishBat%,%PublishFolder%
	Else
	{
		MsgBox,4,No batch file found, No publishing script found.  Add commands to a publishing batch file that are processed when publishing a project. For example you can create a zip file and uploading it via ftp.`n`nCreate and edit %PublishBat%?
		IfMsgBox Yes
			Run, %editor% "%PublishBat%"
	}
return



StartScript:
	myindex := A_EventInfo
	LongFile := GetValue(LongFileList,myindex)
	File := GetValue(FileList,myindex)
	GuiControlGet, Status,,Checkbox%myindex%
	run, %LongFile%
return

StopScript:
	myindex := A_EventInfo
	LongFile := GetValue(LongFileList,myindex)
	File := GetValue(FileList,myindex)
	GuiControlGet, Status,,Checkbox%myindex%
	WinClose %File% - AutoHotkey
return


ButtonHide:
	GoSub, WRITEINI
	WinHide
return

#IfWinActive, ahk_group AppId
^o::
ButtonChangeFolder:
	Gui +OwnDialogs  ; Force the user to dismiss the FileSelectFile dialog before returning to the main window.
	FileSelectFolder, NewScanFolder, *%A_WorkingDir%, 3, Select an AHK scripts folder to manage
	If NOT ErrorLevel
		ScanFolder := NewScanFolder
	If ScanFolder=
		{
			Msgbox, No folder selected, so defaulting to Axem folder
			ScanFolder := A_WorkingDir
		}
	GoSub, WRITEINI
	Gosub, ButtonRescan
return

#IfWinActive, ahk_group AppId
F5::
ButtonRescan:
LongFileList =
FileList = 

GoSub, ShowWindow
GoSub, Wait
return

CheckForUpdates:
Run, dcuhelper.exe -ri "%AppTitle%" .. "Attention",%A_ScriptDir%\dcuhelper
return


READINI:
	; Read the stored settings
	IfNotExist, %IniFile% 
		GoSub, WRITEINI
	IniRead, ScanFolder, %IniFile%,General, ScanFolder
	IniRead, NewIgnoreSelf, %IniFile%,General, IgnoreSelf
	If NewIgnoreSelf=0
		IgnoreSelf=0
		
	;--- StartupScripts ---
	StartupScriptsCount = 0
	;loop through ini and read in scripts 
	Loop 
	{
		StartupScriptsCount += 1
		IniRead, StartupScripts%StartupScriptsCount%, %IniFile%, Startup, %A_Index%, -1
		If StartupScripts%StartupScriptsCount% = -1
			break
	}	
		
return

WRITEINI:
	; Store settings
	if ScanFolder=
		Gosub, ButtonChangeFolder
	IniWrite, %ScanFolder%, %IniFile%, General, ScanFolder
	
	;--- StartupScripts ---
	IniDelete, %IniFile%, Startup	;clear section to rewrite
	;--- create array with script text of all checked scripts ---
	StartupScriptsCount = 0
	Loop {
		RowNumber := LV_GetNext(RowNumber, "Checked")  ; Resume the search at the row after that found by the previous iteration.
		if not RowNumber  ; The above returned zero, so there are no more selected rows.
			break
		LV_GetText(Text, RowNumber)
		StartupScriptsCount += 1
		StartupScripts%StartupScriptsCount% = %Text%
	}
	;--- loop through scripts and write list to ini file ---
	Loop %StartupScriptsCount% {
		scriptText = % StartupScripts%A_Index%
		IniWrite, %scriptText%, %IniFile%, Startup, %A_Index%		
	}	

return


GetValue(var,index)
{
	Loop, parse, var, `n
		If A_Index = %index%
			return %A_LoopField%
}

GetIndex(var,str)
{
	Loop, parse, var, `n
	{
		If A_Loopfield= %str%
			return %a_index%
	}
	return 0
}

RunStartup:
	;--- StartupScripts ---
	;--- loops through the array and starts scripts if they are found ---
	Loop %StartupScriptsCount% {
		scriptText = % StartupScripts%A_Index%
		; --- search through list to find matches ---
		Loop % LV_GetCount() 
		{
			LV_GetText(RetrievedText, A_Index)
			If InStr(RetrievedText, scriptText) 
			{
				LV_Modify(A_Index, "Check")  ; Check each row whose first field contains the filter-text.
			}
		}
	}
return


Wait:
