-- Source neovim config
nnoremap('<leader><CR>', ':lua reload()<CR>')

-- Undotree Toggle
nnoremap('<leader>u', ':UndotreeToggle<CR>')


vnoremap('K', [[:m '<-2<CR>gv=gv]])
vnoremap('J', [[:m '>+1<CR>gv=gv]])
nnoremap('<leader>s',([[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>']]))

vnoremap('<leader>p', '"_dP')
nnoremap('<leader>y', '"+y')
vnoremap('<leader>y', '"+y')
nnoremap('<leader>Y', 'gg"+yG')
nnoremap('<leader>d', '"_d')


-- Clear highlight search result
nnoremap('<leader>cs', ':noh<CR>')

inoremap('<C-c>', '<esc>')


nnoremap('<leader>w', ':bw<CR>')
