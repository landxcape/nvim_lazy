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
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml", "BufNewFile Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      popup = {
        autofocus = true,
      },
      on_attach = function(bufnr)
        local crates = require("crates")
        local function map(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end

        map("<leader>rcp", crates.show_popup, "Crates Popup")
        map("<leader>rcv", crates.show_versions_popup, "Crates Versions")
        map("<leader>rcu", crates.update_crate, "Crates Update")
        map("<leader>rcU", crates.update_all_crates, "Crates Update All")
        map("<leader>rco", crates.open_crates_io, "Crates.io")
        map("<leader>rcd", crates.open_documentation, "Crate Docs")
      end,
    },
    config = function(_, opts)
      require("crates").setup(opts)
    end,
  },
}
