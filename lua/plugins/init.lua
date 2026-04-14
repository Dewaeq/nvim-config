return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- "basedpyright",
        "pyright",
        "ruff",
        "clangd",
      },
    },
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate | TSInstallAll",
    opts = require "configs.treesitter",
  },

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    cmd = "Telescope",
    opts = require "configs.telescope",
  },
  -- Lua
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    opts = {
      set_light_mode = function()
        local config = require "nvconfig"
        vim.api.nvim_set_option_value("background", "light", {})

        if config.base46.theme ~= config.base46.theme_toggle[1] then
          require("base46").toggle_theme()
          -- config.base46.theme = config.base46.theme_toggle[1]
          -- require("base46").load_all_highlights()
        end
      end,
      set_dark_mode = function()
        local config = require "nvconfig"
        vim.api.nvim_set_option_value("background", "dark", {})

        if config.base46.theme ~= config.base46.theme_toggle[2] then
          require("base46").toggle_theme()
          -- config.base46.theme = config.base46.theme_toggle[2]
          -- require("base46").load_all_highlights()
        end
      end,
      update_interval = 1000,
      fallback = "dark",
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    lazy = false,
    config = function()
      require("ufo").setup {
        provider_selector = function(bufnr, filetype, buftype)
          -- use treesitter with indent as fallback
          return { "treesitter", "indent" }
        end,
      }
    end,
  },
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required

      -- Only one of these is needed.
      "sindrets/diffview.nvim", -- optional
      "esmuellert/codediff.nvim", -- optional

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua", -- optional
      "nvim-mini/mini.pick", -- optional
      "folke/snacks.nvim", -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
    },
  },
  -- {
  -- "lewis6991/gitsigns.nvim",
  -- event = { "BufReadPre", "BufNewFile" },
  -- opts = require "configs.gitsigns",
  -- },
}
