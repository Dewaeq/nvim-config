local o = vim.o

o.scrolloff = 5
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.gdefault = true
o.relativenumber = true

-- fold defaults
o.foldenable = true
o.foldlevel = 99
o.foldlevelstart = 99 -- start with all folds open
o.foldcolumn = "0" -- show fold column
