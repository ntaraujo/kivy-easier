# Kivy Easier
Buildozer on Windows.

![Screenshot](https://user-images.githubusercontent.com/66187211/96212318-eba01480-0f4c-11eb-9a53-5394175c8bac.png)

[![License](https://img.shields.io/github/license/ntaraujo/kivy-easier.svg?style=flat-square)](https://github.com/ntaraujo/kivy-easier/blob/master/LICENSE)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/ntaraujo/kivy-easier/issues)
[![Github All Releases](https://img.shields.io/github/downloads/ntaraujo/kivy-easier/total.svg?style=flat-square)](https://github.com/ntaraujo/kivy-easier/releases/latest)

### [⬇Download](https://github.com/ntaraujo/kivy-easier/releases/latest/download/ke-setup.exe) | [📓Start using](https://github.com/ntaraujo/kivy-easier#😎-Start-Using)

## 📚 Intro

This project uses Windows Subsystem for Linux to run all buildozer stuff in a box for you only have to digit `buildozer android debug` in your preferred terminal. It's light and weigh just the needed to work. If you don't use WSL yet, [install it](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

## 💻 Specs

### Required
Minimum to use [wsldl](https://github.com/yuk7/wsldl)
* Windows 10 1709 Fall Creators Update 64bit or later.
* Windows Subsystem for Linux feature is enabled.
### Recommended
Minimum to use WSL2 (or your project need to be inside the distro)
* For x64 systems: Version 1903 or higher, with Build 18362 or higher.
* For ARM64 systems: Version 2004 or higher, with Build 19041 or higher.

## 💾 Install

#### 1. [Download](https://github.com/ntaraujo/kivy-easier/releases/latest/download/ke-setup.exe) the .exe file and run it
A dialog box should appear asking for permission. 
#### 2. Next, next, next
Or change the options, of course. More details about the installation [here](https://github.com/ntaraujo/kivy-easier/blob/master/INSTALL.md).

## 😎 Start using
Yes, thats it. Use buildozer related commands as you are in linux systems:

#### 1. Access your project directory
```
cd C:\Users\You\Documents\YourProject
```
Note: The path cannot have spaces

#### 2. Create buildozer.spec file
```
buildozer init
```

#### 3. Edit it
Open buildozer.spec in your favorite editor, change and save.

#### 4. Start packaging
```
buildozer -v android debug
```
And... get a coffe.

More details about the usage [here](https://github.com/ntaraujo/kivy-easier/blob/master/USAGE.md).

## ⬆️Update

### 1. Uninstall previous version
Go to `Settings` > `Applications` > `Kivy Easier X` and click on `Uninstall`

Note: It will delete all already installed packages for buildozer too. First compile will be slower to download all again

#### 2. Install the [latest version](https://github.com/ntaraujo/kivy-easier/releases/latest/download/ke-setup.exe)
Follow the instructions above

## 🔧 Developers

Details on how to reproduce/contribute to this project [here](https://github.com/ntaraujo/kivy-easier/blob/master/DEVELOP.md).

## 📁 Old Virtual Machine
No support, but you can get more info in [this branch](https://github.com/ntaraujo/kivy-easier/tree/old-vm).
