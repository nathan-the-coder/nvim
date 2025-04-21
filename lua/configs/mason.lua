
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup({})

mason_lspconfig.setup({
  ensure_installed = {}, -- You can specify servers here if desired
  automatic_installation = true,
})

mason_lspconfig.setup_handlers({
  -- Default handler for all LSP servers
  function(server_name)
    require('lspconfig')[server_name].setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
  end,
})
