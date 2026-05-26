# tmux-config

My personal tmux configuration — clean, fast, CTF-ready.

> Catppuccin Mocha palette · vim keybindings · pentest workflow built-in

---

## Features

- **Vim-style navigation** — `h/j/k/l` to move between panes, `v`/`s` to split
- **Popups** — lazygit (`prefix+g`), btop (`prefix+b`), network info (`prefix+i`)
- **CTF / Pentest** — target IP pinned in the status bar, set/clear with a keybind
- **Session & window picker** — `prefix+t` (sessions), `prefix+w` (windows)
- **Status bar** — session name · target IP · date · time

---

## Keybinds

### Panes

| Key | Action |
|-----|--------|
| `prefix + v` | Split vertical |
| `prefix + s` | Split horizontal |
| `prefix + h/j/k/l` | Navigate panes |
| `prefix + H/J/K/L` | Resize pane (5 cells) |

### Sessions / Windows

| Key | Action |
|-----|--------|
| `prefix + t` | Session picker |
| `prefix + w` | Window picker |

### Popups

| Key | Action |
|-----|--------|
| `prefix + g` | lazygit |
| `prefix + b` | btop |
| `prefix + i` | Network info (LAN / VPN / public IP) |
| `prefix + ?` | Cheatsheet |

### CTF / Pentest

| Key | Action |
|-----|--------|
| `prefix + I` | Set target IP |
| `prefix + U` | Clear target |

### Copy mode

| Key | Action |
|-----|--------|
| `prefix + e` | Enter copy mode |
| `v` | Begin selection |
| `y` | Copy to clipboard |

### Misc

| Key | Action |
|-----|--------|
| `prefix + r` | Reload config |

---

## Install

```bash
git clone https://github.com/julienlrzl/tmux-config ~/.config/tmux-config
cd ~/.config/tmux-config
chmod +x install.sh
./install.sh
```

### Requirements

- tmux ≥ 3.3
- `lazygit`, `btop`, `glow` (optional — for popups)

---

## Scripts

| Script | Description |
|--------|-------------|
| `scripts/network-info.sh` | Interactive popup: LAN / VPN / public IP with copy-to-clipboard |
| `scripts/target.sh` | Reads `~/.config/tmux/.target` and renders the IP in the status bar |

---

## Structure

```
tmux-config/
├── tmux.conf
├── scripts/
│   ├── network-info.sh
│   └── target.sh
├── install.sh
└── .gitignore
```
