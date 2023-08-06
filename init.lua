require("ccapitalK")

-- Options copied from vimrc
local TAB_WIDTH = 4
vim.opt.tabstop = TAB_WIDTH
vim.opt.softtabstop = TAB_WIDTH
vim.opt.shiftwidth = TAB_WIDTH
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.list = false
vim.opt.lazyredraw = false
vim.opt.relativenumber = true

-- Neovim options
vim.opt.smartindent = true
vim.opt.guicursor = ""
vim.hlsearch = false
vim.incsearch = false
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "120"
vim.opt.updatetime = 50
-- Set number of oldfiles to 30
vim.opt.shada = "'30,<50,s10,h"
