To start developing this project you need [Inno Setup](https://jrsoftware.org/download.php/is.exe), an Arch Linux distro as [ArchWSL](https://github.com/yuk7/ArchWSL), [wsldl](https://github.com/yuk7/wsldl/releases/latest) and of course [git](https://git-scm.com/download/win)

Clone the repo
```
> git clone https://github.com/ntaraujo/kivy-easier.git
> cd .\kivy-easier
```

Change `MYPATH` in `creator.sh` to the repo folder path INSIDE WSL
```
> Arch.exe run pwd
/mnt/c/Users/Nathan/Documents/Github/kivy-easier  # copy it
code .\creator.sh  # using VSCode in this example
```
Also, create a folder `dev` and, inside this, another with the name `new`.

Install the needed packages and start the creation
```
> Arch.exe run "pacman-key --init && pacman-key --populate"  # if you didn't
> Arch.exe run pacman -S devtools
> Arch.exe run ./creator.sh
```
Any doubts feel free to ask on issues.

Now, change `MyPath` in `ke-setup.iss` to the repo folder path ON WINDOWS
```
> echo %cd%
C:\Users\Nathan\Documents\Github\kivy-easier  # copy it
> code .\ke-setup.iss  # or better, open with Inno Setup Compiler
```
Also, exclude the lines with paths to images `.ico`, `.bmp`.

Copy `Launcher.exe` from wsldl to `dev` and rename to `Kivy-Easier.exe`.

When `creator.sh` finishes, open `ke-setup.iss` with Inno Setup Compiler and start with Ctrl + F9.

That is it. Thank you so much. `ke-setup.exe` will be on `dev\new`
