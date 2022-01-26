$pagefile = Get-WmiObject Win32_ComputerSystem -EnableAllPrivileges
$pagefile.AutomaticManagedPagefile = $false
$pagefile.put() | Out-Null
$pagefileset = Get-WmiObject Win32_pagefilesetting
$pagefileset.InitialSize = 6144
$pagefileset.MaximumSize = 16384
$pagefileset.Put() | Out-Null
$result = Gwmi win32_Pagefilesetting | Select Name, InitialSize, MaximumSize
$result | Out-File 'c:\temp\VirtualMemorySettings.txt'
shutdown -r -t $([int]([datetime]"12PM"-(Get-Date)).TotalSeconds)