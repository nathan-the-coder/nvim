return {
  { "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require('configs.mason')
    end,
  },
  { "neovim/nvim-lspconfig",

    config = function()
      require('configs.lsp')
    end,
  },
}

