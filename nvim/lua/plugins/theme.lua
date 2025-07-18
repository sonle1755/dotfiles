return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[syntax on]])
      vim.cmd([[colorscheme gruvbox]])
      vim.cmd([[set number]])
      vim.cmd([[set relativenumber]])
      vim.o.termguicolors = true
      vim.o.background = 'dark'
      vim.g.gruvbox_constrast_dark = 'medium'
      vim.g.gruvbox_sign_column = 'dark0_hark'
      vim.g.gruvbox_invert_selection = 0
      vim.g.gruvbox_number_column = 0
      vim.g.gruvbox_invert_tabline = true
      vim.cmd([[highlight ColorColumn ctermbg=0 guibg=lightgrey]])
      vim.cmd([[highlight SignColumn guibg=#282828]])
    end,
  }
}
