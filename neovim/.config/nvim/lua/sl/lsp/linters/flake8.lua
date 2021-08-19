local fs = require 'sl.lsp.functions'

return {
  sourceName = 'flake8',
  command = fs.get_executable('flake8'),
  args = {[[--format=%(row)d,%(col)d,%(code)s: %(text)s]], '-'},
  debounce = 100,
  offsetLine = 0,
  offsetColummn = 0,
  formatLines = 1,
  formatPattern = {
    [[(\d+),(\d+),([A-Z]),(.*)(]r|\n)*$]],
    {line = 1, column = 2, security = 3, message = {'[flake8] ', 4}}
  },
  securities = {
    W = 'warning',
    E = 'error',
    F = 'error',
    C = 'error',
    N = 'error'
  }
}
