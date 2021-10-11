local M = {}

M.search_dotfiles = function ()
  require("telescope.builtin").find_files({
    promt_title = "< VimRC >",
    cwd = "$HOME/Desktop/dotfiles/neovim/",
    hidden = true,
  })
end


return M
