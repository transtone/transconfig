@echo on
if "%1"=="DockApp" goto end
if "%1"=="DockAppPath" goto end
set dock=<nul
set dockpath=<nul
for /f "eol=[ tokens=1,2* delims=," %%i in (dock.inf) do if "%%i"=="DockApp" set dock=%%j && goto jump1 
:jump1
if "%dock%"=="" goto end
for /f "eol=[ tokens=1,2* delims=," %%i in (dock.inf) do if "%%i"=="DockAppPath" set dockpath=%%j && goto jump2
:jump2
if "%dockpath%"=="" goto end
if not "%1"=="" for /f "eol=[ tokens=1,2* delims=," %%i in (dock.inf) do if "%%i"=="%1" set gamepath=%%j && set gameapp=%%k
tasklist /fi "imagename eq %dock%" | find /i "%dock%" && goto killDock || goto startDock

:killDock
if not "%1"=="" tasklist /fi "imagename eq %gameapp%" | find /i "%gameapp%" || cd /d "%gamepath%" && start "" "%gameapp%"
taskkill /im %dock% /f
goto end

:startDock
if not "%1"=="" tasklist /fi "imagename eq %gameapp%" | find /i "%gameapp%" && taskkill /im %gameapp% /f 
cd /d "%dockpath%"
start "" "%dock%"
goto end

:end
taskkill /im wmiprvse.exe /f
exit