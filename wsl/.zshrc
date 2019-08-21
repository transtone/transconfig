#
# This file is based on the configuration written by
# Bruno Bonfils, <asyd@debian-fr.org>
# Written since summer 2001

export TERM="xterm-256color"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Resource files
for file in $HOME/.zsh/rc/*.rc; do
  source $file
done


