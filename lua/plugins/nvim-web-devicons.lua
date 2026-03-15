return {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts = {
    override = {
      dart = {
        icon = "",
        color = "#03589C",
        name = "Dart",
      },
    },
  },
  config = function(_, opts)
    require("nvim-web-devicons").setup(opts)
  end,
}
