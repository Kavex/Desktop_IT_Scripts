ECHO OFF
CLS
ECHO This script needs to be ran as Admin
:MENU
ECHO.
ECHO ...............................................
ECHO PRESS 1, 2 OR 3 to select your task, or 4 to EXIT.
ECHO ...............................................
ECHO.
ECHO 1 - Delete Temporary Files
ECHO 2 - Delete IE Cache 
ECHO 3 - Open Regedit: Microsoft 
ECHO 4 - EXIT
ECHO.
SET /P M=Type 1, 2, 3, or 4 then press ENTER:
IF %M%==1 GOTO DELETEMP
IF %M%==2 GOTO CLEARIE
IF %M%==3 GOTO REGEDITMCS
IF %M%==4 GOTO EOF
:DELETEMP
IF EXIST c:\windows\temp\ del /f /s /q c:\windows\temp\

DEL /f /s /q %temp%\

IF EXIST "C:\Documents and Settings\" (
    for /D %%x in ("C:\Documents and Settings\*") do ( 
        rmdir /s /q "%%x\Local Settings\Temporary Internet Files" 
        mkdir "%%x\Local Settings\Temporary Internet Files" 
    )
)

IF EXIST "C:\Documents and Settings\" (
    for /D %%x in ("C:\Documents and Settings\*") do ( 
        rmdir /s /q "%%x\Local Settings\Temp" 
        mkdir "%%x\Local Settings\Temp" 
    )
)

IF EXIST "C:\Users\" (
    for /D %%x in ("C:\Users\*") do ( 
        rmdir /s /q "%%x\AppData\Local\Temp" 
        mkdir "%%x\AppData\Local\Temp" 
    )
)

IF EXIST "C:\Users\" (
    for /D %%x in ("C:\Users\*") do ( 
        rmdir /s /q "%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files" 
        mkdir "%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files" 
    )
)
GOTO MENU
:CLEARIE
ECHO Closing IE
taskkill /IM iexplore.exe /f
ECHO Scrubbing IE History and Cache
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
ECHO Deleting History Only
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1
ECHO Deleting Cookies Only
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
ECHO Deleting Temporary Internet Files Only
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
ECHO Deleting Form Data Only
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
ECHO Deleting Password History Only
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 32
ECHO Deleting Data stored by add-ons Only
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4096
ECHO Done Deleting IE Cache, History, Forms, Passwords, Add-on Data
GOTO MENU
:REGEDITMCS
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d Computer\HKEY_CURRENT_USER\Software\Microsoft /f
START regedit
GOTO MENU