@echo off
taskkill /im blackbox.exe /f
taskkill /im YzDock.exe /f
taskkill /im wmiprvse.exe /f
start blackbox.exe
exit
