
return {
<<<<<<< HEAD
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      local theme_file = io.open("$HOME/.theme", "r")
      if theme_file then
        local theme = theme_file:read("a")
        theme_file:close()
        vim.cmd("set background="..theme)
      end
      vim.cmd[[colorscheme gruvbox]]
=======
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
>>>>>>> master
    end
}
