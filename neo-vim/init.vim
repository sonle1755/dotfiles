set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')
" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
" Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

Plug 'darrikonn/vim-gofmt'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-projectionist'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" prettier
Plug 'sbdchd/neoformat'

" Commentary
Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" StatusBar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Close Tag
Plug 'windwp/nvim-autopairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" Snippets
Plug 'honza/vim-snippets'
Plug 'hrsh7th/vim-vsnip'

Plug 'folke/lsp-trouble.nvim'

" Formatter & Linting
" Currently using neovim lsp

" Dev icons
Plug 'kyazdani42/nvim-web-devicons'

" NeoVim Tree
Plug 'kyazdani42/nvim-tree.lua'

Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

let loaded_matchparen = 1
let mapleader = " "

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

vnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>d "_d
vnoremap <leader>d "_d
nnoremap <leader>bj :bn<CR>
nnoremap <leader>bf :bp<CR>
nnoremap <leader>bb :b#<CR>

" Copy current file name
nnoremap <leader>cp :let @" = expand("%:t")<CR>
nnoremap <C-w> :bw<CR>

nnoremap <leader>cs :noh<CR>

inoremap <C-c> <esc>
fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" ES
com! W w

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
