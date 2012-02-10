Import-Module "$profileDir\Modules\Commands" -DisableNameChecking
Import-Module "$profileDir\Modules\Helpers\Home" -DisableNameChecking
Import-Module "$profileDir\Modules\Helpers\WebUtilities" -DisableNameChecking
Import-Module "$profileDir\Modules\PSake\Psake" -DisableNameChecking

Add-Path @(
  "$profileDir\Scripts" 
  "$profileDir\Tools" 
 )
 
 Export-ModuleMember -Function * -Alias *