
local options = {
	cursorline = true,

	fileformat = 'unix',

	completeopt = 'menu,menuone,noselect',

  guifont = "n-v-c-sm:hor25,i:hor25",

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

  laststatus = 3,

  showmode = false,
}

for option, value in pairs(options) do
	vim.o[option] = value
end

