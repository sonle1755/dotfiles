local lsp = require'lspconfig'
local compe = require('compe')
local util = require 'lspconfig/util'
local trouble = require('trouble')

local mapper = function(mode, key, result, opts)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, opts)
end

local lsp_mapper = function(mode, key, result)
  mapper(mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end

-- LSP Snippets ----------------------------------------------------------------

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    }
}
--------------------------------------------------------------------------------

local sumneko_root_path = '/home/bim/personal/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"


local function on_attach(client)
  -- Only autocomplete when I have a language server running
  compe.setup({
    enabled = true,
    preselect = 'disable',
    source = {
      -- Passing a dict enables the completion source
      -- Menu is sorted by priority highest -> lowest
      vsnip           = {priority = 100},
      nvim_lsp        = {priority = 90},
      nvim_treesitter = {priority = 86},
      nvim_lua        = {priority = 85},
      buffer          = {priority = 80},
      path            = {priority = 70},
    },
  }, 0) -- Only current buffer

  -- Compe mappings
  -- Trigger completion
  mapper("i", "<C-Space>", "compe#complete()",
  {silent = true, expr = true, noremap = true}
  )
  -- Confirm completion
  mapper("i", "<C-y>"     , "compe#confirm()",
  {silent = true, expr = true, noremap = true}
  )
  -- Close completion menu
  mapper("i", "<C-e>"    , "compe#close()",
  {silent = true, expr = true, noremap = true}
  )

  trouble.setup{}

  -- LSP mappings (only apply when LSP client attached)
  lsp_mapper("n" , "<leader>vh"         , "vim.lsp.buf.hover()")
  lsp_mapper("n" , "<c-]>"     , "vim.lsp.buf.definition()")
  lsp_mapper("n" , "<leader>vrr"        , "vim.lsp.buf.references()")
  lsp_mapper("n" , "<leader>vrn"        , "vim.lsp.buf.rename()")
  lsp_mapper("n" , "<leader>ca"         , "vim.lsp.buf.code_action()")
  lsp_mapper("n" , "gin"       , "vim.lsp.buf.incoming_calls()")
  lsp_mapper("n" , "<space>dn" , "vim.lsp.diagnostic.goto_next()")
  lsp_mapper("n" , "<space>dp" , "vim.lsp.diagnostic.goto_prev()")
  lsp_mapper("n" , "<space>da" , "vim.lsp.diagnostic.set_loclist()")
  lsp_mapper("n" , "<leader>f" , "vim.lsp.buf.formatting()")
  lsp_mapper("i" , "<C-h>"     , "vim.lsp.buf.signature_help()")

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
  
  client.resolved_capabilities.document_formatting = true
  print("'" .. client.name .. "' language server started!" )
end

-- TS
lsp.tsserver.setup{ 
  capabilities = capabilities;
  on_attach=on_attach,
  settings = {
    documentFormatting = true
  }
}
-------------------------------------------------------------------------------
lsp.vimls.setup {
  capabilities = capabilities,
  on_attach=on_attach,
}

lsp.html.setup{ 
  capabilities = capabilities;
  on_attach=on_attach,
}

lsp.cssls.setup {
  capabilities = capabilities,
  on_attach=on_attach,
}
--------------------------------------------------------------------------------

-- VueJs
lsp.vuels.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    vetur = {
      completion = {
        autoImport = true,
        tagCasing = "kebab",
        useScaffoldSnippets = false
      },
      format = {
        enabled = true,
        options = {
          useTabs = false,
          tabSize = 2,
        },
        defaultFormatter = {
          html = "prettier",
          js = "prettier",
          ts = "prettier",
        }
      },
      validation = {
        template = true,
        script = true,
        style = true,
        templateProps = true,
        interpolation = true
      },
      experimental = {
        templateInterpolationService = true
      }
    }
  },
  root_dir = util.root_pattern("package.json", "vueconfig.json", 'vite.config.js')
}


--------------------------------------------------------------------------------


-- LuaJIT
require'lspconfig'.sumneko_lua.setup {
    on_attach=on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
}
--------------------------------------------------------------------------------
-- Diagnostics
-- require'lspconfig'.diagnosticls.setup{
--   on_attach=on_attach,
--   filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss', 'markdown', 'pandoc', 'vue' },
--   init_options = {
--     linters = {
--       eslint = {
--         command = 'eslint',
--         rootPatterns = { '.git' },
--         debounce = 100,
--         args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--         sourceName = 'eslint',
--         parseJson = {
--           errorsRoot = '[0].messages',
--           line = 'line',
--           column = 'column',
--           endLine = 'endLine',
--           endColumn = 'endColumn',
--           message = '[eslint] ${message} [${ruleId}]',
--           security = 'severity'
--         },
--         securities = {
--           [2] = 'error',
--           [1] = 'warning'
--         }
--       },
--       markdownlint = {
--         command = 'markdownlint',
--         rootPatterns = { '.git' },
--         isStderr = true,
--         debounce = 100,
--         args = { '--stdin' },
--         offsetLine = 0,
--         offsetColumn = 0,
--         sourceName = 'markdownlint',
--         securities = {
--           undefined = 'hint'
--         },
--         formatLines = 1,
--         formatPattern = {
--           '^.*:(\\d+)\\s+(.*)$',
--           {
--             line = 1,
--             column = -1,
--             message = 2,
--           }
--         }
--       }
--     },
--     filetypes = {
--       javascript = 'eslint',
--       javascriptreact = 'eslint',
--       typescript = 'eslint',
--       typescriptreact = 'eslint',
--       markdown = 'markdownlint',
--       pandoc = 'markdownlint',
--       vue = 'eslint'
--     },
--     formatters = {
--       prettierEslint = {
--         command = 'prettier-eslint',
--         args = { '--stdin' },
--         rootPatterns = { '.git' },
--       },
--       prettier = {
--         command = 'prettier',
--         args = { '--stdin-filepath', '%filename' }
--       }
--     },
--     formatFiletypes = {
--        css = 'prettier',
--        javascript = 'prettierEslint',
--        javascriptreact = 'prettierEslint',
--        json = 'prettier',
--        scss = 'prettier',
--        typescript = 'prettierEslint',
--        typescriptreact = 'prettierEslint',
--        vue = 'vls'
--     }
--   }
-- }


local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
}

require('symbols-outline').setup(opts)
