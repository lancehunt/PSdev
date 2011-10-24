function Get-SID([string] $userName) {
  $u = New-Object System.Security.Principal.NTAccount($userName)
  $sid = $u.Translate([System.Security.Principal.SecurityIdentifier])
  $sid.Value
}

function Clear-AllEventLogs {
  Get-EventLog -list | % {
    Write-Host "Clearing $($_.Log)"
    Clear-EventLog -log $_.Log 
  }
}

function Get-Batchfile ($file) {
  $cmd = "`"$file`" & set"
  cmd /c $cmd | % {
    $p, $v = $_.split('=')
    Set-Item -path env:$p -value $v
  }
}

function Add-Path([string[]] $items) {
  $paths = $env:path -split ";"
  $items = $items | ? { $paths -notcontains $_ }
  $paths = $items + $paths
  $env:path = $paths -join ";"
}

function Remove-Path([string[]] $items) {
  $paths = $env:path -split ";"
  $paths = $paths | ? { $items -notcontains $_ }
  $env:path = $paths -join ";"
}

function Enable-VisualStudio($version = "10.0") {
    if ([intptr]::size -eq 8) {
        $key = "HKLM:SOFTWARE\Wow6432Node\Microsoft\VisualStudio\" + $version
    }
    else {
        $key = "HKLM:SOFTWARE\Microsoft\VisualStudio\" + $version
    }

    if (Test-Path $key) {
      $VsKey = Get-ItemProperty $key
      if ($VsKey -and $VsKey.InstallDir -and (Test-Path $VsKey.InstallDir)) {
        $VsInstallPath = [System.IO.Path]::GetDirectoryName($VsKey.InstallDir)
        $VsToolsDir = [System.IO.Path]::GetDirectoryName($VsInstallPath)
        $VsToolsDir = [System.IO.Path]::Combine($VsToolsDir, "Tools")
        $BatchFile = [System.IO.Path]::Combine($VsToolsDir, "vsvars32.bat")
        
        Get-Batchfile $BatchFile
        
        [System.Console]::Title = "Visual Studio " + $version + " Windows Powershell"
        
        #$iconPath = Join-Path $profile "vspowershell.ico"
        #Set-ConsoleIcon $iconPath
      }
      else {
          Write-Host "Visual Studio $version is not installed."
      }
    }
    else {
      Write-Host "Visual Studio $version is not installed."
    }
}

Set-Alias vs Enable-VisualStudio

function Test-TCPPort
{
	param(
    [ValidateNotNullOrEmpty()]
    [string] $EndPoint = $(throw "Please specify an EndPoint (Host or IP Address)"),
    [string] $Port = $(throw "Please specify a Port") 
	)
	
	$TimeOut = 1000
	$IP = [System.Net.Dns]::GetHostAddresses($EndPoint)
	$Address = [System.Net.IPAddress]::Parse($IP)
	$Socket = New-Object System.Net.Sockets.TCPClient
	$Connect = $Socket.BeginConnect($Address,$Port,$null,$null)
	if ( $Connect.IsCompleted )
	{
		$Wait = $Connect.AsyncWaitHandle.WaitOne($TimeOut,$false)			
		if(!$Wait) 
		{
			$Socket.Close() 
			return $false 
		} 
		else
		{
			$Socket.EndConnect($Connect)
			$Socket.Close()
			return $true
		}
	}
	else
	{
		return $false
	}
}

<# 
.SYNOPSIS 
   Creates a Hash of a file and prints the hash   
.DESCRIPTION 
    Uses System.Security.Cryptography.HashAlgorithm and members to create the hash 
    Also uses System.Text.AsciiEncoding to convert string to byte array. 
    Created as a Module. 
.NOTES 
    File Name  : Get-Hash.PSM1 
    Author     : Thomas Lee - tfl@psp.co.uk 
    Requires   : PowerShell V2 CTP3 
    Thanks to the #PowerShell Twitter Posse for help figuring out -verbose. 
    http://www.pshscripts.blogspot.com 
    Based on  
    http://tinyurl.com/aycszb written by Bart De Smet 
.PARAMETER Algorithm 
    The name of one of the hash Algorithms defined at 
    http://msdn.microsoft.com/en-us/library/system.security.cryptography.hashalgorithm.aspx 
.PARAMETER File 
    The name of a file to provide a hash for. 
.EXAMPLE 
    PS C:\foo> ls *.txt | where {!$_.psiscontainer}| Get-Hash sha1 -verbose:$true 
    OK - I'll be chatty 
 
    Processing C:\foo\asciifile.txt 
    sha1 hash of file C:\foo\asciifile.txt is "3529f51d2dd9c3c45e539eee5b42b07a8b74f9f5" 
 
    Processing C:\foo\log.txt 
    sha1 hash of file C:\foo\log.txt is "89dd3b94d3cb7f645498925e77346aa9218d7ffe" 
 
    Processing C:\foo\sites.txt 
    sha1 hash of file C:\foo\sites.txt is "2e434f1c2c16fc1060cd9f2e0226e142ea450ce4" 
 
    Processing C:\foo\test.txt 
    File C:\foo\test.txt can not be hashed 
 
    Processing C:\foo\test.txt.txt 
    File C:\foo\test.txt.txt can not be hashed  
 
    Processing C:\foo\test2.txt 
    File C:\foo\test2.txt can not be hashed 
 
    Processing C:\foo\unicodefile.txt 
    sha1 hash of file C:\foo\unicodefile.txt is "3529f51d2dd9c3c45e539eee5b42b07a8b74f9f5" 
.EXAMPLE 
    PS C:\foo> ls *.txt | where {!$_.psiscontainer}| Get-Hash sha1 
    3529f51d2dd9c3c45e539eee5b42b07a8b74f9f5 
    89dd3b94d3cb7f645498925e77346aa9218d7ffe 
    2e434f1c2c16fc1060cd9f2e0226e142ea450ce4 
    3529f51d2dd9c3c45e539eee5b42b07a8b74f9f5 
.EXAMPLE 
    PS C:\foo> Get-Hash  md5 asciifile.txt -verbose:$true 
    OK - I'll be chatty 
 
    Processing asciifile.txt 
    md5 hash of file asciifile.txt is "b5fe789f9d497f8022d47f620de25499" 
.EXAMPLE 
    PS C:\foo> Get-Hash  md5 asciifile.txt 
    b5fe789f9d497f8022d47f620de25499 
#> 
function Get-Hash { 
  [CmdletBinding()] 
  param ( 
    [Parameter(Position=0, mandatory=$true)] 
    [string] $Algorithm, 
    [Parameter(Position=1, mandatory=$true, valuefrompipeline=$true)] 
    [string] $File 
  ) 
 
  begin { 
    if ($VerbosePreference.Value__ -eq 0) {$verbose=$false} else {$verbose=$true} 
    if ($verbose) {"OK - I'll be chatty";""} 
  } 
  
  process { 
    if ($verbose) { "Processing $file" } 
    $Algo=[System.Security.Cryptography.HashAlgorithm]::Create($algorithm) 
    if ($Algo) {
      $Fc = Get-Content $File 
      if ($fc.count -gt 0) { 
        $Encoding = New-Object System.Text.ASCIIEncoding 
        $Bytes = $Encoding.GetBytes($fc)     
        # Now compute hash 
        $Hash = $Algo.ComputeHash($bytes)    
        $Hashstring ="" 
        foreach ($byte in $hash) { $hashstring += $byte.tostring("x2") } 
        # pass hash string on 
        if ($verbose) { 
          "{0} hash of file {1} is `"{2}`"" -f $algorithm, $file, $hashstring 
          "" 
        } 
        else { 
         $Hashstring 
        } 
      } 
      else { 
        if ($verbose) { "File {0} can not be hashed" -f $file ; "" }  
      }
    } 
    else { 
      "Algorithm {0} not found" -f $algorithm 
    } 
  }
}

<#
.SYNOPSIS

Outputs a file or pipelined input as a hexadecimal display. To determine the
offset of a character in the input, add the number at the far-left of the row
with the the number at the top of the column for that character.

.EXAMPLE

"Hello World" | Format-Hex

            0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F

00000000   48 00 65 00 6C 00 6C 00 6F 00 20 00 57 00 6F 00  H.e.l.l.o. .W.o.
00000010   72 00 6C 00 64 00                                r.l.d.

.EXAMPLE

Format-Hex c:\temp\example.bmp
#>
function Format-Hex {
  [CmdletBinding(DefaultParameterSetName = "ByPath")]
  param(
    ## The file to read the content from
    [Parameter(ParameterSetName = "ByPath", Position = 0)]
    [string] $Path,

    ## The input (bytes or strings) to format as hexadecimal
    [Parameter(ParameterSetName = "ByInput", Position = 0, ValueFromPipeline = $true)]
    [Object] $InputObject
  )

  begin {
    Set-StrictMode -Version Latest

    ## Create the array to hold the content. If the user specified the
    ## -Path parameter, read the bytes from the path.
    [byte[]] $inputBytes = $null
    if($Path) { $inputBytes = [IO.File]::ReadAllBytes((Resolve-Path $Path)) }

    ## Store our header, and formatting information
    $counter = 0
    $header = "            0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F"
    $nextLine = "{0}   " -f  [Convert]::ToString(
      $counter, 16).ToUpper().PadLeft(8, '0')
    $asciiEnd = ""

    ## Output the header
    "`r`n$header`r`n"
  }

  process {
    ## If they specified the -InputObject parameter, retrieve the bytes
    ## from that input
    if(Test-Path variable:\InputObject) {
      ## If it's an actual byte, add it to the inputBytes array.
      if($InputObject -is [Byte]) {
        $inputBytes = $InputObject
      }
      else {
        ## Otherwise, convert it to a string and extract the bytes
        ## from that.
        $inputString = [string] $InputObject
        $inputBytes = [Text.Encoding]::Unicode.GetBytes($inputString)
      }
    }

    ## Now go through the input bytes
    foreach($byte in $inputBytes) {
      ## Display each byte, in 2-digit hexidecimal, and add that to the
      ## left-hand side.
      $nextLine += "{0:X2} " -f $byte

      ## If the character is printable, add its ascii representation to
      ## the right-hand side.  Otherwise, add a dot to the right hand side.
      if(($byte -ge 0x20) -and ($byte -le 0xFE)) {
        $asciiEnd += [char] $byte
      }
      else {
        $asciiEnd += "."
      }

      $counter++;

      ## If we've hit the end of a line, combine the right half with the
      ## left half, and start a new line.
      if(($counter % 16) -eq 0) {
        "$nextLine $asciiEnd"
        $nextLine = "{0}   " -f [Convert]::ToString(
          $counter, 16).ToUpper().PadLeft(8, '0')
        $asciiEnd = "";
      }
    }
  }

  end {
    ## At the end of the file, we might not have had the chance to output
    ## the end of the line yet.  Only do this if we didn't exit on the 16-byte
    ## boundary, though.
    if(($counter % 16) -ne 0) {
        while(($counter % 16) -ne 0) {
            $nextLine += "   "
            $asciiEnd += " "
            $counter++;
        }
        "$nextLine $asciiEnd"
    }
    ""
  }
}
Export-ModuleMember -Function * -Alias *