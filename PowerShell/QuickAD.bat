@echo off
echo ******** Locked Accounts ********
echo | powershell "Search-ADAccount -lockedout | Select-Object Name, SamAccountName"
echo *********************************
set /p id=Enter Username to Unlock:
echo | powershell "Get-ADUser -Identity %id% -Properties * | Select-Object LockedOut, AccountLockoutTime, BadLogonCount"
net user %id% /domain /active:yes
echo %id% Account Status: 
echo | powershell "Get-ADUser %id% -Properties * | Select-Object LockedOut"

:choice
set /P c=Change User's Password?[Y/N]?:
if /I "%c%" EQU "Y" goto :YesChange
if /I "%c%" EQU "N" goto :NoChange
goto :choice

:YesChange

set /P pass=Enter New Password:
echo | powershell "Set-ADAccountPassword -Identity %id% -Reset -NewPassword (ConvertTo-SecureString -AsPlainText %pass% -Force)"
echo | powershell "Set-ADUser -Identity %id% -ChangePasswordAtLogon $true"
echo Password reset command sent to AD!

:NoChange

echo Script Done!