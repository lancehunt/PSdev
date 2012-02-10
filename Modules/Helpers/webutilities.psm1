<#
.EXAMPLE 
Download-File http://nodejs.org/dist/latest/node-v0.6.7.msi ./node.msi
#>
function Download-File {
  [CmdletBinding()]
  param(
    ## The URL to the file to download
    [Parameter(Position = 0, mandatory=$true)]
    [string] $Source,
	
	## The local path to download the file to
    [Parameter(Position = 1, mandatory=$true)]
    [string] $Destination
  )

  begin {
	$wc = New-Object System.Net.WebClient
	$envproxy = [System.Environment]::GetEnvironmentVariable("HTTP_PROXY", "User")
	
	if($envproxy) {
		$proxy = new-object System.Net.WebProxy $envproxy
		#$proxy.UseDefaultCredentials = $true 
		$proxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials;
		$wc.proxy=$proxy 
		Write-Host 'Using Proxy'
	}
  }
  
  process {
	$wc.DownloadFile($source, $destination)  
  }
  
  end {
  }
  
 }

Export-ModuleMember -Function * -Alias *