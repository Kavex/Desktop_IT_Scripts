del %temp%\*.*/s/q
del C:\Windows\prefetch\*.*/s/q
net stop wuauserv
cd %Windir%\SoftwareDistribution
del /f /s /q Download
net start wuauserv
cleanmgr /verylowdisk /d
DIR /AD/D C: | FIND /I " bytes free"
fsutil volume diskfree c: