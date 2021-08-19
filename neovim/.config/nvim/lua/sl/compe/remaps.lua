  -- Trigger completion
  map("i", "<C-Space>", "compe#complete()", {silent = true, expr = true, noremap = true})
  -- Confirm completion
  map("i", "<C-y>"     , "compe#confirm()", {silent = true, expr = true, noremap = true})
  -- Close completion menu
  map("i", "<C-e>"    , "compe#close()", {silent = true, expr = true, noremap = true})

  vim.cmd[[
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    highlight link CompeDocumentation NormalFloat
  ]]
