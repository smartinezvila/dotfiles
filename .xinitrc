#!/bin/sh

#Trayer
#Set keyboard layout
setxkbmap es &

#Set cursor
xsetroot -cursor_name left_ptr &

#Set wallpaper
~/.fehbg &

#Start compositor
picom &

#Start file manager as daemon
pcmanfm -d &

#Start clipboard manager as daemon
/usr/bin/greenclip daemon &

#Start window manager
while true; do
    mpd_stat
    sleep 5
done &
while true; do
	xsetroot -name "$(status)"
	sleep 0.2
done &
exec dwm

