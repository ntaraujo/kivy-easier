@echo off

"%~dp0..\Kivy-Easier.exe" runp "yes | /root/scripts/wadb-run.sh buildozer %*"

"%~dp0..\Kivy-Easier.exe" run /root/scripts/wadb-run.sh kill