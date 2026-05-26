#!/usr/bin/env bash
set -e

TMUX_DIR="$HOME/.config/tmux"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "→ Installing tmux config..."

mkdir -p "$TMUX_DIR/scripts"

# Symlink config (tmux charge depuis ~/.tmux.conf)
ln -sf "$REPO_DIR/tmux.conf" "$HOME/.tmux.conf"
echo "  ✓ tmux.conf → $HOME/.tmux.conf"

# Symlink scripts
for script in "$REPO_DIR/scripts/"*.sh; do
  name=$(basename "$script")
  ln -sf "$script" "$TMUX_DIR/scripts/$name"
  echo "  ✓ $name → $TMUX_DIR/scripts/$name"
done

# Install tpm if missing
if [[ ! -d "$TMUX_DIR/plugins/tpm" ]]; then
  echo "→ Installing tpm..."
  git clone https://github.com/tmux-plugins/tpm "$TMUX_DIR/plugins/tpm"
  echo "  ✓ tpm installed"
fi

echo ""
echo "Done. Reload tmux with: tmux source ~/.config/tmux/tmux.conf"
echo "Then install plugins with: prefix + I"
