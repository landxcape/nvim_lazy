# 💤 LazyVim Configuration

This is my personal [LazyVim](https://github.com/LazyVim/LazyVim) configuration. It provides a robust, fast, and feature-rich Neovim setup.

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

*   **Neovim** (v0.9.0 or later)
*   **Git**
*   **A Nerd Font** (e.g., [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads) or [Cascadia Code Nerd Font](https://www.nerdfonts.com/font-downloads)) - required for icons.
*   **Lazygit** (optional, for git integration)
*   **Ripgrep** (required for Telescope grep)
*   **GCC** or **Clang** (required for compiling Tree-sitter parsers)

## 🚀 Installation

1.  **Backup your existing configuration:**

    ```bash
    # required
    mv ~/.config/nvim{,.bak}
    
    # optional but recommended
    mv ~/.local/share/nvim{,.bak}
    mv ~/.local/state/nvim{,.bak}
    mv ~/.cache/nvim{,.bak}
    ```

2.  **Clone this repository:**

    ```bash
    git clone https://github.com/landxcape/nvim_lazy.git ~/.config/nvim
    ```

3.  **Start Neovim:**

    ```bash
    nvim
    ```
    LazyVim will automatically install all plugins and dependencies on the first launch.

## 📂 Structure

*   `lua/config/`
    *   `autocmds.lua`: Auto commands
    *   `keymaps.lua`: Custom key mappings
    *   `options.lua`: Neovim options/settings
    *   `lazy.lua`: Lazy.nvim bootstrapping and configuration
*   `lua/plugins/`: Directory for plugin configurations. Each file returns a table (or a list of tables) defining plugins.

## ⚙️ Configuration

### Adding Plugins

Create a new file in `lua/plugins/` (e.g., `lua/plugins/my-plugin.lua`).

```lua
return {
  "plugin-owner/plugin-name",
  config = function()
    -- plugin configuration
  end,
}
```

### Keymaps

You can add your custom keymaps in `lua/config/keymaps.lua`.

```lua
-- Example: Map <leader>w to save file
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
```

### Options

Change default Neovim options in `lua/config/options.lua`.

```lua
vim.opt.relativenumber = true -- Enable relative line numbers
```

## 🤝 Contributing

Feel free to fork this repository and customize it to your liking!

## 📄 License

[MIT](LICENSE)