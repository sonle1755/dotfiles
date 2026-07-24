return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false,                    -- neo-tree will lazily load itself
  config = function()
    vim.keymap.set("n", "<leader>we", "<Cmd>Neotree filesystem reveal<CR>", { desc = "Open Neotree file explorer" })
    vim.keymap.set("n", "<leader>wb", "<Cmd>Neotree buffers toggle right<CR>", { desc = "Open Neotree buffers" })
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        window = {
          mappings = {
            -- Make the mapping anything you want
            ["R"] = "easy",
          },
        },
        commands = {
          ["easy"] = function(state)
            local node = state.tree:get_node()
            local path = node.type == "directory" and node.path or vim.fs.dirname(node.path)
            require("easy-dotnet").create_item(path)
          end
        }
      },
    })
  end
}
