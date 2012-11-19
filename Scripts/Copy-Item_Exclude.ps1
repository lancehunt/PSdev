# -<Copy-Item_Exclude.ps1>-

# USAGE: 
# Copy-Item_Exclude [-Source [<String>]] [-Destination [<String>]]
#                 [-ExcDir [<String[]>] [-ExcFile [<String[]>]]
#                [-Vb [<Switch>]] [-Wi [<Switch>]] 
				  
param (
 [string]$source = '.',
 [string]$destination = $(throw '-Destination can''t be null'),
 [string[]]$excDir,
 [string[]]$excFile,
 [switch]$vb,
 [switch]$wi
)
if ($vb) {$verbosePreference = 2}
$source = $(if (!(test-path $source)) {
  throw "Verify ${source}'s <<<< path."} else {
  (rvpa $source).path})
if (!(test-path $destination -is)) {
 throw "$destination <<<< is not a valid path"
} elseIf (!(test-path $destination)) {
 $back, $fore = 
  $host.ui.raWUI.backgroundColor, $host.ui.raWUI.foregroundColor
 write-host "$destination <<<< does not exist, create it? [Y/N]"`
  -b $fore -f $back
 $action = $host.ui.rawUI.readKey('NoEcho, IncludeKeyDown')
 switch -r ($action.virtualKeyCode) {
  '13|89' {
   $destination =
    (ni $destination -i d* -vb:$vb -wi:$wi).fullName
   break
  }
  default {
   write-host "No destination directory. Exiting..."
   sleep -m 250
   exit
  }
 } 
}
# escaped version of <source>
$escSrc=[regex]::escape($source)
# get excluded subDir names and create an escaped RegEx from them
if ($excDir) {
 # remove RegEx special characters
 $excDir = $excDir -replace '\*|\?'
 $escExcDir = &{
  $ofs = '|'
  "$($excDir | % {[regex]::escape("\$_")})"
 }
 # get filtered subDirs and items
 $items = ls $source -ex:$excFile -r -fo |
  ? {$_.fullName -notMatch $escExcDir} | sort FullName
} else {
 # no dir exclusions, get all items
 $items = ls $source -ex:$excFile -r -fo | sort FullName
}
# get container items and create new subDirs
# in <destination> if necessary
$items | ? {$_.psIsContainer} | % {
 $destPath = $_.fullname -replace $escSrc, $destination
 if (!(test-path $destPath)) {
  [void](ni $destPath -i d* -ea 0 -vb:$vb -wi:$wi)
 }
}
# get file items and create a copy in their
# corresponding <destination>'s subDir
$items | ? {!$_.psIsContainer} |
 cpi -des {$_.fullname -replace $escSrc, $destination}`
  -fo -vb:$vb -wi:$wi
# -<Copy-Item_Exclude.ps1>-
# Source: http://social.technet.microsoft.com/Forums/en-US/winserverpowershell/thread/c5f29e46-520c-443b-8494-bc27d5c61205/