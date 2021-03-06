$global:profile = $MyInvocation.MyCommand.Definition
$profileDir = Split-Path $profile -Parent 
Push-Location $profileDir

Import-Module "$profileDir\Modules\Common"
Import-Module "$profileDir\Modules\PoShTfs\PoSh-Tfs"
Import-Module "$profileDir\Modules\PoshGit\Posh-Git"

Add-Path @(
  "$profileDir\Tools\msysgit\bin"
  "$profileDir\Tools\msysgit\cmd"
  "$profileDir\Tools\git-tfs  
)

$env:PLINK_PROTOCOL = "ssh"

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

function get-gitk {  exec { "gitk --all &" | bash } }

# Set up a simple prompt, adding the git prompt parts inside git repos
function prompt {
    # Git Prompt
    $global:GitStatus = Get-GitStatus
    Write-GitStatus $GitStatus

    $q = Split-Path $pwd -Qualifier
    $p = Split-Path $pwd -NoQualifier

    Write-Host($q) -nonewline -foregroundcolor green
    Write-Host($p) -nonewline -foregroundcolor white
    Write-Host("►") -nonewline -foregroundcolor red
      
    return " "
}

if(-not (Test-Path Function:\DefaultTabExpansion)) {
    Rename-Item Function:\TabExpansion DefaultTabExpansion
}

# Set up tab expansion and include git expansion
function TabExpansion($line, $lastWord) {
    $lastBlock = [regex]::Split($line, '[|;]')[-1]
    
    switch -regex ($lastBlock) {
        # Execute git tab completion for all git-related commands
        'git (.*)' { GitTabExpansion $lastBlock }
        # Fall back on existing tab expansion
        default { DefaultTabExpansion $line $lastWord }
    }
}

Enable-GitColors
Set-Alias gitk get-gitk
Pop-Location
Go-Home
