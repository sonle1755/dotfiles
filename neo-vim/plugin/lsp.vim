lua require("_lsp")
" Do this in lua?? maybe...
" vim.o is short for something teej thinks makes sense.
set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

augroup VueFmt
	autocmd!
    autocmd BufWritePre *.vue lua vim.lsp.buf.formatting_sync(nil, 1000)
    " autocmd BufWritePre *.vue lua vim.lsp.buf.formatting_seq_sync()
    " autocmd BufWritePost *.vue lua vim.lsp.buf.formatting()
  augroup END
" nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
" nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>f :lua vim.lsp.buf.formatting()<CR>
" nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
" nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap <leader>vll :call LspLocationList()<CR>

" augroup THE_PRIMEAGEN_LSP
"     autocmd!
"     autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
" augroup END

