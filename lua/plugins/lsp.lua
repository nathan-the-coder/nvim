function setup_mason()
	require('mason').setup({})
	require('mason-lspconfig').setup({
	    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
	    -- This setting has no relation with the `automatic_installation` setting.
	    ---@type string[]
	    ensure_installed = {},

	    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
	    -- This setting has no relation with the `ensure_installed` setting.
	    -- Can either be:
	    --   - false: Servers are not automatically installed.
	    --   - true: All servers set up via lspconfig are automatically installed.
	    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
	    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
	    ---@type boolean
	    automatic_installation = true,

	    -- See `:h mason-lspconfig.setup_handlers()`
	    ---@type table<string, fun(server_name: string)>?
	    handlers = nil,
	})

	require('mason-lspconfig').setup_handlers {
	  function (server_name)
	    require('lspconfig')[server_name].setup {}
	  end,
	}
end
function setup_completion()
---
-- Autocomplete
---
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    {name = 'path'},
    { name = 'codeium' },
    {name = 'nvim_lsp', keyword_length = 1},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  },
})
end
function setup_lsp()
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)
end

return {
	{ "williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			setup_mason()
		end
	},
	{ "neovim/nvim-lspconfig",
		config = function()
			setup_lsp()
		end
	},
	{ "hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets"
		},
		config = function()
			setup_completion()
		end
	}
}

