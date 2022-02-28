$dir = 'C:\Temp\WUA\'
mkdir $dir
$webClient = New-Object System.Net.WebClient
$url = 'https://go.microsoft.com/fwlink/?LinkID=799445'
$file = "$($dir)\Win10Upgrade.exe"
$webClient.DownloadFile($url,$file)
Start-Process -FilePath $file -ArgumentList '/quietinstall /skipeula /auto upgrade /copylogs $dir'
[datetime]$RestartTime = '9PM'
[datetime]$CurrentTime = Get-Date
[int]$WaitSeconds = ( $RestartTime - $CurrentTime ).TotalSeconds
shutdown -r -t $WaitSeconds
