<#
    Declare variables
#>
[string] $folder ="";
[string] $log = "";

[object] $fileList =$null;

[object] $fileListType = "";

[type]   $fileListType = $null;

[string] $fileListTypeName = "";

[string] $fileListTypeBaseType ="";
 
[boolean] $displayMetadataOnly = $false; 

$displayMetadataOnly = $true;

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
    
    if ($displayMetadataOnly -eq $false)
    {
        
        Write-Host $log; 
        
    }
 
    <#
        Get type of fileList
    #>
    $fileListType = $fileList.GetType();
    
    $fileListType;
    
    $fileListTypeName = $fileListType.Name;
           
    $fileListTypeBaseType = $fileListType.BaseType;
    
   
    <#
        Display fileList type
    #>
    $log = "The name of the type of fileList is {0}" -f $fileListTypeName;
    
    Write-Host $log;    


    <#
        Display fileList base type
    #>
    $log = "The base type of fileList is {0}" -f $fileListTypeBaseType;
    
    Write-Host $log;
    
    $log = "The base type of fileList is {0}" -f $fileListType.BaseType;
    
    Write-Host $log;    
    
    <#
        Get list of files
    #>
    if ($displayMetadataOnly -eq $false)
    {

        $fileList
    
    }

}
