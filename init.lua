-- options 
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.scrolloff = 999
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymaps
vim.keymap.set("n", "<Leader>m", ":Explore<cr>")
vim.keymap.set("n", "<Leader>b", ":bprevious<cr>")
vim.keymap.set("n", "<Leader>n", ":bnext<cr>")
vim.keymap.set("n", "<Leader>d", ":bdelete<cr>")

require("plugins")

