dofile(vim.g.base46_cache .. "telescope")
local actions = require "telescope.actions"

local options = {
  defaults = {
    preview = true,
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        preview_cutoff = 0,
      },
      width = 0.91,
      height = 0.80,
    },
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-j>"] = actions.preview_scrolling_down,
      },
      i = {
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-j>"] = actions.preview_scrolling_down,
      },
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {},
  ensure_installed = {
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "c",
    "cpp",
  },
}

return options
