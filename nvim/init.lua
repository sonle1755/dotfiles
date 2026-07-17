-- Disable netrw
-- Must be placed before any plugin manager setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-lazy")
require("core")
require("csharp_sort")

-- Quickfix list nav keymaps
vim.keymap.set("n", "<leader>q", "<cmd>copen<cr>")
vim.keymap.set("n", "<leader>Q", "<cmd>cclose<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>cn<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>cp<cr>")

-- Open quickfix list with lsp diagnostics
vim.keymap.set("n", "qd", function()
  vim.diagnostic.setqflist({
    open = true,
    title = "Diagnostics",
    severity = { min = vim.diagnostic.severity.HINT }
  })
end, { desc = "Populate quickfix with diagnostics" })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_user_command("CsSortInterfaceMethods", function()
  require("csharp_sort").sort_interface_methods()
end, {})

-- Sessions
-- vim.keymap.set("n", "<leader>ss", "<cmd>")
vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function()
    if vim.fn.argc() == 0 then
      local ok = pcall(require("resession").load, vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
      if ok then
        vim.schedule(function()
          pcall(vim.cmd, "Neotree filesystem show")
        end)
      end
    end
  end,
})


-- Remaps default keymaps
vim.keymap.set("n", "grr", "<cmd>Trouble lsp_references focus=true follow=false<cr>", {
  desc = "References (Trouble)",
})
vim.keymap.set("n", "gri", "<cmd>Trouble lsp_implementations focus=true follow=false<cr>")
vim.keymap.set("n", "grd", "<cmd>Trouble lsp_definitions focus=true follow=false<cr>")
vim.keymap.set("n", "grD", "<cmd>Trouble lsp_declarations focus=true follow=false<cr>")
vim.keymap.set("n", "grt", "<cmd>Trouble lsp_type_definitions focus=true follow=false<cr>")
