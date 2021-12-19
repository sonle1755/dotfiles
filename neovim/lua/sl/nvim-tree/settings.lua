-- vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } -- empty by default
-- vim.g.nvim_tree_gitignore = 1 -- 0 by default
vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1 --  0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_icon_padding = ' '

vim.g.nvim_tree_window_picker_exclude = {
  ["filetype"] = { 'packer', 'qf' },
  ["buftype"] = { 'terminal' }
}
vim.g.nvim_tree_special_files = {
  ["README.md"] = 1,
  ["Makefile"] = 1,
  ["MAKEFILE"] = 1
} --  List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_show_icons = {
  ["git"] = 1,
  ["folders"] = 1,
  ["files"] = 1,
  ["folder_arrows"] = 1,
}
-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath.
-- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
-- but this will not work when you set indent_markers (because of UI conflict)

--  default will show icon by default if no icon is provided
--  default shows no icon by default
vim.g.nvim_tree_icons = {
  ["default"] = '',
  ["symlink"] = '',
  ["git"] = {
    ["unstaged"] = "✗",
    ["staged"] = "✓",
    ["unmerged"] = "",
    ["renamed"] = "➜",
    ["untracked"] = "★",
    ["deleted"] = "",
    ["ignored"] = "◌"
  },
  ["folder"] = {
    ["arrow_open"] = "",
    ["arrow_closed"] = "",
    ["default"] = "",
    ["open"] = "",
    ["empty"] = "",
    ["empty_open"] = "",
    ["symlink"] = "",
    ["symlink_open"] = "",
  },
  ["lsp"] = {
    ["hint"] = "",
    ["info"] = "",
    ["warning"] = "",
    ["error"] = "",
  }
}

--  a list of groups can be found at `:help nvim_tree_highlight`
-- highlight NvimTreeFolderIcon guibg=blue

require'nvim-tree'.setup {
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = true,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = { 'dashboard' }
  },
  diagnostics = {
    enabled = true
  },
  view = {
    width = 40,
    side = 'left',
    auto_resize = true,
  }
}
