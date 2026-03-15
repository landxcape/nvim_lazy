local bufnr = vim.api.nvim_get_current_buf()
local map = vim.keymap.set

map("n", "K", function()
  vim.cmd.RustLsp({ "hover", "actions" })
end, { buffer = bufnr, silent = true, desc = "Rust Hover Actions" })

map("n", "<leader>rr", function()
  vim.cmd.RustLsp("runnables")
end, { buffer = bufnr, silent = true, desc = "Rust Runnables" })

map("n", "<leader>rR", function()
  vim.cmd.RustLsp({ "runnables", bang = true })
end, { buffer = bufnr, silent = true, desc = "Rust Rerun Last Runnable" })

map("n", "<leader>rd", function()
  vim.cmd.RustLsp("debuggables")
end, { buffer = bufnr, silent = true, desc = "Rust Debuggables" })

map("n", "<leader>rD", function()
  vim.cmd.RustLsp({ "debuggables", bang = true })
end, { buffer = bufnr, silent = true, desc = "Rust Rerun Last Debuggable" })

map("n", "<leader>ra", function()
  vim.cmd.RustLsp("codeAction")
end, { buffer = bufnr, silent = true, desc = "Rust Code Action Groups" })
