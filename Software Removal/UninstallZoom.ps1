#Function to generate a timestamp that is added to the log file
function Get-TimeStamp {
    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)   
    }
    
    #Function to generate a log file
    if ((Test-Path -Path "$ENV:SystemDrive\Temp\Logs" -PathType Container) -ne $true ) {mkdir "$ENV:SystemDrive\Temp\Logs" | Out-Null}
    $LogFile = "$ENV:SystemDrive\Temp\Logs\ZoomRemovealLogs.log"
    Function LogWrite
    {
      Param ([string]$logstring)
      Add-content $Logfile -value "$(Get-Timestamp) $logstring"
    }
LogWrite "** STARTING Uninstall Zoom Script **"
[System.Collections.ArrayList]$UserArray = (Get-ChildItem C:\Users\).Name
$UserArray.Remove('Public')
New-PSDrive HKU Registry HKEY_USERS

Foreach($obj in $UserArray){
    $Parent  = "$env:SystemDrive\users\$obj\Appdata\Roaming"
    $Path = Test-Path -Path (Join-Path $Parent 'zoom\bin\zoom.exe')
    if($Path){
		"Zoom found for user $obj, uninstalling..."
		LogWrite "Zoom found for user $obj, uninstalling..."
        $User = New-Object System.Security.Principal.NTAccount($obj)
        $sid = $User.Translate([System.Security.Principal.SecurityIdentifier]).value
        if(test-path "HKU:\$sid\Software\Microsoft\Windows\CurrentVersion\Uninstall\ZoomUMX"){
			"Removing registry key ZoomUMX for $sid in HKU"
            LogWrite "Removing registry key ZoomUMX for $sid on HKU"
            Remove-Item "HKU:\$sid\Software\Microsoft\Windows\CurrentVersion\Uninstall\ZoomUMX" -Force
        }
        "Removing folder on $Parent"
		LogWrite "Removing folder on $Parent"
        Remove-item -Recurse -Path (join-path $Parent 'zoom') -Force -Confirm:$false
        "Removing start menu shortcut"
		LogWrite "Removing start menu shortcut"
        Remove-item -recurse -Path (Join-Path $Parent '\Microsoft\Windows\Start Menu\Programs\zoom') -Force -Confirm:$false
    }
    else{
		"Zoom is not installed for user $obj"
		LogWrite "Zoom is not installed for user $obj"
    }
}
Remove-PSDrive HKU
 LogWrite "** ENDING Uninstall Zoom Script **"