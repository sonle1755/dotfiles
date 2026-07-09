return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  -- keys = {
  --   { "<leader>pp", function() require("oil").open_float() end },
  -- },
  opts = {
    view_options = {
      show_hidden = true,
    },
    -- config for oil-git-status
    win_options = {
      signcolumn = "yes:2",
    }
  },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
