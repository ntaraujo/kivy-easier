## "ke" usage
```
Usage :
    <no args>
      - Open a new shell with your default settings.

    wadb [settings|run]
      - Run these commands with 'help' to see their usages.

    run <command line>
      - Run the given command line in that distro. Inherit current directory.

    runp <command line (includes windows path)>
      - Run the path translated command line in that distro.

    config [setting [value]]
      - `--default-user <user>`: Set the default user for this distro to <user>
      - `--default-uid <uid>`: Set the default user uid for this distro to <uid>
      - `--append-path <on|off>`: Switch of Append Windows PATH to $PATH
      - `--mount-drive <on|off>`: Switch of Mount drives

    get [setting]
      - `--default-uid`: Get the default user uid in this distro
      - `--append-path`: Get on/off status of Append Windows PATH to $PATH
      - `--mount-drive`: Get on/off status of Mount drives
      - `--lxguid`: Get WSL GUID key for this distro

    backup [contents]
      - `--tgz`: Output backup.tar.gz to the current directory using tar command
      - `--reg`: Output settings registry file to the current directory

    install <tarball>
      - Install instance image with .tar.gz.

    clean
      - Uninstall the distro.

    help
      - Print this usage message.
```


#### Just run the exe
```
> ke
[root@PC-NAME dir]#
```

#### Run with command line
```
> ke run echo something
something
```

#### Run with command line with path translation
```
> ke runp echo C:\Windows\System32\cmd.exe
/mnt/c/Windows/System32/cmd.exe
```

#### Change Default User (id command required)
```
> ke config --default-user user
> ke
[user@PC-NAME dir]$
```
Already exists an user: 'ke' with the passwd 'ke'.
If the default user has not been changed, please reboot the computer.

#### How to backup instance image
backup:
```
> ke backup
```
restore/install backup tarball:
```
> ke install backup.tar.gz
```

#### How to uninstall instance
```
> ke clean
```

## "ke wadb settings" usage
```
Usage :
  <no args>
    - Guide you through the options
  y
    - Accept all the recommended settings. No confirmation
  n
    - Disable WADB
  help
    - Print this usage message
```

## "ke wadb run" usage
```
Usage :
  start
    - Start Windows adb as required to work with Linux adb
  kill
    - Kill adb in Windows and Linux side
  variable
    - Set ADB_SERVER_SOCKET if in WSL2
  upgrade
    - Replace platform-tools in Linux and Windows side with the latest version
  side [-l|-w] <arguments>
    - Call adb in linux/windows side with the arguments given
  help
    - Print this usage message
  <anything else>
    - Anything else is executed as a linux command after an automatic 'start' and 'variable' call
```

#### Make shure adb versions are the same
```
ke wadb run upgrade
```

#### Kill just internal buildozer adb
```
ke wadb run side -l kill-server
```

#### Verify if adb workarounds are working
```
ke wadb run side -w devices
ke wadb run side -l devices
```

#### Run a command making shure adb will work
```
ke wadb run buildozer android logcat
```

## "buildozer" command
```
buildozer <arguments>
```
knowing the previous, basically its equal to
```
ke wadb run "yes | buildozer <arguments>" && ke wadb run kill
```
but wrote in another way

## "grep" command
```
grep <arguments>
```
knowing the previous, basically its equal to
```
ke run "grep <arguments>"
```