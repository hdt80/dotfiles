#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userkeybinds=$HOME/.xbindkeysrc
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -f "$userkeybinds" ]; then
	xbindkeys "$userkeybinds"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb -I ~/.Xresources

if [ -s ~/.Xmodmap ];  then
	xmodmap ~/.Xmodmap
fi

# Start i3
exec i3 --shmlog-size=26214400
#exec cinnamon-session
#exec /home/hdt/aur_builds/i3/build/i3 --shmlog-size=26214400
