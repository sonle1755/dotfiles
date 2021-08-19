addEventListener('LuaHighlight', { 'TextYankPost *' }, function()  
  require'vim.highlight'.on_yank { timeout=40 }
end)
