setlocal

git config --global --add safe.directory D:/personal/dadeniji/script/fileSystem/file/fileList

git add .\README.md

set "_folder=powershell"

git add %_folder%\file.list.type.generic.ps1

git add %_folder%\file.list.type.get.ps1

git add %_folder%\file.list.type.use.ps1

git add %_folder%\file.list.type.age.dadeniji.ps1

git add %_folder%\file.list.bare.ps1

git add %_folder%\analysis\PSScriptAnalyzer\check.cmd

set "_folder=MSDos\Batch"

rem git add %_folder%\os.fileList.cmd

git add git*.cmd

git add .gitignore

endlocal