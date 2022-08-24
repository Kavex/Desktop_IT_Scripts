$supportassist = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall| Get-ItemProperty | Where-Object {$_.DisplayName -ceq "Dell SupportAssist" } | Select-Object -ExpandProperty UninstallString
if ($supportassist)
{
    $arguments = $supportassist.substring(12) + " /qn REBOOT=REALLYSUPRESS"
    echo "Uninstalling Dell SupportAsist"
    echo "msiexec.exe " $arguments
    (Start-Process "msiexec.exe" -ArgumentList $arguments -NoNewWindow -Wait -PassThru).ExitCode
}

$supportassist2 = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall| Get-ItemProperty | Where-Object {$_.DisplayName -ceq "Dell SupportAssist OS Recovery Plugin for Dell Update" } | Select-Object -ExpandProperty UninstallString
if ($supportassist2)
{
    $arguments2 = $supportassist2.substring(12) + " /qn"
    echo "Uninstalling Dell SupportAssist OS Recovery Plugin for Dell Update"
    echo "msiexec.exe " $arguments2
    (Start-Process "msiexec.exe" -ArgumentList $arguments2 -NoNewWindow -Wait -PassThru).ExitCode
}