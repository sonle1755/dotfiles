nnoremap(']h', "&diff ? ']h' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'")
nnoremap('[h',  "&diff ? '[h' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'")

nnoremap('<LEADER>hs', '<cmd>lua require"gitsigns".stage_hunk()<CR>')
nnoremap('<LEADER>hu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>')
nnoremap('<LEADER>hr', '<cmd>lua require"gitsigns".reset_hunk()<CR>')
nnoremap('<LEADER>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>')
nnoremap('<LEADER>hb', '<cmd>lua require"gitsigns".blame_line()<CR>')
