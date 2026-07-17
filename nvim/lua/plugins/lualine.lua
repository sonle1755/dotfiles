return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox_dark",
        disabled_filetupes = {
          statusline = { "neo-tree" },
        }
      },
    })
  end,

}
