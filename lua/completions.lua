--Enable (broadcasting) snippet capability for completion
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['lua_ls'].setup {
-- 	capabilities = capabilities
-- }
-- require('lspconfig')['pyright'].setup {
-- 	capabilities = capabilities
-- }
-- -- require('lspconfig')['cssls'].setup {
-- -- 	capabilities = capabilities -- } require('lspconfig')['tailwindcss'].setup {
-- 	capabilities = capabilities
-- }
-- require('lspconfig')['tsserver'].setup {
-- 	capabilities = capabilities
-- }
-- require('lspconfig')['clangd'].setup {
-- 	capabilities = capabilities
-- }
-- require('lspconfig')['bashls'].setup {
-- 	capabilities = capabilities
-- }
-- require('lspconfig')['phpactor'].setup {
-- 	capabilities = capabilities
-- }
require("lspconfig").intelephense.setup({
	capabilities = capabilities,
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php", "blade.php" },
	root_dir = require("lspconfig").util.root_pattern("composer.json", ".git"),
})
require("lspconfig").stimulus_ls.setup({
	capabilities = capabilities,
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php", "blade.php" },
	root_dir = require("lspconfig").util.root_pattern("composer.json", ".git"),
})
