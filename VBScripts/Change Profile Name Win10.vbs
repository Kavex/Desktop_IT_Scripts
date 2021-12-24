'Launches Registry Editor with the chosen branch open automatically

Set WshShell = CreateObject("WScript.Shell")
Dim MyPath
MyPath = "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Lastkey",MyPath,"REG_SZ"
WshShell.Run "regedit", 1,True
Set WshShell = Nothing
