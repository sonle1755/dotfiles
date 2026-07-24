return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local dotnet = require("easy-dotnet")
    require("lualine").setup({
      options = {
        theme = "gruvbox_dark",
        disabled_filetupes = {
          statusline = { "neo-tree" },
        }
      },
      sections = {
        lualine_x = {
          dotnet.lualine.jobs,
          {
            dotnet.lualine.run_status,
            color    = dotnet.lualine.run_status_color,
            on_click = dotnet.lualine.run_status_click,
          },
        },
      },
    })
  end,

}
