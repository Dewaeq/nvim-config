local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt", lsp_format = "prefer" },
    python = { "black" },
    json = { "prettier" },
    -- json = { "yq" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

return options
