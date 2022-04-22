# Allow Remote Script Execution for N-central powershell scripts https:/go.microsoft.com/fwlink/?LinkID=135170
Set-ExecutionPolicy -ExecutionPolicy bypass -Scope CurrentUser -force
# Set NumLock on by Default for All Users
Set-ItemProperty -Path 'Registry::HKU\.DEFAULT\Control Panel\Keyboard' -Name "InitialKeyboardIndicators" -Value "2"
