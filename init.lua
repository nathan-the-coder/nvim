--
--vim.cmd('colorscheme monokai_soda')

--: Lua files {{{
require('bootstrap')
require('diagnostics')

require('core.options')
require('core.keymaps')
require('core.globals')
require('core.autocmds')

require('theme.nord')

require('configs.gs')

require('configs.codeium')

require('configs.lsp')
require('configs.cmp')
require('configs.treesitter')

require('configs.lline')
require('configs.cokeline')
require('configs.ntree')
--: }}}
--
--
vim.cmd [[
let &t_SI = "\e[4 q"
let &t_EI = "\e[2 q"
]]
