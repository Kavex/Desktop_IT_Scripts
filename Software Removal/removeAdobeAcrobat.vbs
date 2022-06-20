' Script Arguments	cscript.exe removeAdobeAcrobat.vbs
on error resume next

'Uninstall All Version of Adobe
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
		returnValue = RemoveAdobe (strKeyPath)
	else
		'Wscript.Echo "The OS Architecture is 64 bit"
		
		strKeyPath64 = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
		returnValue =  RemoveAdobe (strKeyPath64)

		strKeyPath86 = "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
		returnValue =  RemoveAdobe (strKeyPath86)
		
		
	End IF
End If


Wscript.Quit returnValue

'===============================================================
'Script to Iterate the Uninstall Resistry Key and remove the Java
'===============================================================

Function RemoveAdobe(KeyPath)	
	
	On error resume next
  
	Set objReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & _
	 strComputer & "\root\default:StdRegProv")

	 set shell = CreateObject("WScript.Shell")

	objReg.EnumKey HKEY_LOCAL_MACHINE, KeyPath, arrSubKeys
  
	For Each Subkey in arrSubKeys
		str1 = "HKEY_LOCAL_MACHINE\"&KeyPath &"\"&Subkey &"\DisplayName"
		str2 = WshShell.RegRead(str1)
		'Wscript.Echo str2

		if InStr (str2,"Adobe Acrobat") <> 0 then
			'Wscript.Echo str2 & " -- > "&  InStr (str2,"jre")
			str3 = "HKEY_LOCAL_MACHINE\"&KeyPath &"\"&Subkey
			'Wscript.Echo Subkey
			'uninstallStr = WshShell.RegRead(str3)
			returnValue =WshShell.Run("Msiexec /X"&Subkey & " /qn",0,TRUE)
			'Wscript.Echo  uninstallStr & " /quiet " & returnValue
			
		end if
	Next
  
End Function