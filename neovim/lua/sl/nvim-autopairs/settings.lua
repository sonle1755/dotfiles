require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
  enable_check_bracket_line = true,
  fast_wrap = {}
})

require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})

