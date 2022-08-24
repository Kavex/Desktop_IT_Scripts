'Script Arguments	cscript.exe remove_Java.vbs
on error resume next

'Uninstall All Version of Java
'=============================

Const HKEY_LOCAL_MACHINE = &H80000002
strComputer = "."

Set WshShell = WScript.CreateObject("WScript.Shell")

Set objReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & _
 strComputer & "\root\default:StdRegProv")

'Get the OS architecture
'=======================
Err.Clear
checkOSArch = WshShell.RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\PROCESSOR_ARCHITECTURE")
returnValue = 0
'Wscript.Echo checkOSArch 

if Err Then
	Err.Clear
	'WScript.Echo "The OS Architecture is unable to find ,so it was assumed to be 32 bit"	
else
	if checkOSArch = "x86" Then
		'Wscript.Echo "The OS Architecture is 32 bit"
		
		strKeyPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
		returnValue = RemoveJava (strKeyPath)
	else
		'Wscript.Echo "The OS Architecture is 64 bit"
		
		strKeyPath64 = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
		returnValue =  RemoveJava (strKeyPath64)

		strKeyPath86 = "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
		returnValue =  RemoveJava (strKeyPath86)
		
		
	End IF
End If


Wscript.Quit returnValue

'===============================================================
'Script to Iterate the Uninstall Resistry Key and remove the Java
'===============================================================

Function RemoveJava(KeyPath)	
	
	On error resume next
  
	Set objReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & _
	 strComputer & "\root\default:StdRegProv")

	 set shell = CreateObject("WScript.Shell")

	objReg.EnumKey HKEY_LOCAL_MACHINE, KeyPath, arrSubKeys
  
	For Each Subkey in arrSubKeys
		str1 = "HKEY_LOCAL_MACHINE\"&KeyPath &"\"&Subkey &"\InstallSource"
		str2 = WshShell.RegRead(str1)
		'Wscript.Echo str2

		if InStr (str2,"jre") <> 0 then
			'Wscript.Echo str2 & " -- > "&  InStr (str2,"jre")
			str3 = "HKEY_LOCAL_MACHINE\"&KeyPath &"\"&Subkey &"\UninstallString"
			uninstallStr = WshShell.RegRead(str3)
			returnValue =WshShell.Run(uninstallStr & " /qn /norestart",0,TRUE)
			Wscript.Echo  uninstallStr & " /qn /norestart" & returnValue
			
		end if
	Next
  
End Function