This page is to explain how Kivy Easier will be installed on your machine and what options are given.

## The executable
[wsldl](https://github.com/yuk7/wsldl) is a distro launcher, it is largely used to admin Arch Linux distros on WSL. This is the main executable file after install: "Kivy-Easier.exe"

## Basic
When the installer is run, it will extract three things in the folder given: "Kivy-Easier.exe", "rootfs.tar.gz" and "bin".

The first is explained and the second is there because the installer will run "Kivy-Easier.exe install" which will extract (again) all the file system from the tarball and register on WSL. Then, a Kivy-Easier option will appear between other distros if you have.

## Add to PATH variable
This option is part of the magic in this project.

"bin" is a folder with 3 .bat files (for now): "ke", "buildozer" and "grep". The first will broker commands to the main executable file and two shell scripts which help with the needed ADB workarounds for WSL.

The second is the apple of the eye: will take your orders to buildozer inside the distro making shure adb workarounds are working.

And the third is for making easier the common command
```
buildozer android logcat | grep python
```
you could use `findstr` windows command or just enclausure the pipeline:
```
buildozer "android logcat | grep python"
# or
buildozer android logcat "|" grep python
```
but its not so 🌟magic🌟

Any of these can be excluded after or you can even not add to path and use the distro by opening the main executable file

## Let workarounds for ADB ready
This option will do:
```
Kivy-Easier.exe run /root/scripts/wadb-settings.sh y
```
and
```
Kivy-Easier.exe run /root/scripts/wadb-run.sh upgrade
```
The first will detect your ip, the WSL version you are using for the distro and also will choose the default port for ADB to be used when you run some commands.

The second will download the latest version of platform-tools (adb is inside) for windows.

These two are needed for WADB to work, but you can manually edit the values or change platform-tools location inside `wadb-run.sh` to work with your installed one.

```
ke run "echo 1111 > /root/values/PORT"
ke run "echo 111.111.1.11 > /root/values/IP"
ke run "echo 1 > /root/values/WSL"

ke run ls /mnt/c/some/path
# platform-tools somefile anotherfile somedir
ke run sed -i 's/WDIR=$PDIR/WDIR=\/mnt\/c\/some\/path/g' /root/scripts/wadb-run.sh
```

## Let PACMAN ready for future uses
These:
```
Kivy-Easier.exe run pacman-key --init
```
and
```
Kivy-Easier.exe run pacman-key --populate
```
You will need this if you want to install any package in the distro after, or something related with PACMAN

## Uninstalling
If in some moment you want to uninstall Kivy Easier, it will prompt asking for you confirm with "y", this is the `Kivy-Easier.exe clean` command. It will unregister on WSL allowing all files to be deleted.

Here is also good to say that "bin" will be removed from path but a empty string is put in place, as you can see with `echo %PATH%` in cmd.
