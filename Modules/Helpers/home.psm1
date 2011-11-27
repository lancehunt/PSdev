# .SYNOPSIS 
# Get the current home folder
# .LINK
# Set-Home
# Go-Home
function Get-Home {  return [System.Environment]::GetEnvironmentVariable("Home-Folder", "User") }

# .SYNOPSIS 
# Go to the home folder 
# .LINK
# Get-Home
# Set-Home
function Go-Home { if($homeLocation) { Set-Location $homeLocation } }

# .SYNOPSIS 
# Set the current location as the home folder
# .LINK
# Get-Home
# Go-Home
function Set-Home { 
	$homeLocation = Get-Location
	[System.Environment]::SetEnvironmentVariable("Home-Folder", $homeLocation, "User")
}

$homeLocation = Get-Home

Export-ModuleMember -Function * -Alias *