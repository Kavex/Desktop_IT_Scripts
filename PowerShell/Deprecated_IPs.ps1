# https://social.technet.microsoft.com/Forums/en-US/dfe37d44-82e0-441b-b7a0-2840ad4cd55e/windows-7810-wont-accept-same-dhcpoffered-ip-address-on-another-interface-even-if-previous?forum=win10itpronetworking
################################################

$DEPRECATED = (Get-NetIPAddress -AddressState Deprecated -ErrorAction SilentlyContinue | Where-Object AddressFamily -in "ipv4").IPAddress

foreach ($IP in $DEPRECATED ) {
Remove-NetIPAddress -IPAddress $DEPIPV4 -ErrorAction SilentlyContinue -confirm:$false
}

#################################################