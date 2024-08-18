-- options
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.scrolloff = 999
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.virtualedit = "block"
vim.opt.backupcopy = "yes"
-- vim.opt.shell = "powershell.exe"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymaps
vim.keymap.set("n", "<Leader>b", ":bprevious<CR>")
vim.keymap.set("n", "<Leader>n", ":bnext<CR>")
vim.keymap.set("n", "<Leader>d", ":bdelete<CR>")

require("plugins")

-- telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- for oil
-- vim.keymap.set("n", "<Leader>m", ":Explore<cr>")
vim.keymap.set("n", "<Leader>m", ":Oil<CR>")

vim.loader.enable()
