local lsp = require 'lspconfig'
local functions = require 'sl.lsp.functions'

vim.lsp.set_log_level("debug")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local default_lsp_config = {
  on_attach = functions.on_attach,
  capabilities = capabilities
}

local servers = {
  'tsserver',
  'vimls',
  'html',
  'cssls',
  'vuels',
  'sumneko_lua',
  -- 'efm',
  'diagnosticls',
  'pyright'
}

for _,  server in pairs(servers) do
  local config = require([[sl.lsp.servers.]]..server)()
  lsp[server].setup(vim.tbl_deep_extend("force", default_lsp_config, config))
end

