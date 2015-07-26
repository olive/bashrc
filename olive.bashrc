[[ "$-" != *i* ]] && return


alias s='git status'
alias mysql='mysql -uroot -ppassword'
alias configp='cabal configure -p --enable-executable-profiling --ghc-options "-auto-all -caf-all"'

WINHOME="/cygdrive/c/Users/$USER"
WINDT="$WINHOME/Desktop"
if [[ -d "$WINDT" ]] ; then
    cd "$WINDT"
    alias dt="cd "'"'"$WINDT"'"'
    alias lame='"'"$WINHOME"'"''/Downloads/lame3.99.5-64/lame.exe'
    alias ploc='perl ''"'"$WINHOME"'"''/ploc/ploc.pl'
    alias pdflatex='"'"$WINHOME"'"''/Downloads/miktex/miktex/bin/pdflatex.exe'
fi

alias l='ls -al'
alias ll='ls -l'
alias la='ls -a'
alias s='git status'
alias b='python build.py'
alias sudo='sudo '

tarc(){
    arg=`echo "$1" | sed 's,([^/]+)[/]*,\1,'`
    tar cfz $1.tar.gz $1/

}
tarx(){
    tar xfz $1.tar.gz
}


#colorscheme from jasonwryan, archlinux.org bbs
echo -ne '\e]4;0;#222222\a'   # 0;30 black
echo -ne '\e]4;8;#454545\a'   # 1;30 bold black (i.e. dark grey)
echo -ne '\e]4;1;#9E5641\a'   # 0;31 red
echo -ne '\e]4;9;#CC896D\a'   # 1;31 bold red
echo -ne '\e]4;2;#6C7E55\a'   # 0;32 green
echo -ne '\e]4;10;#C4DF90\a'  # 1;32 bold green
echo -ne '\e]4;3;#CAAF2B\a'   # 0;33 yellow
echo -ne '\e]4;11;#FFE080\a'  # 1;33 bold yellow
echo -ne '\e]4;4;#7FB8D8\a'   # 0;34 blue
echo -ne '\e]4;12;#B8DDEA\a'  # 1;34 bold blue
echo -ne '\e]4;5;#956D9D\a'   # 0;35 magenta
echo -ne '\e]4;13;#C18FCB\a'  # 1;35 bold magenta
echo -ne '\e]4;6;#4c8ea1\a'   # 0;36 cyan
echo -ne '\e]4;14;#6bc1d0\a'  # 1;36 bold cyan
echo -ne '\e]4;7;#808080\a'   # 0;37 white (light grey really)
echo -ne '\e]4;15;#cdcdcd\a'  # 1;37 bold white

echo -ne '\e]10;#cdcdcd\a'  # Black foreground
echo -ne '\e]11;#121212\a'  # Light gray background
echo -ne '\e]12;#343434\a'  # Green cursor


if [[ -z "$COMPNAME" ]] ; then
    PCOMPNAME='\h'
    COMPNAME="$USER"
else
    PCOMPNAME="$COMPNAME"
fi

if [[ -z "$PROMPTCLR" ]] ; then
    PROMPTCLR='0;35'
fi

if [[ -z "$WINTITLE" ]] ; then
    WINTITLE="$COMPNAME"
fi

case $- in
*i*)    # interactive shell
    PS1="\[\e[32m\]at \[\e[33m\]\W/\n\[\e[${PROMPTCLR}m\][$PCOMPNAME] \[\e[32m\]\$\[\e[0m\] "
    echo -ne '\e]0;'
    echo -n "$WINTITLE"
    echo -ne '\a'
;;
*)      # non-interactive shell
;;
esac
