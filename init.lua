-- In your init.lua or options.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('globals')
require('autocmds')
require('keymaps')
require('options')

require('config.lazy')
