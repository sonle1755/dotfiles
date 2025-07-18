return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "Hoffs/omnisharp-extended-lsp.nvim"
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc')) then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME }
          }
        })
      end,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      }
    }

    lspconfig.omnisharp.setup {
      cmd = { "dotnet", "/home/bim/Omnisharp/OmniSharp.dll" },
      enable_roslyn_analyzers = true,
      capabilities = capabilities,
      usettings = {
         FormattingOptions = { EnableEditorConfigSupport = true, OrganizeImport = nil },
         MsBuild = { LoadProjectsOnDemand = nil },
         Sdk = { IncludePrereleases = true }
      }
    }
  end,
}
