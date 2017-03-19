userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userenv=$HOME/.envrc

# merge in defaults and keymaps

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -f "$userenv" ]; then
    . "$userenv"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export GROFF_ENCODING=`locale charmap` 
export QEMU_AUDIO_DRV=alsa

#修正OOo界面与系统一致
export GTK2_RC_FILES="`pwd`/.gtkrc-2.0"
export XDG_MENU_PREFIX=lxde-
export SAL_USE_VCLPLUGIN="gtk"

export XMODIFIERS="@im=fcitx"
export XIM_PROGRAM=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
 
# export XMODIFIERS="@im=yong"
# export XIM_PROGRAM=yong
# export GTK_IM_MODULE=yong
# export QT_IM_MODULE=yong

# habak -ms -hi /usr/share/wallpapers/Lovelock_Stripes/contents/images/1280x800.png &
habak -ms -hi $HOME/海岛.jpg &

xset r rate 250 25 &
#xset m 3 1
xsetroot -cursor_name left_ptr &

#parcellite &
#wicd-client &
#nm-applet &
#volumeicon &
#tint2 &
#cairo-dock -o &
#unclutter -root -jitter 150 &
#urxvt &

DEFAULT_SESSION=xmonad

case $1 in
kde)
   exec startkde
   ;;
xfce4)
   exec startxfce4
   ;;
xmonad)
   exec ck-launch-session xmonad
   ;;
jwm)
   exec ck-launch-session jwm
   ;;
spectrwm)
   exec ck-launch-session spectrwm
   ;;
openbox)
   exec ck-launch-session dbus-launch --sh-syntax --exit-with-session openbox-session
   ;;
*)
   exec $DEFAULT_SESSION
   ;;
esac
