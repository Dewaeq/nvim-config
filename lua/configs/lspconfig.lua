require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "clangd", "cmake" }
vim.lsp.enable(servers)
