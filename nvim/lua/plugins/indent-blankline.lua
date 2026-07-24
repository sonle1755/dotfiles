vim.opt.list = true -- Show tabs and spaces diff
vim.opt.listchars:append("eol:↴") -- end line with $
-- vim.g.indent_blankline_filetype_exclude = { 'dashboard' }
return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "┊" },
    scope = { show_end = true }
  },
}
