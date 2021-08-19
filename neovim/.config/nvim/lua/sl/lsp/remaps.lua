local lsp_mapper = function(mode, key, result)
  map(mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end

lsp_mapper("n" , "<leader>vh"         , "vim.lsp.buf.hover()")
lsp_mapper("n" , "<c-]>"              , "vim.lsp.buf.definition()")
lsp_mapper("n" , "<leader>vrr"        , "vim.lsp.buf.references()")
lsp_mapper("n" , "<leader>vrn"        , "vim.lsp.buf.rename()")
lsp_mapper("n" , "<leader>ca"         , "vim.lsp.buf.code_action()")
lsp_mapper("n" , "gin"                , "vim.lsp.buf.incoming_calls()")
lsp_mapper("n" , "<space>dn"          , "vim.lsp.diagnostic.goto_next()")
lsp_mapper("n" , "<space>dp"          , "vim.lsp.diagnostic.goto_prev()")
lsp_mapper("n" , "<space>da"          , "vim.lsp.diagnostic.set_loclist()")
lsp_mapper("n" , "<leader>f"          , "vim.lsp.buf.formatting()")
lsp_mapper("i" , "<C-h>"              , "vim.lsp.buf.signature_help()")

