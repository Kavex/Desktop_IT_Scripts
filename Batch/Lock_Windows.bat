Echo Please make sure you are connected to VPN first

:choice
set /P c=Log out?[Y/N]?:
if /I "%c%" EQU "Y" goto :YesChange
if /I "%c%" EQU "N" goto :NoChange
goto :choice

:YesChange
rundll32.exe user32.dll,LockWorkStation

:NoChange
echo You can close this window