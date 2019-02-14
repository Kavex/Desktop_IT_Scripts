@echo off
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows/ NT\CurrentVersion\ProfileList /f
START regedit