
-- Move to previous/next
nnoremap('<leader>,', ':BufferLineCyclePrev<CR>')
nnoremap('<leader>.', ':BufferLineCycleNext<CR>')
-- Re-order to previous/next
nnoremap('<leader><', ':BufferLineMovePrev<CR>')
nnoremap('<leader>>', ' :BufferLineMoveNext<CR>')
-- Goto buffer in position...
nnoremap('<leader>1', ':BufferLineGoToBuffer 1<CR>')
nnoremap('<leader>2', ':BufferLineGoToBuffer 2<CR>')
nnoremap('<leader>3', ':BufferLineGoToBuffer 3<CR>')
nnoremap('<leader>4', ':BufferLineGoToBuffer 4<CR>')
nnoremap('<leader>5', ':BufferLineGoToBuffer 5<CR>')
nnoremap('<leader>6', ':BufferLineGoToBuffer 6<CR>')
nnoremap('<leader>7', ':BufferLineGoToBuffer 7<CR>')
nnoremap('<leader>8', ':BufferLineGoToBuffer 8<CR>')
nnoremap('<leader>9', ':BufferLineGoToBuffer 9<CR>')
nnoremap('<leader>0', ':BufferLast<CR>')
-- Close buffer
nnoremap('<A-c>', ':bw<CR>')
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
nnoremap('<leader>bca', ':BufferCloseAllButCurrent<CR>')
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
nnoremap('<leader>bp', ':BufferLinePick<CR>')
-- Sort automatically by...
nnoremap('<leader>be', ':BufferLineSortByExtension<CR>')
nnoremap('<leader>bd', ':BufferLineSortByDirectory<CR>')
nnoremap('<leader>bl', ':BufferOrderByLanguage<CR>')


