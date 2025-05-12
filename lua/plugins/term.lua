-- lua/plugins/toggleterm.lua
return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('configs.tterm')
  end,
}

