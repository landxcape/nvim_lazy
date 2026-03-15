-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local user_augroup = vim.api.nvim_create_augroup("user_config_autocmds", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = user_augroup,
  pattern = "dart",
  callback = function()
    vim.opt_local.colorcolumn = "80,120,150"
  end,
})
