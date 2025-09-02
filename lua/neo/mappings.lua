require "nvchad.mappings"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- lsp stuff
map("n", "gd", vim.lsp.buf.definition)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename symbol" })
map("n", "<leader>af", vim.lsp.buf.code_action, { desc = "show code actions" })
map("n", "K", vim.lsp.buf.hover)

map("n", "<leader>df", vim.diagnostic.open_float, { desc = "show floating diagnostics" })

map({ "n" }, "<leader>nr", "<cmd>set rnu!<CR>", { desc = "toggle relative line numbers" })

map("n", "<leader>i", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
