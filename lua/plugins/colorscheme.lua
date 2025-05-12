
return {
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
    end
}
