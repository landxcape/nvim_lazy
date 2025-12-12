return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      override = {
        dart = {
          icon = "",
          color = "#03589C",
          name = "Dart",
        },
      },
    })
  end,
}
