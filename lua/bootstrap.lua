local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'simrat39/rust-tools.nvim',
    config = function() 
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end
  }
  use 'mfussenegger/nvim-dap'

  -- nord colorscheme
  use "shaunsingh/nord.nvim"

  -- NvimTree
  use { 
    'nvim-tree/nvim-tree.lua', 
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  use 'nvim-lualine/lualine.nvim' 

  use { 'willothy/nvim-cokeline',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use 'nvim-treesitter/nvim-treesitter'

  use { 'williamboman/mason.nvim',
    requires = {
      'williamboman/mason-lspconfig.nvim',
    },
  }
 
  use { 'hrsh7th/nvim-cmp', 
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
  }

 use "elkowar/yuck.vim"

 use "norcalli/nvim-colorizer.lua"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
