Set WshShell = WScript.CreateObject("WScript.Shell")


' IE Default browser for WIN10
WshShell.Run "%windir%\system32\control.exe /name Microsoft.DefaultPrograms /"


