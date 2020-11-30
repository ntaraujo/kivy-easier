@echo off
setlocal EnableDelayedExpansion
set MY_PATH="%~dp0..\Kivy-Easier.exe"
set _tail=%*

if "%1" == "wadb" (
    call set _tail=%%_tail:*%1=%%
    call set _tail=%%_tail:*%2=%%
    if "%2" == "run" (
        %MY_PATH% run "/home/ke/scripts/wadb-run.sh !_tail!"
    ) else (
        %MY_PATH% run "/home/ke/scripts/wadb-settings.sh !_tail!"
    )
) else (
    if "%1" == "help" (
        %MY_PATH% run "cat /home/ke/helps/ke.txt"
    ) else (
        call set _tail=%%_tail:*%1=%%
        %MY_PATH% !_tail!
    )
)