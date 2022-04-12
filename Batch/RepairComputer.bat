if not exist "c:\temp\logs\" mkdir "c:\temp\logs"
sfc /scannow > c:\temp\logs\sfc.txt
DISM /Online /Cleanup-Image /CheckHealth > c:\temp\logs\healthchech.txt
DISM /Online /Cleanup-Image /ScanHealth > c:\temp\logs\healthscan.txt
DISM /Online /Cleanup-Image /RestoreHealth > c:\temp\logs\healthrestore.txt
del %temp%\*.*/s/q
del C:\Windows\prefetch\*.*/s/q
net stop wuauserv
cd %Windir%\SoftwareDistribution
del /f /s /q Download
net start wuauserv
cleanmgr /verylowdisk /d c
fsutil volume diskfree c: > c:\temp\logs\freespace.txt
echo done > c:\temp\logs\done.txt