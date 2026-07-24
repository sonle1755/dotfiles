return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "Hoffs/omnisharp-extended-lsp.nvim",
    "hrsh7th/nvim-cmp",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help)
    -- Setup lspconfig
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- lua_ls
    vim.lsp.config("lua_ls", {
      capabilities = capabilities
    })
    vim.lsp.enable('lua_ls');

    -- Roslyn
    -- vim.lsp.config("roslyn", {
    --   capabilities = capabilities,
    --   on_attach = function()
    --     print("This will run when the server attaches!")
    --   end,
    --   settings = {
    --     ["csharp|inlay_hints"] = {
    --       csharp_enable_inlay_hints_for_implicit_object_creation = true,
    --       csharp_enable_inlay_hints_for_implicit_variable_types = true,
    --     },
    --     ["csharp|code_lens"] = {
    --       dotnet_enable_references_code_lens = true,
    --     },
    --     ["csharp|formatting"] = {
    --       dotnet_organize_imports_on_format = true,
    --     },
    --   },
    -- })

    -- React
    vim.lsp.config("ts_ls", {
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      }
    })
    vim.lsp.config("eslint", {})
  end
}
