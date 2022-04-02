<#
    Declare variables
#>
[string] $folder ="";
[string] $log = "";

<#
    Changed $fileList
        from:- [object]
        to:-   [object[]]
#>
#[object] $fileList =$null;
[object[]] $fileList =$null;

<#
    Get home directory
#>
$folder=$HOME

<#
    Get list of files from our home directory
#>
$fileList = Get-ChildItem -Path $folder;


<#
    If file list is not null
#>
if ($fileList -ne $null )
{

    Write-Host "";
    
    Write-Host "";
    
    <#
        Display folder name
    #>
    $log = "Folder is {0}" -f $folder;
    
    Write-Host $log; 
  
    $fileList
    
  
}
