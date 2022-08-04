[datetime]$RestartTime = '10PM'
[datetime]$CurrentTime = Get-Date
[int]$WaitSeconds = ( $RestartTime - $CurrentTime ).TotalSeconds
shutdown -r -t $WaitSeconds