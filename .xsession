#!/bin/sh
# ~/.xsession : loaded on login from xenodm(1)

# merge .Xdefaults
test -f $HOME/.Xdefaults && xrdb -merge $HOME/.Xdefaults

# LANG & PATH
export LANG=en_AU.UTF-8
PATH=$PATH:$HOME/bin

# compton
picom --config $HOME/etc/compton.conf &

# wallpaper
xsetroot -solid \#A3B7C1 &
solidwall \#A3B7C1 &

# bars
stacks date  &
stacks clock &
stacks bat   & 
stacks wttr  &

# notifications
notified &

# cursor
xsetroot -cursor_name X_cursor &

# xbanish
xbanish -i mod1 &

# wm
exec cwm
