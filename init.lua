if vim.g.vscode then
  return
end

-- bootstrap lazy.nvim, LazyVim and plugins
require("config.lazy")

local python3_host = vim.fn.exepath("python3")
if python3_host ~= "" then
  vim.g.python3_host_prog = python3_host
end
