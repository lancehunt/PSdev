Push-Location $psScriptRoot
. ./Tfs-Utils.ps1
Pop-Location

Export-ModuleMember -Function @(
        'Get-Tfs', 
        'Get-TfsServer', 
        'Set-TfsServer', 
		'Get-TfsProject',
		'Set-TfsProject',
        'Get-TfsWorkItem',
        'Update-TfsWorkItem',
		'Update-TfsWorkItemTime')

