function Get-TfsServer {  return [System.Environment]::GetEnvironmentVariable("TFS_Server", "User") }
function Set-TfsServer($servername) { 
	[System.Environment]::SetEnvironmentVariable("TFS_Server", $servername, "User")
}
function Get-TfsProject {  return [System.Environment]::GetEnvironmentVariable("TFS_Project", "User") }
function Set-TfsProject($project) { 
	[System.Environment]::SetEnvironmentVariable("TFS_Project", $servername, "User")
}


function Get-Tfs {
$serverName =  Get-TfsServer

# load the required dll
[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.Client")


$propertiesToAdd = (
        ('VCS', 'Microsoft.TeamFoundation.VersionControl.Client', 'Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer'),
        ('WIT', 'Microsoft.TeamFoundation.WorkItemTracking.Client', 'Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore'),
        ('CSS', 'Microsoft.TeamFoundation', 'Microsoft.TeamFoundation.Server.ICommonStructureService'),
        ('GSS', 'Microsoft.TeamFoundation', 'Microsoft.TeamFoundation.Server.IGroupSecurityService')
    )

    # fetch the TFS instance, but add some useful properties to make life easier
    # Make sure to "promote" it to a psobject now to make later modification easier

    [psobject] $tfs = [Microsoft.TeamFoundation.Client.TeamFoundationServerFactory]::GetServer($serverName)

    foreach ($entry in $propertiesToAdd) {
        $scriptBlock = '
            [System.Reflection.Assembly]::LoadWithPartialName("{0}") > $null
            $this.GetService([{1}])
        ' -f $entry[1],$entry[2]

        $tfs | add-member scriptproperty $entry[0] $ExecutionContext.InvokeCommand.NewScriptBlock($scriptBlock)
    }

    return $tfs
}

 

function Get-TfsWorkItem {

	$tfs = Get-TfsServer 
	$title = "*"
	$user= $tfs.AuthenticatedUserDisplayName
	$Project= Get-TfsProject 

$WIQL = @"
SELECT [System.Id], [System.WorkItemType], [System.State], [System.AssignedTo], [System.Title] 
FROM WorkItems 
where [System.TeamProject] = '$Project'  AND [System.AssignedTo] = '$user' 
ORDER BY [System.WorkItemType], [System.Id] 
"@

	$workItems = $tfs.wit.query($WIQL)

	return $workItems | where {$_.Title -like $title}
	return $tfs
}

 
function Update-TfsWorkItem($item,$field,$value) {

	if (!$item.IsOpen) {$item.open()}

	$item.Fields[$field].Value = $value
	$item.Save()

	return $item
}
 

function Update-TfsWorkItemTime($item,$hours) {

	begin {}

	process {

		  if ($_ -is [Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItem]) {

			$item = $_

			if (!$item.IsOpen) {$item.open()}
			if ($item.Fields["State"].Value = "Not Started") {$item.Fields["State"].Value = "In Progress"}

			$remainingWork = $item.Fields["Remaining Work"].Value
			$completedWork = $item.Fields["Completed Work"].Value
			$item.Fields["Completed Work"].Value = $completedwork + $hours
			$item.Fields["Remaining Work"].Value = $remainingWork - $hours
			$item.Save() | out-nulll
		}
	}

	end {}

}
