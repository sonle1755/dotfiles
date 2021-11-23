local fs = require 'sl.lsp.functions'

return {
  sourceName = 'eslint_fmt',
  command = fs.get_executable('eslint', 'node'),
  args = {
    '--fix',
    '--fix-to-stdout',
    '--stdin',
    '--stdin-filename',
    '%filepath',
  },
  rootPatterns = {
    '.eslintrc',
    '.eslintrc.cjs',
    '.eslintrc.js',
    '.eslintrc.json',
    '.eslintrc.yaml',
    '.eslintrc.yml',
  },
}
