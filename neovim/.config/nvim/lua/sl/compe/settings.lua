require'compe'.setup {
  enabled = true,
  preselect = 'disable',
  source = {
    -- Passing a dict enables the completion source
    -- Menu is sorted by priority highest -> lowest
    vsnip           = {priority = 100},
    nvim_lsp        = {priority = 90},
    nvim_treesitter = {priority = 86},
    nvim_lua        = {priority = 85},
    buffer          = {priority = 80},
    path            = {priority = 70},
  },
}


