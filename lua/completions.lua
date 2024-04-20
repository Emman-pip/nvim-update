require("plugins.cmp_setup")

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['lua_ls'].setup {
	capabilities = capabilities
}
require('lspconfig')['pyright'].setup {
	capabilities = capabilities
}
