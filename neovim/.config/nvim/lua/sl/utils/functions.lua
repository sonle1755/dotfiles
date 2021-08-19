local M = {}

function M.starts_with(str, start)
   return str:sub(1, #start) == start
end

function M.tprint(table)
  print(vim.inspect(table))
end

function M.linkHighlight(from, to)
  local hl_exists, _ = pcall(vim.api.nvim_get_hl_by_name, from, false)
  if not hl_exists then
    vim.cmd(('highlight link %s %s'):format(from, to))
  end
end

function M.treeToggle()
  local open = function()
    require 'bufferline.state'.set_offset(31)
    require'nvim-tree'.find_file(true)
  end

  local close = function()
    require'buferline.state'.set_offset(0)
    require'nvim-tree'.close()
  end

  local view = require'nvim-tree.view'
  local lob = require'nvim-tree.lib'

  if view.win_open() then
    close()
  else
    if vim.g.nvim_tree_follow == 1 then
      open()
    else
      lib.open()
    end
  end
end
return M;
