require "nvchad.mappings"

-- see this link for more information
-- https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "i", "v" }, "<C-u>", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map({ "n" }, "<leader>w", "<cmd>w<CR>", { desc = "save file" })
map({ "n" }, "<leader>q", "<cmd>q<CR>", { desc = "close window" })

-- lsp stuff
map("n", "gd", vim.lsp.buf.definition)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename symbol" })
map("n", "<leader>af", vim.lsp.buf.code_action, { desc = "show code actions" })
map("n", "K", vim.lsp.buf.hover)

map("n", "<leader>df", vim.diagnostic.open_float, { desc = "show floating diagnostics" })

map("n", "<leader>i", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
