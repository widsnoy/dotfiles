-- Tab
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI config
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Status Line
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.laststatus = 3

-- Explore
vim.g.loaded_netrwPlugin = 1

require("lazy-setup")
require("keymaps")
require("colorscheme")
require("rust")
