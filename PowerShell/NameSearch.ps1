$ErrorActionPreference = "Stop"
$Continue = "Quit"

Do {
	$LastName = Read-Host "Enter user's Last Name" 
	$FirstName = Read-Host "Enter users's First Name"
	$GroupMembershipList = (Get-ADUser -Filter "GivenName -like '$FirstName*' -and Surname -like '$LastName*'").SamAccountName
	Foreach ($Name in $GroupMembershipList) {
		$GroupMemberShip = Get-ADPrincipalGroupMembership -Identity "$Name" | Sort Name |ForEach-Object {$_.name -replace ".*:"} 
		write-Host "Username: $Name" -ForegroundColor Yellow			
	}
	$Continue = Read-Host "Search Again (Y/N)"
	If($Continue -eq "Y"){}
}until ($Continue -eq "N")