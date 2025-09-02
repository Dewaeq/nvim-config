vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.g.vscode then
  require "code"
else
  require "neo"
end

require "base.mappings"
require "base.options"
require "base.autocmds"
