return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "vue",
          "c_sharp"
			  },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        context_commentstring = { enable = true }
      })
    end,
  }
}
