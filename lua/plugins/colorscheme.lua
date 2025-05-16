
return {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup({
        dim_inactive = true,
        terminal_colors = true,
        contrast = "",
        transparent_mode = false,
      })
      vim.cmd[[colorscheme gruvbox]]
    end
}
