local util = require 'lspconfig/util'
local root_files = {
  'setup.py',
  'pyproject.toml',
  'setup.cfg',
  'requirements.txt',
  '.git'
}
return function()
  return {
    cmd = { 'pyright-langserver', '--stdio' };
    filetypes = { 'python' };
    root_dir = function(filename)
      return util.root_pattern(unpack(root_files))(filename) or util.path.dirname(filename)
    end;
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = 'workspace'
        }
      }
    },
  }
end
