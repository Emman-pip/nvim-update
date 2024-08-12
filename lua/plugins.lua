-- require lazy

require("plugins.lazy_setup")

require("lazy").setup({
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{ -- optional completion source for require statements and module annotations
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
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
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			-- require "alpha".setup(require "alpha.themes.startify".config)
			require("plugins.alpha-config")
		end,
	},
	{
		-- lualine
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({

				tabline = {
					lualine_a = { "mode" },
					lualine_b = { "buffers" },
					lualine_c = {},
					lualine_x = { "encoding", "filename", "filetype", "fileformat", "progress" },
					lualine_y = { "progress " },
					lualine_z = { "location" },
				},
				sections = {},
			})
		end,
	},
	{

		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			-- require("completions")
		end,
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	-- {
	-- 	"rcarriga/nvim-notify"
	-- },
	{
		"stevearc/conform.nvim",
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
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"MaximilianLloyd/ascii.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
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
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"nvim-java/nvim-java",
		dependencies = {
			"nvim-java/lua-async-await",
			"nvim-java/nvim-java-refactor",
			"nvim-java/nvim-java-core",
			"nvim-java/nvim-java-test",
			"nvim-java/nvim-java-dap",
			"MunifTanjim/nui.nvim",
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			{
				"williamboman/mason.nvim",
				opts = {
					registries = {
						"github:nvim-java/mason-registry",
						"github:mason-org/mason-registry",
					},
				},
			},
		},
	},
	{
		"EmranMR/tree-sitter-blade",
		-- config = function()
		-- 	require("nvim-treesitter.configs").setup({
		-- 		ensure_installed = "blade",
		-- 		highlight = {
		-- 			enable = true,
		-- 		},
		-- 	})
		-- end,
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
	},
})

vim.g.lsp_zero_extend_lspconfig = 0
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"emmet_language_server",
		"tailwindcss",
		"tsserver",
		"clangd",
		"bashls",
		"cssls",
		-- php
		"intelephense",
		"stimulus_ls",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

-- cmpSHIT
-- require("completions")

-- setup lsps
require("java").setup()
require("lspconfig").jdtls.setup({})
--------------------------------------
require("lspconfig").lua_ls.setup({})
--------------------------------------
require("lspconfig").rust_analyzer.setup({})
--------------------------------------
require("lspconfig").pyright.setup({})
--------------------------------------
require("lspconfig").tailwindcss.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").cssls.setup({})
--------------------------------------
require("lspconfig").clangd.setup({})
--------------------------------------
-- php
require("lspconfig").intelephense.setup({
	root_dir = require("lspconfig").util.root_pattern(".git", "package.json"),
})
--------------------------------------
-- additional plugins
require("plugins.git")
require("plugins.emmet")
require("lint")
--------------------------------------
-- DISABLE pretty sht
-- require("plugins.noice_setup")
-- require("notify")("Hello, Emmanuel. Happy coding!")
require("plugins.oil")
--------------------------------------

-- cssls
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup({
	capabilities = capabilities,
})
require("plugins.cmp_setup")

-- bashls
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		vim.lsp.start({
			name = "bash-language-server",
			cmd = { "bash-language-server", "start" },
		})
	end,
})

-- blade
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade",
		files = { "src/parser.c" },
		branch = "main",
	},
	filetype = "blade",
}

-- local group = vim.api.nvim_create_augroup("blade", { clear=true})
-- vim.api.nvim_create_autocmd("BufRead", {
-- 	group = group,
-- 	pattern = "*.blade.php",
--
-- })
--
-- require("lspconfig").stimulus_ls.setup({
-- 	root_dir = require("lspconfig").util.root_pattern(".git", "package.json"),
-- })
