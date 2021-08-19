
nnoremap('<leader>m', ':MaximizerToggle!<CR>')
nnoremap('<leader>dd', ':call vimspector#Launch()<CR>')
nnoremap('<leader>dc', ':lua require "sl.vimspector.functions".GotoWindow(vim.g.vimspector_session_windows.code)<CR>')
nnoremap('<leader>dt', ':lua require "sl.vimspector.functions".GotoWindow(vim.g.vimspector_session_windows.tagpage)<CR>')
nnoremap('<leader>dv', ':lua require "sl.vimspector.functions".GotoWindow(vim.g.vimspector_session_windows.variables)<CR>')
nnoremap('<leader>dw', ':lua require "sl.vimspector.functions".GotoWindow(vim.g.vimspector_session_windows.watches)<CR>')
nnoremap('<leader>ds', ':lua require "sl.vimspector.functions".GotoWindow(vim.g.vimspector_session_windows.stack_trace)<CR>')
nnoremap('<leader>do', ':lua require "sl.vimspector.functions".GotoWindow(vim.g.vimspector_session_windows.output)<CR>')
nnoremap('<leader>de', ':call vimspector#Reset()<CR>')

nmap('<leader>dl', '<Plug>VimspectorStepInto')
nmap('<leader>dj', '<Plug>VimspectorStepOver')
nmap('<leader>dk', '<Plug>VimspectorStepOut')
nmap('<leader>d_', '<Plug>VimspectorStepRestart')

nmap('<leader>drv', '<Plug>VimspectorRunToCusor')
nmap('<leader>dbp', '<Plug>VimspectorToggleBreakpoint')
nmap('<leader>dcbp', '<Plug>VimspectorToggleConditionalBreakpoint')
