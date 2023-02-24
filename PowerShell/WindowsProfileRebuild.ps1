$path = 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*'
Get-ItemProperty -Path $path | Select-Object -Property PSChildName, ProfileImagePath
$UserNM = "User"
$fdrPath = 'C:\Users\' + $UserNM
$bakName = 'C:\Users\' + $UserNM + '.bak'
$p = Get-ChildItem $path | ? { (Get-ItemProperty $_.psPath).ProfileImagePath -eq $fdrPath }
reg export $p.Name C:\temp\$UserNM.reg
write-output Exported $UserNM profilelist to c:\temp
reg delete $p.Name /f
write-output Deleted $UserNM profilelist
Rename-Item -Path $fdrPath -NewName $bakName
write-output renamed $fdrPath to $bakName