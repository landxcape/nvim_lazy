# 💤 LazyVim - Ayu Edition

My personal [LazyVim](https://github.com/LazyVim/LazyVim) configuration, optimized for professional **Flutter**, **Rust**, and **Lua** development. This setup is strictly color-synced with my **Ayu Dark** Tmux environment.

## ✨ Core Features

- **🎨 Aesthetic:** Powered by `neovim-ayu` (Dark) with Ghostty transparency and subtle UI overrides for maximum focus.
- **🐦 Flutter/Dart Pro:**
  - `flutter-tools.nvim` with custom DAP logic to prioritize `.vscode/launch.json`.
  - Custom VSCode-style snippets for widgets and scaffolds.
  - Triple-column layout (`80,120,150`) specifically for Dart formatting.
  - Inlay hints enabled for icon and color previews.
- **🦀 Rust Integration:** Managed via `rustaceanvim` and `crates.nvim` for real-time dependency status.
- **💾 Smart Auto-Save:** Powered by `auto-save.nvim` with custom logic to prevent saving ephemeral, plugin, or environment buffers.
- **🪟 Tmux Synergy:** Zero-latency navigation between splits and Tmux panes via `vim-tmux-navigator`.
- **🚀 Modern Stack:** `blink.cmp` for completions, `snacks.nvim` for UI components, and `noice.nvim` for messages.

## 📦 Installation

```bash
# Backup existing config
mv ~/.config/nvim{,.bak}

# Clone this repository
git clone https://github.com/landxcape/nvim_lazy.git ~/.config/nvim

# Start Neovim
nvim
```

## ⌨️ Custom Keybindings

| Key | Action |
| :--- | :--- |
| `<leader>w` | Save File |
| `<leader>fr` | **Flutter:** Run App |
| `<leader>fR` | **Flutter:** Hot Reload |
| `<leader>fS` | **Flutter:** Hot Restart |
| `<leader>rcp` | **Rust:** Crates Popup |
| `Ctrl + h/j/k/l` | **Tmux:** Seamless Split Navigation |
| `Shift + h/l` | **Buffers:** Switch Previous/Next |
| `Alt + Left/Right` | **Panes:** Direct Tmux Navigation |

## 📂 Modular Structure

- `lua/config/`: Core settings and advanced `autocmds` (like Dart-specific columns).
- `lua/plugins/`: Modular plugin specs (one file per feature/language).
- `snippets/`: Custom Dart snippets for standard Flutter widgets.
- `after/ftplugin/`: Language-specific logic (e.g., Rust hover actions).

---
*Optimized for [Ghostty](https://ghostty.org/) and [Ayu Tmux](https://github.com/landxcape/tmux-config).*
