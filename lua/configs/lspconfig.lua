require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

-- Disable Ruff's hover provider
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("RuffLspConfig", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end
  end,
})

-- Configure basedpyright instead of pyright
-- vim.lsp.config("basedpyright", {
--   settings = {
--     basedpyright = {
--       analysis = {
--         typeCheckingMode = "standard",
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = true,
--         inlayHints = {
--           callArgumentNames = true,
--         },
--       },
--     },
--   },
-- })

local servers = {
  "html",
  "cssls",
  -- "basedpyright",
  "pyright",
  "clangd",
  "neocmake",
  "docker_language_server",
  "lemminx",
  "ruff",
}
vim.lsp.enable(servers)
