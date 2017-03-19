#
# This file is based on the configuration written by
# Bruno Bonfils, <asyd@debian-fr.org>
# Written since summer 2001

#
# My functions (don't forget to modify fpath before call compinit !!)
# fpath=($HOME/.zsh/functions $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/completion $fpath)

# colors
eval `/usr/local/opt/coreutils/libexec/gnubin/dircolors $HOME/.zsh/colors`

autoload -U zutil
autoload -U complist
autoload -U compinit
compinit
autoload -U promptinit
promptinit
#prompt gentoo

bindkey -e emacs
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey "\e[H" beginning-of-line        # Home (xorg)
bindkey "\e[1~" beginning-of-line       # Home (console)
bindkey "\e[4~" end-of-line             # End (console)
bindkey "\e[F" end-of-line              # End (xorg)
bindkey "\e[2~" overwrite-mode          # Ins
bindkey "\e[3~" delete-char             # Delete
bindkey '\eOH' beginning-of-line
bindkey '\eOF' end-of-line
bindkey '^Z' set-mark-command

# Resource files
for file in $HOME/.zsh/rc/*.rc; do
  source $file
done


if [[ $TERM == "screen" || $TERM == "rxvt" || $TERM == "xterm-256color" ]]; then
    LC_MESSAGES=en_US.UTF-8
fi
