require "nvchad.autocmds"

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("OSC52Yank", { clear = true }),
  callback = function()
    -- Only send text to the host if we explicitly yank (y), not when deleting (d, x)
    if vim.v.event.operator == "y" then
      local osc52_copy = require("vim.ui.clipboard.osc52").copy "+"
      osc52_copy(vim.v.event.regcontents)
    end
  end,
})
