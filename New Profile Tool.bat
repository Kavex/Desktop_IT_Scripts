ECHO OFF
CLS
ECHO This script needs to be ran as Admin
:MENU
ECHO.
ECHO ...............................................
ECHO PRESS 1, 2 OR 3 to select your task, or 4 to EXIT.
ECHO ...............................................
ECHO.
ECHO 1 - List Windows Profile SID
ECHO 2 - Open Regedit
ECHO 3 - USERS Folder 
ECHO 4 - Exit
ECHO.
SET /P M=Type 1, 2, 3, or 4 then press ENTER:
IF %M%==1 GOTO WINSID
IF %M%==2 GOTO REGEDITUSER
IF %M%==3 GOTO USERFOLDER
IF %M%==4 GOTO EOF
:WINSID
set /p USER=USER ID:
wmic useraccount where name="%USER%" get sid
wmic useraccount where name="%USER%" get sid> "%userprofile%\Desktop\%USER%_SID.txt"
GOTO MENU
:REGEDITUSER
@echo off
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows/ NT\CurrentVersion\ProfileList /f
START regedit
GOTO MENU
:USERFOLDER
%SystemRoot%\explorer.exe "C:\Users"
GOTO MENU