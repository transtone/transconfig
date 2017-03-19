#!/bin/sh

# Your own fonts-dir:
#xset +fp $HOME/.fonts

xhost + # allows root to launch X apps

# Chargement des paramètres Nvidia ( => ~/.nvidia-settings-rc
#                                       nvidia-settings )
exec nvidia-settings --load-config-only &
#exec kdeinit &
exec awesome &
WM_PID=$!
#exec xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &
#awesome's widgets and stuff
#exec conky-cli -c ~/.awesome/conky-cli.conf | awesome-client &
# You can set your favourite wallpaper here if you don't want
# to do it from your style.
#fbsetbg -l
#exec stalonetray & 
#exec /usr/bin/scim -d &
#exec cryptkeeper &
#exec gmpc &
#exec stardict &
#exec osmo &
#exec uxterm &
#exec uxterm &
exec mlnet &
exec mpd &
exec mpd &
exec mpc random on &
exec mpc play &
wait $WM_PID
