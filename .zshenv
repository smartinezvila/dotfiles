export EDITOR=nvim
export PATH=$PATH":$HOME/scripts"
export PROMPT=" %F{240}%1~%f %(!.#.>) "
export RPROMPT="%F{240}%D{%e/%m/%Y %k:%M:%S}%f"

#Colors for TTY
if [ "$TERM" = "linux" ]; then
    export PROMPT=" %F{240}%1~%f %(!.#.>) "
    echo -en "\e]P0000000" #black
    echo -en "\e]P1FF5050" #red
    echo -en "\e]P250FF50" #green
    echo -en "\e]P3FFFF50" #yellow
    echo -en "\e]P45050FF" #blue
    echo -en "\e]P5FF50FF" #magenta
    echo -en "\e]P650FFFF" #cyan
    echo -en "\e]P7F0F0F0" #lightgrey
    echo -en "\e]P8303030" #darkgrey
    echo -en "\e]P9FF6060" #brightred
    echo -en "\e]PA60FF60" #brightgreen
    echo -en "\e]PBFFFF60" #brightyellow
    echo -en "\e]PC6060FF" #brightblue
    echo -en "\e]PDFF60FF" #brightmagenta
    echo -en "\e]PE60FFFF" #brightcyan
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi

###ENVIRONMENT VARIABLES###
export QT_STYLE_OVERRIDE=kvantum

###ALIASES###
alias vim='nvim'

alias ls='ls -Ahl --color=auto' #Setting flags for ls

alias cp='cp -i' #Confirmations
alias mv='mv -i'
alias rm='rm -i'

alias pacinst='sudo pacman -S --color=auto' #Install
alias pacrem='sudo pacman -Rs --color=auto' #Remove
alias packey='sudo pacman -Sy --color=auto archlinux-keyring' #Update keyring
alias pacup='paru' #Update
alias pacchk='sudo pacman -Sy' #Check Updates

alias xmonadconf='vim ~/.xmonad/xmonad.hs'

alias tempdef='redshift -P -O 6500'
alias tempnight='redshift -P -O 5000'

alias cbon='sudo isw -b on'
alias cboff='sudo isw -b off'

alias systemctl='sudo systemctl'

alias dwmconf='cd ~/dwm;nvim config.h'
alias dwmcomp='cd ~/dwm;make;sudo make install'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#Git ALIASES

alias send="git add .; git commit -m"


#Pfetch Settings
export PF_INFO="ascii title os host kernel uptime pkgs memory palette"
export PF_COL1=6
export PF_COL3=4

