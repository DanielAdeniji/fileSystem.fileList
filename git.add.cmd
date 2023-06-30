setlocal

git add .\README.md

set "_folder=powershell"

git add %_folder%\file.list.type.generic.ps1

git add %_folder%\file.list.type.get.ps1

git add %_folder%\file.list.type.use.ps1

git add %_folder%\file.list.bare.ps1

git add git*.cmd

git add .gitignore

endlocal