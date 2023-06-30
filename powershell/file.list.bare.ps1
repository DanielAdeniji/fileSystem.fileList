param ( `
              [Parameter(Mandatory)] [string] $folder  `
            , [Parameter(Mandatory)] [string] $ext 
      )
       
Set-StrictMode -Version Latest;

[string] $folderActual = "";
[string] $folderActualLastCharacter = "";
[string] $folder_and_backslash = "";
[string] $extWildcard = "";
[int]    $len = -1;
[string] $os_file_separator_default = "`\";
[string] $os_file_separator = "";

<#
    Get OS Specific file separator
        Use [IO.Path]::DirectorySeparatorChar
#>
try 
{
    
    $os_file_separator = [IO.Path]::DirectorySeparatorChar;
    
}
catch [Exception] 
{
 
    $os_file_separator = $os_file_separator_default;
    
}

<#
    Convert relative path to absolute path
#>
$folderActual  = Resolve-Path -Path $folder;

<#
    Get Length of folder
#>
$len = $folderActual.Length;

<#
    Get Last Character
#>
$folderActualLastCharacter = $folderActual.Substring($len -1, 1);
 
<#
    Add backslash to folder if not the last character
#>
if ($folderActualLastCharacter -eq $os_file_separator )
{
    $folder_and_backslash = "$folderActual"
}
else
{
    $folder_and_backslash = "$folderActual$os_file_separator"
}

<#
    Get File Extension as wildcard
#>
$extWildcard = "*.$ext"

<#
    Get Files
    
        a) Path is $folder
        
        b) File Extension has $ext
        
       c) File Attributes is not folder
        
       d) Recurse subdirectory


   Result
   
      a) Strip base folder
        
#>

Write-Host "";

Get-ChildItem -Path $folder  $extWildcard -Attributes !Directory -Recurse | 

        % { ($_.FullName.Replace($folder_and_backslash, '') )}