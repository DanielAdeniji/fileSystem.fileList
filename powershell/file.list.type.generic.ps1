<#
    Declare variables
#>
[string] $folder ="";
[string] $log = "";
[object] $fileList =$null;

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
   
   
    <#
        Display folder name
    #>
    $log = "Folder is {0}" -f $folder;
    
    Write-Host $log            
    
    <#
        Get list of files
    #>
    $fileList

}
