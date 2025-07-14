return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-lua/nvim-web-devicons"
  },
  config = function()
    require("config.lualine")
  end
}
