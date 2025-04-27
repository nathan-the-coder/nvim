return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },                   -- Required
    { 'williamboman/mason.nvim', config = function() require("configs.mason") end },                 -- Optional
    { 'williamboman/mason-lspconfig.nvim'},       -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp', config = function() require("configs.cmp") end },               -- Required
    { 'hrsh7th/cmp-nvim-lsp' },           -- Required
    { 'hrsh7th/cmp-buffer' },             -- Optional
    { 'hrsh7th/cmp-path' },               -- Optional
    { 'saadparwaiz1/cmp_luasnip' },       -- Optional
    { 'hrsh7th/cmp-nvim-lua' },           -- Optional

    -- Snippets
    { 'L3MON4D3/LuaSnip' },                   -- Required
    { 'rafamadriz/friendly-snippets' },       -- Optional
  }
}
