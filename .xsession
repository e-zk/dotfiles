#!/bin/sh
# ~/.xsession : loaded on login from xenodm(1)

# merge .Xdefaults
test -f $HOME/.Xdefaults && xrdb -merge $HOME/.Xdefaults

# LANG & PATH
export LANG=en_AU.UTF-8
export PATH=$PATH:$HOME/bin

# compton
picom --config $HOME/etc/compton.conf &

# wallpaper
hsetroot \#A0AAAF &
solidwall \#A0AAAF &

# bars
stacks date  &
stacks clock &
stacks bat   & 
stacks wttr  &

# reset notifications
printf "" > $HOME/tmp/notif &

# cursor
xsetroot -cursor_name X_cursor &

# open a term
xterm -T "main - xterm" -e $EDITOR usr/txt/todo.txt &

# wm
exec cwm
