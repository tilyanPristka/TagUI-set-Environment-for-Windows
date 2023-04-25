@echo off
title Set TagUI Environment Variable PATH
setlocal
:CHOOSE
echo ---------------------------------------------------
echo Choose where you put the TagUI src folder.
echo ---------------------------------------------------
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Choose where you put the TagUI src folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"
setlocal enabledelayedexpansion
echo
echo
echo ---------------------------------------------------
echo Your TagUI src folder: !folder!
echo ---------------------------------------------------
endlocal
endlocal

setlocal
:PROMPT
SET /p sprompt=Are you sure (Y/[N])?
IF /i "%sprompt%" == "Y" GOTO SYES

:SYES
setx /M PATH "%PATH%;%folder%"
echo
echo
echo ---------------------------------------------------
echo Your TagUI has been successfully added to the Environment Variable
echo Open Command Prompt, then try typing tagui.
echo ---------------------------------------------------
timeout 7
endlocal