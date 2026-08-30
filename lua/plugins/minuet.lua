return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "InsertEnter",
    opts = {
      provider = "gemini",
      provider_options = {
        gemini = {
          model = "gemini-2.5-flash",
          api_key = "GEMINI_API_KEY",
          stream = true,
          optional = {
            generationConfig = {
              maxOutputTokens = 256,
              temperature = 0.2,
            },
          },
        },
      },
      virtualtext = {
        auto_trigger_ft = {
          "dart",
          "go",
          "rust",
          "lua",
          "json",
          "toml",
          "yaml",
          "javascript",
          "typescript",
          "html",
          "css",
        },
        keymap = {
          accept = "<A-a>", -- Accept whole completion (Alt+a / Option+a)
          accept_line = "<A-l>", -- Accept single line (Alt+l / Option+l)
          prev = "<A-[>", -- Cycle previous suggestion
          next = "<A-]>", -- Cycle next suggestion
          dismiss = "<A-e>", -- Dismiss suggestion
        },
      },
      throttle = 400,
      debounce = 400,
      request_timeout = 3,
    },
    keys = {
      {
        "<leader>ua",
        "<cmd>Minuet virtualtext<cr>",
        desc = "Toggle AI Autocomplete (Gemini)",
      },
    },
  },
}
