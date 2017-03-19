@echo off
tasklist /fi "imagename eq %1" | find /i "%1" && goto kill || goto start
:kill
taskkill /im %1 /f
goto end

:start
d:
cd "D:\Program Files\will yz\Y'z Dock"
start %1
goto end

:end
taskkill /im wmiprvse.exe /f
cls
