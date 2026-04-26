return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      dart = { "dart_format" },
      go = { "goimports", "gofumpt" },
    },
    formatters = {
      dart_format = {
        prepend_args = { "--line-length", "150" },
      },
    },
  },
}
