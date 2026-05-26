# tmux-config

My personal tmux configuration — clean, fast, CTF-ready.

> Catppuccin Mocha palette · vim keybindings · pentest workflow built-in

---

## Features

- **Vim-style navigation** — `h/j/k/l` to move between panes, `|`/`-` to split
- **Popups** — lazygit (`prefix+g`), btop (`prefix+t`), network info (`prefix+n`)
- **CTF / Pentest** — target IP pinned in the status bar, set/clear with a keybind
- **Smart window rename** — shows current directory when in shell, process name otherwise
- **Session persistence** — auto-save every 15min via tmux-continuum, restore on start
- **Status bar** — session name · windows · target IP · LAN IP · user@host · time/date

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
| `prefix + t` | Session picker (choose-tree) |
| `prefix + w` | Window picker (choose-tree) |

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
| `prefix + Ctrl+I` | Clear target |

### Copy mode

| Key | Action |
|-----|--------|
| `v` | Begin selection |
| `y` | Copy to clipboard (pbcopy) |

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

Then inside tmux, install plugins:

```
prefix + I
```

### Requirements

- tmux ≥ 3.3
- [tpm](https://github.com/tmux-plugins/tpm) (auto-installed by `install.sh`)
- `lazygit`, `btop` (optional — for popups)

---

## Plugins

| Plugin | Purpose |
|--------|---------|
| [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) | Sane defaults |
| [tmux-yank](https://github.com/tmux-plugins/tmux-yank) | System clipboard |
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) | Session save/restore |
| [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) | Auto-save sessions |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Seamless vim ↔ tmux |

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
├── tmux.conf          # main config
├── scripts/
│   ├── network-info.sh
│   └── target.sh
├── install.sh
└── .gitignore
```
