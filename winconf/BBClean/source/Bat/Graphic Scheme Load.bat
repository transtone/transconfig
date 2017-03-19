@echo off
taskkill /im YzDock.exe /f
taskkill /im gameclient.exe /f
taskkill /im wmiprvse.exe /f
d:
cd  "D:\Program Files\will yz\Y'z Dock"
start  YzDock.exe
exit
