#!/bin/sh

VALUES=$HOME/values
VER=$(cat $VALUES/WSL)
PORT=$(cat $VALUES/PORT)
IP=$(cat $VALUES/IP)
LDIR=$HOME/.buildozer/android/platform/android-sdk
WDIR=$HOME
LPKG=platform-tools-latest-linux.zip
WPKG=platform-tools-latest-windows.zip
P="WADB | "

cmd()
{
    if [ $VERB ]
    then
        if [ $1 == "variable" ]
        then
            CMD="$@"
        else
            CMD="$@ 2>&1 | awk -v var=$P '{ print var \$0;}'"
        fi
    else
        CMD="$@ > /dev/null 2>&1"
    fi

    if [ ! $BLOCK ]
    then
        [ $1 != "variable" ] && CMD="$CMD & disown"
    fi

    eval "$CMD"
    
}

variable()
{
    if [ $VER -eq 2 ]
    then
        export ADB_SERVER_SOCKET=tcp:$IP:$PORT
        echo "${P}ADB_SERVER_SOCKET set to $ADB_SERVER_SOCKET"
    else
        echo "${P}Skipping variable setting since in WSL2."
    fi
}

upgrade()
{
    echo "Making shure you have the needed package"
    sudo pacman -S wget --needed --noconfirm
    
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
        ${WDIR}/platform-tools/adb.exe -a -P $PORT nodaemon server
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

unset CONTINUE
unset VERB
unset BLOCK
while :
do
    case $1 in
        help)
            ahelp
            ;;
        -v|--verbose)
            if [ $VERB -o $BLOCK ]
            then
                ahelp
            else
                VERB=true
                CONTINUE=true
            fi
            ;;
        -b|--blocking)
            if [ $VERB -o $BLOCK ]
            then
                ahelp
            else
                BLOCK=true
                CONTINUE=true
            fi
            ;;
        -vb|-bv)
            if [ $VERB -o $BLOCK ]
            then
                VERB=true
                BLOCK=true
                CONTINUE=true
            fi
            ;;
        variable)
            cmd variable
            ;;
        upgrade)
            cmd upgrade
            ;;
        start)
            cmd start
            ;;
        kill)
            cmd akill
            ;;
        -w|--windows)
            if [ $VERB -o $BLOCK ]
            then
                ahelp
            else
                shift
                windows "$@"
            fi
            ;;
        -l|--linux)
            if [ $VERB -o $BLOCK ]
            then
                ahelp
            else
                shift
                linux "$@"
            fi
            ;;
        *)
            cmd variable
            cmd start
            eval "$@"
            ;;
    esac
    if [ ! $CONTINUE ]
    then
        break
    fi
    shift
done