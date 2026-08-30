return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      Snacks.util.lsp.on({ name = "gopls" }, function(buf, _)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = buf, desc = desc })
        end

        map("<leader>gr", function()
          Snacks.terminal({ "go", "run", "." })
        end, "Go Run")

        map("<leader>gt", function()
          Snacks.terminal({ "go", "test", "-v", "./..." })
        end, "Go Test All")
      end)
    end,
  },
}
