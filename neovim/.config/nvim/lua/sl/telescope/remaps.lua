nnoremap('<leader>ps', "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>")
nnoremap('<leader>pw', "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>')})<CR>")
nnoremap('<leader>ref', "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
nnoremap('<leader>pf', "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>")
nnoremap('<leader>pg', "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap('<leader>qf', "<cmd>lua require('telescope.builtin').quickfix()<CR>")

nnoremap('<leader>/h', "<cmd>lua require('telescope.builtin').command_history()<CR>")
nnoremap('<leader>/c', "<cmd>lua require('telescope.builtin').commands()<CR>")
nnoremap('<leader>/r', "<cmd>lua require('telescope.builtin').registers()<CR>")
nnoremap('<leader>/m', "<cmd>lua require('telescope.builtin').marks()<CR>")
nnoremap('<leader>/t', "<cmd>lua require('telescope.builtin').treesitter()<CR>")

nnoremap('<leader>bl', "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap('<leader>te', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
