Get-NetAdapter -physical | where InterfaceDescription -eq "Surface Ethernet Adapter" -outvariable adapterstring
if ( [bool]$adapterstring ) {
	Get-NetAdapter -InterfaceDescription "Surface Ethernet Adapter" | Select-Object -ExpandProperty Status -outvariable netstatus
	if ($netstatus -eq "Up") {
		if (Test-Connection -ComputerName "www.google.com" -Quiet) { 
			Write-Host "It is up"
			Write-Host "Nothing to do."
		}
		Restart-NetAdapter -InterfaceDescription "Surface Ethernet Adapter"
	}
} else { Write-Host "Adapter NOT Present" }
