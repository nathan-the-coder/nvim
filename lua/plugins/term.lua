-- lua/plugins/toggleterm.lua
return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('configs.toggleterm')
  end,
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
  },
}

