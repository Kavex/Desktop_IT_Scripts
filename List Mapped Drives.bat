@echo off
set /p USER=Member ID:
net use > "%userprofile%\Desktop\%USER%_Mapped_Drives.txt"
pause