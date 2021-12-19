-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup {
  function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Theme
    use {
      'gruvbox-community/gruvbox',
       config = function () require 'sl.theme' end
    }
    -- Start Screen
    use {
      'glepnir/dashboard-nvim',
      config = function () require 'sl.dashboard-nvim' end
    }

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- -- Debug
    -- -- use {
    -- --   'puremourning/vimspector',
    -- --   -- config = function() require 'sl.vimspector' end
    -- -- }
    -- -- use 'szw/vim-maximizer'

    -- Git
    use {
      'tpope/vim-fugitive',
      config = function () require 'sl.vim-fugitive' end
    }

    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function() require 'sl.gitsigns' end
    }

    -- Undo tree
    use 'mbbill/undotree'
    use 'tpope/vim-surround'
    use 'bkad/CamelCaseMotion' -- allows to move by camelCase with w e
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function() require 'sl.indent-blankline' end
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = function() require 'sl.telescope' end
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Files Explorer Tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require 'sl.nvim-tree' end
    }

    -- LSP
    use {
      'neovim/nvim-lspconfig',
      config = function() require 'sl.lsp' end
    }
    use 'glepnir/lspsaga.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'folke/lsp-trouble.nvim'
    use 'onsails/lspkind-nvim'

    -- Completion
    use {
      'hrsh7th/nvim-compe', branch = 'master',
      -- config = function() require 'sl.compe' end
    }

    -- Snippets
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    -- Language packs
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() vim.cmd [[TSUpdate]] end,
      config = function() require 'sl.treesitter' end

    }
    use 'nvim-treesitter/playground'

    -- Commentary
    use 'tpope/vim-commentary'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Status bar
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = function() require 'sl.lualine' end
    }

    use {
    'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function () require 'sl.bufferline' end
    }


    -- Mixins
    use {
      'windwp/nvim-autopairs',
      config = function() require 'sl.nvim-autopairs' end
    }
    use {
      'simrat39/symbols-outline.nvim',
      config = function() require 'sl.symbols-outline' end
    }

    -- Dashboard
    -- #TODO: fix remaps & check issue #103 fix
    use {
      'ntpeters/vim-better-whitespace',
      config = function () require 'sl.vim-better-whitespace' end
    }

    use {
      'psf/black',
      -- config = function () require 'sl.black' end
    }


    -- Markdown Preview
    use {
      'iamcco/markdown-preview.nvim'
    }

  end
}
