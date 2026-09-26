return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.indent = opts.indent or {}
      opts.indent.enable = true
      -- Disable Treesitter's experimental indent on Dart and YAML to prevent inconsistent o / Enter spacing
      opts.indent.disable = { "dart", "yaml" }
    end,
  },
}
