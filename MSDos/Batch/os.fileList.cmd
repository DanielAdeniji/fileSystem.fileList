@echo off

REM ********************************************************************************************************
REM Batch files: List all files in a directory with relative paths
REM https://stackoverflow.com/questions/8385454/batch-files-list-all-files-in-a-directory-with-relative-paths
REM ********************************************************************************************************

set mypath=

rem capture argument 1 as _arg1
set _arg1=%1

rem If Argument 1 is empty, then set _argument 1 to wildcard
if [%1] == [] set "_arg1=*"

rem filext as arg1
set "_fileExtension=*.%_arg1%*"

call :treeProcess

goto :eof

:treeProcess
setlocal

for %%f in (%_fileExtension%) do echo %mypath%%%f

rem iterate directories within the current folder
for /D %%d in (*) do (

    rem set current path to 'current path'[ + context directory] + '\'
    set mypath=%mypath%%%d\
        
    rem change to the 'contextual folder'
    cd %%d
    
    rem recurse
    call :treeProcess
    
    rem move up directory tree
    cd ..
    
)

endlocal

:eof

exit /b