
return {
    'catppuccin/nvim',
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
	    require('catppuccin').setup({

        kitty = true,
        flavour = "mocha",
        term_colors = true,
        transparent_background = true,
      })

      vim.cmd[[colorscheme catppuccin]]
    end
}
