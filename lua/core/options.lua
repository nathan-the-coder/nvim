local o = vim.opt
o.cursorline = true

o.clipboard = "unnamedplus"

o.clipboard = "unnamedplus"

o.completeopt = {"menu", "menuone", "noselect" }
vim.o.pumblend = 0
vim.o.winblend = 0

o.guicursor = "n-v-c-sm:hor25,i:hor25"
o.termguicolors = true
o.background = "dark"

o.colorcolumn = "80"

-- Tabs
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true

o.number = true
o.relativenumber = true

o.ignorecase = true
o.smartcase = true

o.autoindent = true
o.smartindent = true

o.showmode = false
o.swapfile = false

o.whichwrap:append("<,>,[,]")  -- arrow keys and other movements

o.guifont = "JetBrainsMono Nerd Font:h11"
