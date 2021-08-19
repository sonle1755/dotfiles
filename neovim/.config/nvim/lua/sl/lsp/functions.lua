local M = {}

-- Check if the file in the filepath exist
-- @param name string
-- @return boolean
local function file_exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local function get_node_executable(command)
  local project_command = vim.fn.getcwd() .. '/node_modules/.bin/' .. command
  if file_exists(project_command) == true then
    command = project_command
  end

  return command
end

-- Get the php executable if it exists
-- in vendor/, else use global executable
-- @param command string
-- @return string
local function get_php_executable(command)
  local project_command = vim.fn.getcwd() .. '/vendor/bin/' .. command
  if file_exists(project_command) == true then
    command = project_command
  end

  return command
end

M.get_executable = function(command, type)
  if command == nil then
    vim.api.nvim_err_writeln('[diagnosticls-configs] "command" is required')
    return
  end

  if type == nil then
    return command
  end

  -- pattern matching
  local get_executable_by_type = {
    node = get_node_executable,
    php = get_php_executable,
  }

  command = get_executable_by_type[type](command)
  return command
end


M.on_attach = function(client)
  require 'sl.compe'
  require 'sl.trouble'
  require 'sl.lsp.remaps'
  require 'sl.lspkind'
  require 'sl.vimspector'
  -- Diagnostic text colors
  -- Errors in Red
  vim.cmd[[ hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red ]]
  -- Warnings in Yellow
  vim.cmd[[ hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow ]]
  -- Info and Hints in White
  vim.cmd[[ hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White ]]
  vim.cmd[[ hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White ]]
  -- Underline the offending code
  vim.cmd[[ hi LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=underline gui=underline ]]
  vim.cmd[[ hi LspDiagnosticsUnderlineWarning guifg=NONE ctermfg=NONE cterm=underline gui=underline ]]
  vim.cmd[[ hi LspDiagnosticsUnderlineInformation guifg=NONE ctermfg=NONE cterm=underline gui=underline ]]
  vim.cmd[[ hi LspDiagnosticsUnderlineHint guifg=NONE ctermfg=NONE cterm=underline gui=underline ]]

  -- use omnifunc
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- client.resolved_capabilities.document_formatting = true
  print("'" .. client.name .. "' language server started!" )
end
return M;
