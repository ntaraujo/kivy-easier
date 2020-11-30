@echo off

set MY_PATH="%~dp0..\Kivy-Easier.exe"

if "%1" == "wadb" (
    for /f "tokens=2,* delims= " %%a in ("%*") do set ALL_BUT_SECOND=%%b
    if "%2" == "run" (
        %MY_PATH% run /home/ke/scripts/wadb-run.sh %ALL_BUT_SECOND%
    ) else (
        %MY_PATH% run /home/ke/scripts/wadb-settings.sh %ALL_BUT_SECOND%
    )
) else (
    if "%1" == "help" (
        %MY_PATH% run cat /home/ke/helps/ke.txt
    ) else (
        for /f "tokens=1,* delims= " %%a in ("%*") do set ALL_BUT_FIRST=%%b
        %MY_PATH% %ALL_BUT_FIRST%
    )
)