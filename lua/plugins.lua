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
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd [[colorscheme tokyonight]]
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
		-- alpha
		'goolord/alpha-nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			-- require 'alpha'.setup(require 'alpha.themes.startify'.config)
			require("plugins.alpha-config")
		end
	},
	{
		-- lualine
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup({

				tabline = {
					lualine_a = { 'mode' },
					lualine_b = { 'buffers' },
					lualine_c = {},
					lualine_x = { 'encoding', 'filename', 'filetype', 'fileformat', 'progress' },
					lualine_y = { 'progress ' },
					lualine_z = { 'location' }
				},
				sections = {}
			})
		end,
	},
	{

		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
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
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	-- {
	-- 	'rcarriga/nvim-notify'
	-- },
	{
		'stevearc/conform.nvim',
		opts = {},
	},
	-- lazy.nvim
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- add any options here
	-- 	},
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		"rcarriga/nvim-notify",
	-- 	}
	-- },
	{
		'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"MaximilianLloyd/ascii.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim"
		}
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	-- last

})


require("mason").setup({
	ensure_installed = {
		"stylua",
		"isort",
		"black",
		"prettierd",
		"prettier",
		"curlylint",
		"clang-format",
	}
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"emmet_language_server",
		"tailwindcss",
		"tsserver",
		"clangd",
	},
})

-- setup lsps
require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").tailwindcss.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").clangd.setup {}

-- additional plugins
require("plugins.git")
require("plugins.emmet")
require("lint")
-- DISABLE pretty sht
-- require("plugins.noice_setup")
-- require("notify")("Hello, Emmanuel. Happy coding!")
require("plugins.oil")
