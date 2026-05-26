#!/bin/zsh
# Lit le fichier target et affiche dans la status bar tmux

TARGET_FILE="$HOME/.config/tmux/.target"

if [[ -f "$TARGET_FILE" ]]; then
  IP=$(cat "$TARGET_FILE")
  echo "#[fg=#f38ba8,bold] 󰓾 $IP "
fi
