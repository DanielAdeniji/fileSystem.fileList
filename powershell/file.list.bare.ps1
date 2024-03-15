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
                      Mandatory=$false
                    , position=0
                    , HelpMessage="Folder"
                   )
          ]
 

          [string] $folder     
 
        , [parameter (
                      Mandatory=$false
                    , position=1
                    , HelpMessage="Extension"
                   )
          ]
 
          [string] $ext     
 
 
      )
      
Set-StrictMode -Version Latest;


[string] $os_file_separator_default = "`\";
[string] $os_file_separator = "";
[string] $stringEmpty = "";

[string] $FORMAT_OS_FOLDER_DOES_NOT_EXIST = "Folder ({0}) does not exist!" ;

[string] $FORMAT_EXTENSION_WILDCARD = "*.{0}";

Function folderList([string] $folder, [string] $ext )
{

    [string]   $folderActualLastCharacter = "";
    
    [string]  $folder_and_backslash = "";
    
    [string]  $extWildcard = "";
    
    [int]     $len = -1;
    
    [int]     $lenAdjustedZeroBased = -1;
    
    [string]  $folderActual = "";
    
    [boolean] $folderExist = $false;
    
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
        Check if folder exists
    #>
    $folderExist = Test-Path $folder;
    
    
    <#
        If folder does not exist, raise error
    #>    
    if ($folderExist -eq $False)
    {
        
        $log = $FORMAT_OS_FOLDER_DOES_NOT_EXIST -f $folder;
        
        Write-Error $log;
        
        return;
    
    }
   
    <#
        Convert Actual Path To String
    #>
    $folderActual = Convert-Path $folder
    

    <#
        Get Length of folder
    #>
    $len = $folderActual.Length;

    <#
        Get Length of folder, 0 based
    #>
    $lenAdjustedZeroBased = $len -1;

    <#
        Get Last Character
        
    #>
    $folderActualLastCharacter = $folderActual.Substring($lenAdjustedZeroBased , 1);
     
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
    $extWildcard = $FORMAT_EXTENSION_WILDCARD -f $ext

    <#
        Get Files
        
            a) Path is $folder
            
            b) File Extension has $ext
            
           c) File Attributes is not folder
            
           d) Recurse subdirectory


       Result
       
          a) Strip base folder using string replace method
            
    #>

    Write-Output "";

    Get-ChildItem -Path $folder  $extWildcard -Attributes !Directory -Recurse | 

            ForEach-Object { ($_.FullName.Replace($folder_and_backslash, $stringEmpty) )}
            
            
            
}

folderList $folder $ext