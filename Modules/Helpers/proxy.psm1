$proxyRegistryPath = ”HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings”

function Enable-Proxy {
	set-itemproperty -path $proxyRegistryPath proxyenable -value 1
}

function Disable-Proxy {
	set-itemproperty -path $proxyRegistryPath proxyenable -value 0
}

Export-ModuleMember -Function * -Alias *