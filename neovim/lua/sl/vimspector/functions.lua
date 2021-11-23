local M = {}
M.GotoWindow = function (id)
  vim.fn.win_gotoid(id)
end

return M
