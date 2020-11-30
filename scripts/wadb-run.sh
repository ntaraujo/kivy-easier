#!/bin/sh

VALUES=$HOME/values
VER=$(cat $VALUES/WSL)
PORT=$(cat $VALUES/PORT)
IP=$(cat $VALUES/IP)
LDIR=$HOME/.buildozer/android/platform/android-sdk
WDIR=$HOME
LPKG=platform-tools-latest-linux.zip
WPKG=platform-tools-latest-windows.zip

variable()
{
    if [ $VER -eq 2 ]
    then
        export ADB_SERVER_SOCKET=tcp:$IP:$PORT
        echo "ADB_SERVER_SOCKET set to $ADB_SERVER_SOCKET"
    else
        echo "Skipping variable setting since in WSL2."
    fi
}

upgrade()
{    
    echo "Downloading and unzipping Windows platform-tools"
    sudo wget -O $WDIR/$WPKG https://dl.google.com/android/repository/$WPKG
    sudo unzip -u $WDIR/$WPKG -d $WDIR

    echo "Downloading and unzipping Linux platform-tools"
    wget -O $LDIR/$LPKG https://dl.google.com/android/repository/$LPKG
    unzip -u $LDIR/$LPKG -d $LDIR


    echo "Windows side now:"
    ${WDIR}/platform-tools/adb.exe --version

    echo "Linux side now:"
    ${LDIR}/platform-tools/adb --version
}

start()
{
    if [ $VER -eq 2 ]
    then
        echo "Starting adb server in Windows side"
        ${WDIR}/platform-tools/adb.exe -a -P $PORT nodaemon server & disown
    else
        echo "Making shure adb is running in Windows side."
        ${WDIR}/platform-tools/adb.exe start-server
    fi
}

akill()
{
    echo "Killing adb in Windows side"
    ${WDIR}/platform-tools/adb.exe kill-server

    echo "Killing adb in linux side"
    ${LDIR}/platform-tools/adb kill-server
}

windows()
{
    eval "${WDIR}/platform-tools/adb.exe $@"
}

linux()
{
    eval "${LDIR}/platform-tools/adb $@"
}

ahelp()
{
    cat $HOME/helps/wadb-run.txt
}

case "$1" in
    help)
        ahelp
        ;;
    variable)
        variable
        ;;
    upgrade)
        upgrade
        ;;
    start)
        start
        ;;
    kill)
        akill
        ;;
    side)
        case "$2" in
            -w)
                shift 2
                windows "$@"
                ;;
            -l)
                shift 2
                linux "$@"
            ;;
        esac
        ;;
    *)
        variable
        start
        eval "$@"
        ;;
esac