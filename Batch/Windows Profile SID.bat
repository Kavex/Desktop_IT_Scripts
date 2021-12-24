@echo off
set /p USER=USER ID:
wmic useraccount where name="%USER%" get sid
wmic useraccount where name="%USER%" get sid> "%userprofile%\Desktop\%USER%_SID.txt"
pause