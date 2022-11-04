#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1=' \W > '
export PATH=$PATH':~/.local/bin'
###ALIASES###
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
alias dwmcomp='make;sudo make install'

#Start Neofetch
neofetch
