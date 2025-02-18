local map = vim.keymap.set

map("n", "<leader>a", function()
  vim.cmd.RustLsp "codeAction"
end, { silent = true, buffer = true })

-- vim.api.nvim_set_keymap("n", "<space>WD", "", {
--   noremap = true,
--   callback = function()
--     for _, client in ipairs(vim.lsp.get_clients()) do
--       print(client.name)
--       require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
--     end
--   end,
-- })
-- require("lspconfig").tsserver.setup {
--   on_attach = function(client, bufnr)
--     require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
--   end,
-- }
-- vim.keymap.set("n", "K", function()
--   vim.cmd.RustLsp { "hover", "actions" }
-- end, { silent = true, buffer = bufnr })
