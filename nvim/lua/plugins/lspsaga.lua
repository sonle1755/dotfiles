return {
  'nvimdev/lspsaga.nvim',
  config = function()
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<cr>")
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>")
    vim.keymap.set("n", "gra", "<cmd>Lspsaga code_action<cr>")

    vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga peek_definition<cr>", {
      desc = "Peek Definition (Lspsaga)",
    })
    vim.keymap.set("n", "<leader>lgd", "<cmd>Lspsaga goto_definition<cr>", {
      desc = "Go to Definition (Lspsaga)",
    })

    vim.keymap.set("n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<cr>", {
      desc = "Peek Type Definition (Lspsaga)",
    })
    vim.keymap.set("n", "<leader>lgt", "<cmd>Lspsaga goto_type_definition<cr>", {
      desc = "Go to Type Definition (Lspsaga)",
    })

    vim.keymap.set("n", "<leader>li", "<cmd>Lspsaga finder imp<cr>", {
      desc = "Find Implementations (Lspsaga)",
    })
    vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga finder ref<cr>", {
      desc = "Find References (Lspsaga)",
    })

    require('lspsaga').setup({
      rename = {
        in_select = false,
        auto_save = true,
      }
    })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  }
}
