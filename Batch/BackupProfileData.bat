@ECHO off

REM Path for the user's network file share
SET userprivatedrivepath=c:\temp\profilebackupdata\

REM Path for backup folders
SET userbookmarkspath=%userprivatedrivepath%Bookmarks
SET userpinnedpath=%userprivatedrivepath%TaskBar

REM bookmark locations on user's computer
SET bookmark_chrome=%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default
SET bookmark_edge=null
SET bookmark_ie=%USERPROFILE%\favorites
SET pinned_items=%USERPROFILE%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\

REM create hidden folder to backup bookmarks to
IF NOT EXIST "%userbookmarkspath%" (
	mkdir "%userbookmarkspath%"
	attrib +h "%userbookmarkspath%"
)

REM create hidden folder to backup pinned
IF NOT EXIST "%userpinnedpath%" (
	mkdir "%userpinnedpath%"
	attrib +h "%userpinnedpath%"
)

REM bookmark backup path for the computer the user logged on to
SET userbookmarkspathcomputer=%userbookmarkspath%

REM create folder to backup a computer's bookmarks to
IF NOT EXIST "%userbookmarkspathcomputer%" (
	mkdir "%userbookmarkspathcomputer%"
)

REM backup bookmarks
ROBOCOPY "%bookmark_chrome%" "%userbookmarkspathcomputer%\chrome" Bookmarks /COPY:DAT /DCOPY:T /R:1 /W:30 /NP
ROBOCOPY "%bookmark_ie%" "%userbookmarkspathcomputer%\ie" /E /MIR /COPY:DAT /DCOPY:T /R:1 /W:30 /NP

REM backup printer names
wmic printer list brief > "%userprivatedrivepath%\Printers.txt"

REM backup network drives 
net use > "%userprivatedrivepath%\Mapped_Drives.txt"

REM backup Pinned items
REM ROBOCOPY "%pinned_items%" "%userpinnedpath%" /E /MIR

explorer %userpinnedpath%

PAUSE