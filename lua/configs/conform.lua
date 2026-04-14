local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt", lsp_format = "prefer" },
    python = { lsp_format = "prefer" },
    json = { "prettier" },
    -- _ = { "prettier" },
    -- json = { "yq" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

return options
