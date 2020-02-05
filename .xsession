#!/bin/sh
# ~/.xsession : loaded on login from xenodm(1)

# merge .Xdefaults
test -f $HOME/.Xdefaults && xrdb -merge $HOME/.Xdefaults

# LANG & PATH
export LANG=en_AU.UTF-8
export PATH=$PATH:$HOME/bin

# wallpaper
#xsetroot -def &
test -f $HOME/etc/wallpaper.jpg \
	&& xwallpaper --zoom $HOME/etc/wallpaper.jpg \
	|| xsetroot -solid \#101f1f &

# bar
status | bar &

# reset notifications
printf "" > $HOME/tmp/notif &

# compton (eww)
compton --config $HOME/etc/compton.conf &

# cursor
xsetroot -cursor_name X_cursor &

# open a term
xterm -T "main - xterm" -e vim usr/txt/todo.txt &

# wm
exec cwm
