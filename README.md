# 🖥️ System Overview

- **OS:** Arch Linux
- **Kernel:** `7.0.12-arch1-1`
- **Shell:** zsh

## 🏗️ Core Components

| Layer               | Component | Config Path           | Description                                         |
| :------------------ | :-------- | :-------------------- | :-------------------------------------------------- |
| **Display Manager** | Ly        |                       |                                                     |
| **Window Manager**  | Xmonad    | `~/.config/xmonad/`   | Tiling WM with persistent multi-monitor workspaces. |
| **Status Bar**      | Xmobar    | `~/.config/xmobar/`   | Lightweight system monitor bar.                     |
| **Compositor**      | Picom     | `~/.config/picom/`    | Handles transparency, shadows, and vsync.           |
| **Launcher**        | Rofi      | `~/.config/rofi/`     | Application runner and window switcher.             |
| **Notifications**   | Dunst     | `~/.config/dunst/`    | Notification daemon for system alerts.              |
| **Terminal**        | Alacritty | `~/.config/alacritty` |                                                     |
| **Shell**           | Zsh       | `~/.zshrc`            |                                                     |

---

## 🛠️ Hardware & Drivers

- **Display:** 3x Monitor Setup
- **GPU:** Intel Corporation Meteor Lake-P [Intel Graphics]
- **Driver:** i915 (Mesa)

---

## 🚀 Deployment / Setup Guide

1.  **Sync Dotfiles:** `stow .` (or manual `ln -s`)
2.  **Install Dependencies:** `sudo pacman -S --needed - < pkglist.txt`
3.  **Permissions:** Ensure `xmonad` is executable in `/usr/share/xsessions/`.
4.  **Autostart:** Managed via `~/.xinitrc`.

---
