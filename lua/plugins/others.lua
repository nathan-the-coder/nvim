return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup()
    end
  },

  { 'echasnovski/mini.icons', version = '*' },

  { 'nvim-tree/nvim-web-devicons' }
}
