return {
  "nvim-telescope/telescope.nvim",
  version = "0.2.1",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "MunifTanjim/nui.nvim"
    "nvim-telescope/telescope-file-browser.nvim"
  },
  keys = {
    { "<leader>ps", false },
    { "<leader>pw", false },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          height = 0.95,
          prompt_position = "top",
          preview_cutoff = 0, -- always show preview
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      }
    })

    require("telescope").load_extension("file_browser")

    vim.keymap.set("n", "<leader>ps",
      "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<cr>")
    vim.keymap.set("n", "<leader>pw",
      "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>')})<cr>")
    vim.keymap.set("n", "<leader>pf", "<cmd>lua require('telescope.builtin').find_files()<cr>")
  end,
}
