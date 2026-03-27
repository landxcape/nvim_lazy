return {
  -- Add the Ayu theme plugin
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000, -- Load this before other plugins
    config = function()
      require("ayu").setup({
        mirage = false, -- Set to true to use the 'mirage' variant for dark backgrounds
        terminal = true, -- Let the theme manage terminal colors
        overrides = {
          Normal = { bg = "None" }, -- Transparency for Ghostty
          ColorColumn = { bg = "#151a1e" }, -- Subtle Dart column
          SignColumn = { bg = "None" },
          FoldColumn = { bg = "None" },
          VertSplit = { fg = "#151a1e" },
        },
      })
    end,
  },
}
