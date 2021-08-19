-- Move to previous/next
nnoremap('<leader>,', ':BufferPrevious<CR>')
nnoremap('<leader>.', ':BufferNext<CR>')
-- Re-order to previous/next
nnoremap('<leader><', ':BufferMovePrevious<CR>')
nnoremap('<leader>>', ' :BufferMoveNext<CR>')
-- Goto buffer in position...
nnoremap('<leader>1', ':BufferGoto 1<CR>')
nnoremap('<leader>2', ':BufferGoto 2<CR>')
nnoremap('<leader>3', ':BufferGoto 3<CR>')
nnoremap('<leader>4', ':BufferGoto 4<CR>')
nnoremap('<leader>5', ':BufferGoto 5<CR>')
nnoremap('<leader>6', ':BufferGoto 6<CR>')
nnoremap('<leader>7', ':BufferGoto 7<CR>')
nnoremap('<leader>8', ':BufferGoto 8<CR>')
nnoremap('<leader>9', ':BufferGoto 9<CR>')
nnoremap('<leader>0', ':BufferLast<CR>')
-- Close buffer
nnoremap('<leader>c', ':BufferClose<CR>')
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
nnoremap('<leader>bca', ':BufferCloseAllButCurrent<CR>')
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
nnoremap('<leader>bp', ':BufferPick<CR>')
-- Sort automatically by...
nnoremap('<leader>bb', ':BufferOrderByBufferNumber<CR>')
nnoremap('<leader>bd', ':BufferOrderByDirectory<CR>')
nnoremap('<leader>bl', ':BufferOrderByLanguage<CR>')


