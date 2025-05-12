
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup({})

mason_lspconfig.setup({
  automatic_enable = true,
  ensure_installed = { "lua_ls" }, -- You can specify servers here if desired
})

-- mason_lspconfig.setup_handlers({
--   -- Default handler for all LSP servers
--   function(server_name)
--     require('lspconfig')[server_name].setup({
--       capabilities = require('cmp_nvim_lsp').default_capabilities(),
--     })
--   end,
-- })
