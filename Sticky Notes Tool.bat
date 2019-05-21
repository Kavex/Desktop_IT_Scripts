ECHO OFF
CLS
ECHO This script needs to be ran as the user with the sticky notes
:MENU
ECHO.
ECHO ...............................................
ECHO PRESS 1-5 to select your task, or 6 to EXIT.
ECHO ...............................................
ECHO.
ECHO 1 - Export Win10 Sticky Notes to J Drive
ECHO 2 - Import Win10 Sticky Notes from J Drive
ECHO 3 - Export Win7 Sticky Notes to J Drive
ECHO 4 - Import Win7 Sticky Notes from J Drive
ECHO 5 - Import Win7 Sticky Notes to Win10 from J Drive
ECHO 6 - Exit
ECHO.
SET /P M=Type 1, 2, 3, or 4 then press ENTER:
IF %M%==1 GOTO WIN10TOJ
IF %M%==2 GOTO WIN10FROMJ
IF %M%==3 GOTO WIN7TOJ
IF %M%==4 GOTO WIN7FROMJ
IF %M%==5 GOTO WIN7TOWIN10
IF %M%==6 GOTO EOF
:WIN10TOJ
xcopy %LocalAppData%\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\plum.sqlite J:\
ECHO Done Exporting Sticky Notes
GOTO MENU
:WIN10FROMJ
xcopy J:\plum.sqlite %LocalAppData%\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState
ECHO Done Importing Sticky Notes
GOTO MENU
:WIN7TOJ
xcopy "%AppData%\Microsoft\Sticky Notes\StickyNotes.snt" J:\
ECHO Done Exporting Sticky Notes
GOTO MENU
:WIN7FROMJ
xcopy J:\StickyNotes.snt "%AppData%\Microsoft\Sticky Notes\"
ECHO Done Importing Sticky Notes
GOTO MENU
:WIN7TOWIN10
md "%LocalAppData%\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\Legacy"
xcopy J:\StickyNotes.snt %LocalAppData%\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\Legacy
ren "%LocalAppData%\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\Legacy\StickyNotes.snt" "Thresholdnotes.snt"
ECHO Done Importing Sticky Notes
GOTO MENU