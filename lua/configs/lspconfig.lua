require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "pyright",
  "clangd",
  "cmake",
  "docker_language_server",
  "lemminx",
}
vim.lsp.enable(servers)
