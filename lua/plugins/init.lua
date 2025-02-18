return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- {
  --   "artemave/workspace-diagnostics.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require("workspace-diagnostics").setup {
  --       workspace_files = function() -- Customize this function to return project files.
  --         return vim.fn.systemlist "git ls-files" -- Example to get files from Git.
  --       end,
  --       -- Add any other configuration options as needed.
  --     }
  --
  --     ---------------------------------------------------------------------------
  --     --- Key Mappings
  --
  --     vim.api.nvim_set_keymap("n", "<space>MM", "", {
  --       noremap = true,
  --       callback = function()
  --         for _, client in ipairs(vim.lsp.get_clients()) do
  --           print(client.name)
  --           require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
  --         end
  --       end,
  --       desc = "Populate workspace diagnostics",
  --     })
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
}
