setlocal

set "file_=file.list.bare.ps1"

powershell -Command "Invoke-ScriptAnalyzer ../../%file_%  -ExcludeRule PSAvoidTrailingWhiteSpace"


endlocal
