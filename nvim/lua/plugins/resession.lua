return {
  "stevearc/resession.nvim",
  opts = {
    -- Exclude neo-tree buffers from ever being captured in the first place
    buf_filter = function(bufnr)
      return vim.bo[bufnr].filetype ~= "neo-tree"
    end,
    -- Also skip float/relative windows if you use any tree/sidebar floats
  },
  keys = {
    { "<leader>ss", function() require("resession").save() end,   desc = "Save session" },
    { "<leader>sd", function() require("resession").delete() end, desc = "Delete session" },
    {
      "<leader>sl",
      function()
        pcall(vim.cmd, "Neotree close")
        vim.schedule(function()
          require("resession").load()
          vim.schedule(function()
            pcall(vim.cmd, "Neotree filesystem show")
          end)
        end)
      end,
      desc = "Load session",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        require("resession").save(vim.fn.getcwd(), { notify = false })
      end,
    })
  end,
  config = function(_, opts)
    require("resession").setup(opts)
  end,

}
