#!/bin/sh
# ~/.xsession : loaded on login from xenodm(1)

# merge .Xdefaults
test -f $HOME/.Xdefaults && xrdb -merge $HOME/.Xdefaults

# LANG
export LANG=en_AU.UTF-8

# compton
picom --config $HOME/etc/compton.conf &

# wallpaper
hsetroot \#A3B7C1 &
solidwall \#A3B7C1 &

# bars
stacks date  &
stacks clock &
stacks bat   & 
stacks wttr  &

# reset notifications
printf "" > $HOME/tmp/notif &

# cursor
xsetroot -cursor_name X_cursor &

# xbanish
xbanish &

# wm
exec cwm
