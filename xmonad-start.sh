#!/bin/sh

OUT="/tmp/xmonad.start.out"
date >> ${OUT}

export WINDOW_MANAGER=xmonad

# Set up an icon tray
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x191970 --height 12 &

# Set the background color
xsetroot -solid midnightblue

# xloadimage -onroot -fullscreen /usr/share/backgrounds/Pantano_de_Orellana_by_mgarciaiz.jpg

# xloadimage -onroot -fullscreen /usr/share/backgrounds/Thingvellir_by_pattersa.jpg

# Start some apps
xscreensaver -no-splash &
~/.dropbox-dist/dropboxd &
emacs &
firefox &
hipchat &
skype &
quicksynergy &

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

xmonad >> ${OUT} 2>&1
