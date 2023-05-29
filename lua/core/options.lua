
local options = {
	cursorline = true,

	fileformat = 'unix',

	completeopt = 'menu,menuone,noselect',


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

}

for option, value in pairs(options) do
	vim.o[option] = value
end

vim.cmd('colorscheme dracula')
