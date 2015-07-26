

RCFILE="$HOME/.bashrc"
SRCFILE="olive.bashrc"
if [[ ! -f "$RCFILE" ]] ; then
    echo "No bashrc. Don't know what to do."
    exit 1
fi

uninstall() {
    sed -i 's/^.*#OLIVEBASHRC.*$//' "$RCFILE"
}

write() {
    echo "$@" '#OLIVEBASHRC' >> "$RCFILE"
}



install() {
    echo -n "Enter computer name: "
    read COMPNAME
    echo -n "Enter path to install: "
    read INSTPATH
    INSTPATH=${INSTPATH%/}
    echo -n "Enter color of computer name prompt: "
    read PROMPTCLR
    case `echo "$PROMPTCLR" | tr '[:upper:]' '[:lower:]'` in
        black)
            CODE="0;30"
        ;;
        bblack)
            CODE="1;30"
        ;;
        red)
            CODE="0;31"
        ;;
        bred)
            CODE="1;31"
        ;;
        green)
            CODE="0;32"
        ;;
        bgreen)
            CODE="1;32"
        ;;
        yellow)
            CODE="0;33"
        ;;
        brown)
            CODE="1;33"
        ;;
        blue)
            CODE="0;34"
        ;;
        bblue)
            CODE="1;34"
        ;;
        purple)
            CODE="0;35"
        ;;
        bpurple)
            CODE="1;35"
        ;;
        cyan)
            CODE="0;36"
        ;;
        bcyan)
            CODE="1;36"
        ;;
        white)
            CODE="0;37"
        ;;
        bwhite)
            CODE="1;37"
        ;;
        "")
            echo "No color, defaulting to purple"
        ;;
        *)
            echo "No such color $PROMPTCLR"
            exit 1
        ;;
    esac
    PROMPTCLR="$CODE"
    echo -n "Enter window title: "
    read WINTITLE
    mkdir -p "$INSTPATH"
    cp "$SRCFILE" "$INSTPATH/"

    write "COMPNAME=\"$COMPNAME\""
    write "PROMPTCLR=\"$PROMPTCLR\""
    write "WINTITLE=\"$WINTITLE\""
    write "source $INSTPATH/$SRCFILE"
}

x=`grep 'OLIVEBASHRC' "$RCFILE"`
res=$?
set -e

if [[ "$res" -eq 0 ]] ; then
    echo "Press enter to overwrite current installation or Ctrl+c to cancel"
    read z
    uninstall
fi

install
