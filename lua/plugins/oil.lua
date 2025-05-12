return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    })
  end,
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory (oil.nvim)" },
  },
}

