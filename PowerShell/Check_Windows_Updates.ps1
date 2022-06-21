Set-ExecutionPolicy Bypass -Scope Process -Force
Start-Sleep -Seconds 30
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Start-Sleep -Seconds 30
Set-PSRepository -Name "psgallery" -InstallationPolicy Trusted
Start-Sleep -Seconds 30
Install-Module PSWindowsUpdate -force
Start-Sleep -Seconds 30
Get-WindowsUpdate
Start-Sleep -Seconds 300
Install-WindowsUpdate -AcceptAll -Install | Format-Table -Wrap | Out-File "C:\temp\$(get-date -f yyyy-MM-dd)-WindowsUpdate.log" -Append -force