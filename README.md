# Kivy Easier
Archlinux and buildozer on WSL (Windows 10 FCU or later)
based on [wsldl](https://github.com/yuk7/wsldl)

![Screenshot](https://user-images.githubusercontent.com/66187211/96212318-eba01480-0f4c-11eb-9a53-5394175c8bac.png)

[![License](https://img.shields.io/github/license/ntaraujo/kivy-easier.svg?style=flat-square)](https://github.com/ntaraujo/kivy-easier/blob/master/LICENSE)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/ntaraujo/kivy-easier/issues)
[![HitCount](http://hits.dwyl.com/ntaraujo/kivy-easier.svg)](http://hits.dwyl.com/ntaraujo/kivy-easier)
[![Github All Releases](https://img.shields.io/github/downloads/ntaraujo/kivy-easier/total.svg?style=flat-square)](https://github.com/ntaraujo/kivy-easier/releases/latest)

### [⬇Download](https://github.com/ntaraujo/kivy-easier/releases/latest) | [📓Wiki](https://github.com/ntaraujo/kivy-easier/wiki)

## 📚 Intro

Windows Subsystem for Linux is the easiest way to run linux commands without the need to change all your environment. It's becoming more complex and complete. Certainly a good option to kivy developers who want to use buildozer in Windows.
If you don't use WSL yet, [read more](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

## 💻Requirements

* Windows 10 1709 Fall Creators Update 64bit or later.
* Windows Subsystem for Linux feature is enabled.

## 💾Install

**[For details, please refer to the wiki](https://github.com/ntaraujo/kivy-easier/wiki/How-to-Setup)**

#### 1. [Download](https://github.com/ntaraujo/kivy-easier/releases/latest) installer zip

#### 2. Extract all files in zip file to same directory
Please extract to a folder that has full access permission.
For example 'Program Files' can not be used.

#### 3. Run Kivy-Easier.exe
It will extract rootfs.tar.gz and register to WSL.

## ⚙️ Setup

#### 1. Setup default user
Already has an user created, its name is `kivy`, as the password.
In the folder you extracted the exe (with cmd or PowerShell), run:
```
Kivy-Easier.exe config --default-user kivy
```
Now, when you open the distro, will be logged in as a non-root user.

## 📝How-to-Use

#### 1. Open the WSL Terminal
If you use Windows Terminal, will appear the Kivy-Easier option to you in the "˅";

If you don't, run Kivy-Easier.exe once more, now it wont setup, but open the distro.

You can also create shortcuts with the context menu. Just right click and choose the better option to you.

#### 2. Access your project directory
Change the current directory to which the `main.py` file is located. If it is in "C:/Users/You/Documents/KivyProject":
```
cd /mnt/c/Users/You/Documents/KivyProject
```

#### 3. Create buildozer.spec file
Your app's specifications will be inside this. Run:
```
buildozer init
```

#### 4. Change it
Open buildozer.spec in your favorite editor (Windows side), change and save.
If you have to edit it inside WSL, install the necessary:
```
sudo pacman -S vim
```
Ps.: the password is ```kivy```.

#### 5. Start packaging
```
buildozer -v android debug
```
The process is commonly boring, get a coffe.

## ⬆️Update

#### 1. [Download](https://github.com/ntaraujo/kivy-easier/releases/latest) installer zip

#### 2. Extract .exe and rootfs.tar.gz from .zip and overwrites existing ones.

## 🚫Known issues

Please see [Wiki](https://github.com/ntaraujo/kivy-easier/wiki).

## 📁 Old Virtual Machine
No support, but you can get more info in this [branch](https://github.com/ntaraujo/kivy-easier/tree/old-vm).
