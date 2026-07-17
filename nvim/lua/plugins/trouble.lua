return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  config = function()
    require("trouble").setup({
      focus = true,
      auto_refresh = false,
    })
  end
}
