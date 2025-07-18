return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim"
  },
  config = function()
    local actions = require("telescope.actions")
    local previewers = require("telescope.previewers")
    local _bad = { ".*%.csv", ".*%.lua" }
    local bad_files = function(filepath)
      for _,v in ipairs(_bad) do
        if filepath:match(v) then
          return false
        end
      end

      return true
    end

    local new_marker = function(filepath, bufnr, opts)
      opts = opts or {}
      if opts.use_ft_detect == nil then opts.use_ft_detect = true end
      opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end

    require("telescope").setup({
      defaults = {
        layout_config = { horizontal = { preview_cutoff = 0 } },
        buffer_previewer_maker = new_marker,
        mappings = {
          i = {
            ["<esc>"] = actions.close
          }
        }
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        }
      }
    })

    -- new keymaps here
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ps", function() builtin.grep_string({ search = vim.fn.input('Grep For > ')}) end)
    vim.keymap.set("n", "<leader>pw", function() builtin.grep_string({ search = vim.fn.expand('<cword>')}) end)
    vim.keymap.set("n", "<leader>ref", builtin.lsp_references)
    vim.keymap.set("n", "<leader>pf", builtin.find_files)
    vim.keymap.set("n", "<leader>pg", builtin.git_files)
    vim.keymap.set("n", "<leader>qf", builtin.quickfix)

     vim.keymap.set("n", "<leader>/h", builtin.command_history)
     vim.keymap.set("n", "<leader>/c", builtin.commands)
     vim.keymap.set("n", "<leader>/r", builtin.registers)
     vim.keymap.set("n", "<leader>/m", builtin.marks)
     vim.keymap.set("n", "<leader>/t", builtin.treesitter)

     vim.keymap.set("n", "<leader>bl", builtin.buffers)
     vim.keymap.set("n", "<leader>te", builtin.lsp_document_symbols)
    end,
}
