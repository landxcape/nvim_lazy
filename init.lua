if vim.g.vscode then
  print("Running inside VSCode, skipping LazyVim bootstrap.") -- for debugging
  return
end

-- bootstrap lazy.nvim, LazyVim and plugins
require("config.lazy")
require("config.dart_format")
vim.g.python3_host_prog = vim.fn.expand("~/.local/bin/python3")
