-- Only required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  print("Downloading packer.nvim...")
  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloaded packer.nvim")

  print("Reopen NVIM and run :PackerSync twice")

  return
end

return require('packer').startup {
  function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Start Screen
    use {
      'mhinz/vim-startify',
      config = function() require 'sl.startify' end
    }

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Debug
    use {
      'puremourning/vimspector',
      -- config = function() require 'sl.vimspector' end
    }
    use 'szw/vim-maximizer'

    -- Git
    use 'tpope/vim-fugitive'
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function() require 'sl.gitsigns' end
    }

    -- Undo tree
    use 'mbbill/undotree'
    use 'tpope/vim-surround'
    use 'bkad/CamelCaseMotion' -- allows to move by camelCase with w e
    -- use { 'glepnir/indent-guides.nvim', config = function() require 'sl.plugins.indent-guides' end}

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

    -- Buffer Tabline
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = function() require 'sl.barbar' end
    }

    -- Theming
    use 'gruvbox-community/gruvbox'

    -- Mixins
    use {
      'windwp/nvim-autopairs',
      config = function() require 'sl.nvim-autopairs' end
    }
    use {
      'simrat39/symbols-outline.nvim',
      config = function() require 'sl.symbols-outline' end
    }
  end
}
