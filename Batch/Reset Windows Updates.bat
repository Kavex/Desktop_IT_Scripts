@echo off
echo Stopping Windows Update Services....
net stop wuauserv
net stop msiserver
echo Rename Folders....
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
ren C:\Windows\System32\catroot2 Catroot2.old
echo Starting Windows Update Services....
net start wuauserv
net start msiserver
echo Script has compeleted you can now close the window
PAUSE
