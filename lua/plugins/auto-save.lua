if vim.g.vscode then
  return {}
end

return {
  "okuuva/auto-save.nvim",
  version = "*",
  cmd = { "ASToggle" },
  event = { "InsertLeave", "TextChanged" },

  opts = function()
    local function is_real_file_buffer(buf)
      if not vim.api.nvim_buf_is_valid(buf) then
        return false
      end

      local bo = vim.bo[buf]
      local name = vim.api.nvim_buf_get_name(buf)

      -- Must be a normal editable buffer
      if not bo.modifiable then
        return false
      end
      if bo.readonly then
        return false
      end
      if bo.buftype ~= "" then
        return false
      end

      -- Must point to an actual file on disk path, not anonymous/plugin buffer
      if name == "" then
        return false
      end

      -- Skip weird ephemeral buffers
      if not vim.startswith(name, "/") and not name:match("^%a:[/\\]") then
        return false
      end

      return true
    end

    local ignored_filetypes = {
      "snacks_dashboard",
      "snacks_input",
      "snacks_notif",
      "snacks_picker_input",
      "noice",
      "notify",
      "TelescopePrompt",
      "lazy",
      "mason",
      "help",
      "qf",
      "man",
      "checkhealth",
      "lspinfo",
      "oil",
      "neo-tree",
      "dap-repl",
      "dapui_scopes",
      "dapui_breakpoints",
      "dapui_stacks",
      "dapui_watches",
      "dapui_console",
      "flutterToolsOutline",
      "gitcommit",
    }

    local ignored_filename_patterns = {
      "^%.env%..+",
    }

    local function is_ignored_filetype(ft)
      return vim.tbl_contains(ignored_filetypes, ft)
    end

    local function is_ignored_filename(name)
      local tail = vim.fn.fnamemodify(name, ":t")
      for _, pattern in ipairs(ignored_filename_patterns) do
        if tail:match(pattern) then
          return true
        end
      end
      return false
    end

    return {
      enabled = true,

      trigger_events = {
        immediate_save = { "BufLeave", "FocusLost" },
        defer_save = { "InsertLeave", "TextChanged" },
        cancel_deferred_save = { "InsertEnter" },
      },

      condition = function(buf)
        if not is_real_file_buffer(buf) then
          return false
        end

        local bo = vim.bo[buf]
        local name = vim.api.nvim_buf_get_name(buf)

        if is_ignored_filetype(bo.filetype) then
          return false
        end

        if is_ignored_filename(name) then
          return false
        end

        return true
      end,

      write_all_buffers = false,
      noautocmd = false,
      debounce_delay = 800,

      callbacks = {
        enabling = nil,
        disabling = nil,
        before_asserting_save = nil,
        before_saving = nil,
        after_saving = nil,
      },
    }
  end,
}
