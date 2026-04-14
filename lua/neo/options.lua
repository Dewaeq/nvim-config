require "nvchad.options"

-- Helper function to detect if we are inside a container
local function is_in_container()
  return vim.fn.filereadable "/.dockerenv" == 1 or vim.fn.filereadable "/run/.containerenv" == 1
end

if is_in_container() then
  -- ==========================================
  -- CONTAINER BEHAVIOR
  -- ==========================================

  -- 1. Turn OFF unnamedplus in the container.
  -- This ensures normal 'y' and 'p' use Neovim's internal memory and never hang.
  vim.opt.clipboard = ""

  -- 2. Configure OSC 52 specifically for the + and * registers
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy "+",
      ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    },
    paste = {
      -- Dummy functions to prevent Ptyxis from hanging if you accidentally type "+p
      ["+"] = function()
        return { "" }
      end,
      ["*"] = function()
        return { "" }
      end,
    },
  }

  -- 3. Map <leader>y to explicitly yank to your host clipboard via OSC 52
  vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to host clipboard via OSC 52" })
else
  -- ==========================================
  -- HOST BEHAVIOR (Not in a container)
  -- ==========================================

  -- 1. Clear any custom clipboard providers so Neovim auto-detects Wayland/X11
  vim.g.clipboard = nil

  -- 2. Restore your normal host behavior where everything syncs with the system clipboard
  vim.opt.clipboard = "unnamedplus"
end
