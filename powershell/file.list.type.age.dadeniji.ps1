#Run the script only in PowerShell 3 or greater:
#Requires -Version 3


<#

    Support Parameters
        a) Folder
        b) Ext ( Extension )
        
#>
[CmdletBinding()]
Param (
         [parameter (
                      Mandatory=$true
                    , position=0
                    , HelpMessage="folder"
                   )
          ]
 

          [string] $folder     
 
        , [parameter (
                      Mandatory=$false
                    , position=1
                    , HelpMessage="ext"
                   )
          ]
 
          [string] $ext     
 
         , [parameter (
                      Mandatory=$false
                    , position=1
                    , HelpMessage="age in days"
                   )
          ]
 
          [int] $days    
 
      )
	  
Set-StrictMode -Version Latest;

#$Path = "\\co.marin.ca.us\fs1\SqlBackup"

#$Path = "\\co.marin.ca.us\fs1\SqlBackup\ProLaw2"

#$Path = "\\co.marin.ca.us\fs1\SqlBackup\ProLaw3"

#$age = 30

#$fileExtension = "*.bak";

#$age = 15

if ( ( $ext -eq $null ) -or ( $ext -eq "" ) )
{
	
	$ext = "*.bak";
	
}

if ( ( $days -eq $null ) -or ( $days -eq 0 ) ) 
{
	$days = 15;
}

$daysMinus = $days * -1;

$datetimeTarget = (Get-Date).AddDays($daysMinus)

$log = "Folder {0} File Extension {1} Age in Days {2} Date Time Target {3}" -f $folder, $ext, $days, $dateTimeTarget

Write-Host $log;


<#

	Get-ChildItem -File $Path -Force -Recurse `
		| Where-Object {$_.CreationTime -lt $datetimeTarget} `
		| Select @{Name="Owner"; Expression={(Get-ACL $_.Fullname).Owner}}, CreationTime, directory, name
	
#>



Get-ChildItem -File $folder -Force -Recurse -Include $ext `
	| Where-Object {$_.CreationTime -lt $datetimeTarget} `
	| Select CreationTime, directory, name
	
