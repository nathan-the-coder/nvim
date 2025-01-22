
local options = {
	cursorline = true,

  clipboard = "unnamedplus",

	fileformat = 'unix',

  whichwrap = "h,l",

	completeopt = 'menu,menuone,noselect',

  guicursor = "n-v-c-sm:hor25,i:hor25",

  colorcolumn = "80",
	termguicolors = true,

	-- Tabs
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true,

	number = true,
	relativenumber = true,

	ignorecase = true,
	smartcase = true,

	autoindent = true,
	smartindent = true,

  showmode = false,
}

for option, value in pairs(options) do
	vim.o[option] = value
end

