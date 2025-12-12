return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "dart" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = {
          cmd = { "dart", "language-server", "--protocol=lsp" },
          filetypes = { "dart" },
          init_options = {
            closingLabels = true,
            flutterOutline = true,
            onlyAnalyzeProjectsWithOpenFiles = true,
            outline = true,
            suggestFromUnimportedLibraries = true,
          },
          settings = {
            dart = {
              completeFunctionCalls = true,
              showTodos = true,
            },
          },
        },
      },
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("flutter-tools").setup({
        flutter_path = "/Users/shakyapurna/development/flutter/bin/flutter",
        debugger = {
          enabled = true,
          run_via_dap = true,
          register_configurations = function(paths)
            local dap = require("dap")

            -- Try to load .vscode/launch.json first
            local launch_json = vim.fn.getcwd() .. "/.vscode/launch.json"
            if vim.fn.filereadable(launch_json) == 1 then
              local ok, content = pcall(vim.fn.readfile, launch_json)
              if ok then
                local json_ok, configs = pcall(vim.fn.json_decode, content)
                if json_ok and configs.configurations then
                  dap.configurations.dart = configs.configurations
                  return -- Exit early if loaded successfully
                end
              end
            end

            -- Fallback to default configuration
            dap.configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch Flutter",
                dartSdkPath = paths.dart_sdk,
                flutterSdkPath = paths.flutter_sdk,
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
            }
          end,
        },
        -- lsp = {
        --   color = {
        --     enabled = true,
        --     background = true,
        --     virtual_text = false,
        --   },
        -- },
        lsp = {
          color = {
            enabled = true,
            background = false,
            foreground = false,
            virtual_text = true,
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
          on_attach = function(client, bufnr)
            -- Enable inlay hints for icon previews
            if vim.lsp.inlay_hint then
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
          end,
        },
        widget_guides = {
          enabled = true,
        },
      })
    end,
    keys = {
      { "<leader>fr", "<cmd>FlutterRun<cr>", desc = "Flutter Run" },
      { "<leader>fR", "<cmd>FlutterReload<cr>", desc = "Flutter Reload" },
      { "<leader>fq", "<cmd>FlutterQuit<cr>", desc = "Flutter Quit" },
      { "<leader>fD", "<cmd>FlutterDevices<cr>", desc = "Flutter Devices" },
      { "<leader>fe", "<cmd>FlutterEmulators<cr>", desc = "Flutter Emulators" },
      { "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Flutter Outline" },
      { "<leader>fS", "<cmd>FlutterRestart<cr>", desc = "Flutter Restart" },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
