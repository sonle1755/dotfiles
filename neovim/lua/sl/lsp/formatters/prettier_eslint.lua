local fs = require 'sl.lsp.functions'

return {
  sourceName = 'prettier_eslint',
  command = 'prettier-eslint',
  args = {'--stdin', '--stdin-filepath', '%filepath'},
  rootPatterns = {'.git'},
}
