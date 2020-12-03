<h1 align="center">Kivy Easier</h1>
<p align="center">Buildozer on Windows.</p>

<p align="center"><img src="https://user-images.githubusercontent.com/66187211/100953292-0f192180-34f1-11eb-8f71-270f3f47721d.PNG" alt="kivy-easier"></p>

<p align="center"><a href="https://github.com/ntaraujo/kivy-easier/blob/master/LICENSE"><img src="https://img.shields.io/github/license/ntaraujo/kivy-easier.svg?style=flat-square" alt="License"></a>
<a href="https://github.com/ntaraujo/kivy-easier/issues"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat" alt="Contributions Welcome"></a>
<a href="https://github.com/ntaraujo/kivy-easier/releases/latest"><img src="https://img.shields.io/github/downloads/ntaraujo/kivy-easier/total.svg?style=flat-square" alt="Github All Releases"></a></p>

<h1 align="center"><a href="https://github.com/ntaraujo/kivy-easier/releases/latest/download/ke-setup.exe">⬇Download here</a></h1>

## 📚 Intro

This project uses Windows Subsystem for Linux to run all buildozer stuff in a box so you only have to digit `buildozer android debug` in your preferred terminal. It's light and weigh just the needed to work. If you don't use WSL yet, [install it](https://docs.microsoft.com/en-us/windows/wsl/install-win10#step-1---enable-the-windows-subsystem-for-linux).

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

#### 1. Make shure you have WSL enabled and the default version is 2
Follow [these](https://docs.microsoft.com/en-us/windows/wsl/install-win10#step-1---enable-the-windows-subsystem-for-linux) instructions until the fifth step
#### 2. [Download](https://github.com/ntaraujo/kivy-easier/releases/latest/download/ke-setup.exe) the .exe file and run it
A dialog box should appear asking for permission. 
#### 3. Next, next, next
More details about the installation [here](https://github.com/ntaraujo/kivy-easier/blob/master/INSTALL.md).

## 😎 Start using
Yes, it is ready. Use as if you are on linux systems

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
```
code .\buildozer.spec
```

#### 4. Start packaging
```
buildozer -v android debug
```
Note: be aware Kivy Easier will accept any license agreements automatically, as the one which appears in first run

#### 5. Get a coffe
## ☕ 😌

#### 6. Test on android devices
```
buildozer android deploy run
buildozer android logcat | grep python
```
Note: part of the output will be the results of ADB workarounds

More details about the usage [here](https://github.com/ntaraujo/kivy-easier/blob/master/USAGE.md).

## ⬆️Update

#### 1. Uninstall previous version
Go to `Settings` > `Applications` > `Kivy Easier X` and click `Uninstall`

Note: It will delete all already installed packages for buildozer too. First compile will be slower to download all again

#### 2. Install the [latest version](https://github.com/ntaraujo/kivy-easier/releases/latest/download/ke-setup.exe)
Follow the instructions above

## 🔧 Developers

Details on how to reproduce/contribute to this project [here](https://github.com/ntaraujo/kivy-easier/blob/master/DEVELOP.md).

## 📁 Old Virtual Machine
No support, but you can get more info in [this branch](https://github.com/ntaraujo/kivy-easier/tree/old-vm).
