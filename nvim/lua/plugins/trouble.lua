return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  config = function()
    require("trouble").setup({
      focus = true,
      auto_refresh = false,
      modes = {
        symbols = {
          mode = "lsp_document_symbols",
          focus = true,
          win = { size = 42 }
        }
      }
    })
  end
}
