vim.o.relativenumber = true
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.guicursor = ''
vim.o.errorbells = false
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
-- vim.o.smartindent = true
vim.o.nu = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.cmdheight = 1
vim.o.signcolumn = 'yes:1'
-- vim.o.isfname = k

vim.o.colorcolumn = '100'
vim.o.updatetime = 50
vim.g.loaded_matchparen = 1
vim.g.mapleader = ' '
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.completeopt = "menuone,noselect"

vim.cmd[[
com! W w
hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
]]
