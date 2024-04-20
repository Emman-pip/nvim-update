-- greetings here
vim.cmd("echo 'hello, Emmanuel'")
-- require lazy
require("plugins.lazy_setup")

require("lazy").setup({
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		"dasupradyumna/midnight.nvim", 
		lazy = false, 
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("midnight")
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter', 
		config = function()
			require("plugins.ts_setup")
		end,
	},
	{
		-- autopairs
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		'goolord/alpha-nvim',
		config = function ()
			require'alpha'.setup(require'alpha.themes.dashboard'.config)
		end
	},
	{
		-- lualine
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup()
		end,
	},
	{

		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp' ,
		'hrsh7th/cmp-buffer'   ,
		'hrsh7th/cmp-path'     ,
		'hrsh7th/cmp-cmdline'  ,
		'hrsh7th/nvim-cmp'     ,
	},
	{
		'L3MON4D3/LuaSnip',
		dependencies = {
			'saadparwaiz1/cmp_luasnip',
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("completions")
		end,
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"lewis6991/gitsigns.nvim",
	},

})

require("plugins.git")
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer" },
})
-- setup lsps
require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").pyright.setup {}
