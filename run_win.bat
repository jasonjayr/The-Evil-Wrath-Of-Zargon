@echo off
REM we'll have to update this as the version of dosbox goes up.
set DOSBOX="\DOSBox-0.74\DOSBox.exe"

IF EXIST "%ProgramFiles%%DOSBOX%" SET DOSBOXPATH="%ProgramFiles%%DOSBOX%"
IF EXIST "%ProgramFiles(x86)%%DOSBOX%" set DOSBOXPATH="%ProgramFiles(x86)%%DOSBOX%"

%DOSBOXPATH% -c "mount c: ." -c "set PATH=Z:\;C:\DOS" -c "c:" -c "cd\zargon" -c "call zargon.bat" -c "exit"
