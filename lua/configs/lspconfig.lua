require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ccls", "pyright", "clangd" }
vim.lsp.enable(servers)
