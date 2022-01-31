$pagefile = Get-WmiObject Win32_ComputerSystem -EnableAllPrivileges
$pagefile.AutomaticManagedPagefile = $false
$pagefile.put() | Out-Null
$pagefileset = Get-WmiObject Win32_pagefilesetting
$pagefileset.InitialSize = 12288
$pagefileset.MaximumSize = 32768
$pagefileset.Put() | Out-Null
$result = Gwmi win32_Pagefilesetting | Select Name, InitialSize, MaximumSize
$result | Out-File 'c:\temp\VirtualMemorySettings.txt'
[datetime]$RestartTime = '9PM'
[datetime]$CurrentTime = Get-Date
[int]$WaitSeconds = ( $RestartTime - $CurrentTime ).TotalSeconds
shutdown -r -t $WaitSeconds