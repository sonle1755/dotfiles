local linters = {
  ['eslint'] = require 'sl.lsp.linters.eslint',
  ['eslint_d'] = require 'sl.lsp.linters.eslint_d',
  ['stylelint'] = require 'sl.lsp.linters.stylelint',
  ['luacheck'] = require 'sl.lsp.linters.luacheck',
  ['flake8'] = require 'sl.lsp.linters.flake8',
}
local formatters = {
  ['eslint_fmt'] = require 'sl.lsp.formatters.eslint_fmt',
  ['prettier'] = require 'sl.lsp.formatters.prettier',
  ['prettier_eslint'] = require 'sl.lsp.formatters.prettier_eslint',
  ['lua_format'] = require 'sl.lsp.formatters.lua_format',
  ['autopep8'] = require 'sl.lsp.formatters.autopep8',
}

local diagnosticls_nvim_defaults = {
  ['lua'] = {
    linter = require 'sl.lsp.linters.luacheck',
    formatter = require 'sl.lsp.formatters.lua_format',
  },
  ['html'] = {linter = require 'sl.lsp.linters.stylelint'},
  ['css'] = {linter = require 'sl.lsp.linters.stylelint'},
  ['less'] = {linter = require 'sl.lsp.linters.stylelint'},
  ['javascript'] = {
    linter = require 'sl.lsp.linters.eslint',
    formatter = require 'sl.lsp.formatters.prettier',
  },
  ['javascriptreact'] = {
    linter = require 'sl.lsp.linters.eslint',
    formatter = require 'sl.lsp.formatters.prettier',
  },
  ['typescript'] = {
    linter = require 'sl.lsp.linters.eslint',
    formatter = require 'sl.lsp.formatters.prettier',
  },
  ['typescriptreact'] = {
    linter = require 'sl.lsp.linters.eslint',
    formatter = require 'sl.lsp.formatters.prettier',
  },
  ['vue'] = {
    linter = require 'sl.lsp.linters.eslint',
    formatter = require 'sl.lsp.formatters.prettier',
  },
  ['python'] = {
    linter = 'flake8',
    formatter = 'autopep8'
  }
}

return function()
  return {
    filetypes = vim.tbl_keys(diagnosticls_nvim_defaults),
    init_options = {
      linters = linters,
      formatters = formatters,
      filetypes = {
        lua = 'luacheck',
        html = 'eslint',
        css = 'stylelint',
        less = 'stylelint',
        javascript = 'eslint',
        javascriptreact = 'eslint',
        typescript = 'eslint',
        typescriptreact = 'eslint',
        vue = 'eslint',
        python = 'flake8'
      },
      formatFiletypes = {
        lua = 'lua_fmt',
        javascript = 'prettier',
        javascriptreact = 'prettier',
        typescript = 'prettier',
        typescriptreact = 'prettier',
        vue = 'prettier',
        python = 'autopep8'
      }
    }
  }
end
