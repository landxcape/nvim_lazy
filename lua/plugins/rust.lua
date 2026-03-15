return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "rust", "toml" })
    end,
  },

  -- Rust tools (optional but recommended)
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          enable_clippy = false,
        },
        server = {
          auto_attach = function(bufnr)
            if vim.bo[bufnr].buftype ~= "" then
              return false
            end
            local path = vim.api.nvim_buf_get_name(bufnr)
            if path == "" then
              return false
            end
            local cargo = require("rustaceanvim.cargo")
            return cargo.get_root_dir(path) ~= nil
          end,
          default_settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = false,
            },
          },
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          enabled = false,
        },
      },
    },
  },
}
