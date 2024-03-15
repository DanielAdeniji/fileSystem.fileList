Set-StrictMode -Version Latest;

$Path = "\\co.marin.ca.us\fs1\SqlBackup"

#$Path = "\\co.marin.ca.us\fs1\SqlBackup\ProLaw2"

#$Path = "\\co.marin.ca.us\fs1\SqlBackup\ProLaw3"

#$age = 30

$fileExtension = "*.bak";

$age = 15

$ageMinus = $age * -1;

$datetimeTarget = (Get-Date).AddDays($ageMinus)

$log = "Folder {0} File Extension {1} Age in Days {2} Date Time Target {3}" -f $Path, $fileExtension, $age, $dateTimeTarget

Write-Host $log;


<#

	Get-ChildItem -File $Path -Force -Recurse `
		| Where-Object {$_.CreationTime -lt $datetimeTarget} `
		| Select @{Name="Owner"; Expression={(Get-ACL $_.Fullname).Owner}}, CreationTime, directory, name
	
#>



Get-ChildItem -File $Path -Force -Recurse -Include $fileExtension `
	| Where-Object {$_.CreationTime -lt $datetimeTarget} `
	| Select CreationTime, directory, name
	
