local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  {
	  'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
	  dependencies = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
   		{'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  },
  {
	  'rose-pine/neovim',
	  name = 'rose-pine',
  },
  {
    'tanvirtin/monokai.nvim',
	  name = 'monokai',
  },
  {
    'morhetz/gruvbox',
	  name = 'gruvbox',
  },
  {
	  'nvim-telescope/telescope.nvim',
	  dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate'},
  {'nvim-treesitter/playground'},
  {
    'theprimeagen/harpoon',
	  dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = 'ibl',
    config = true,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = true,
  },
  {'akinsho/git-conflict.nvim', config = true},
  {
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = true,
  },
  {'tpope/vim-fugitive'},
  {'ellisonleao/glow.nvim'},
  {'vim-test/vim-test'},
  {'tpope/vim-surround'},
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    }
  },
  {'jose-elias-alvarez/null-ls.nvim'},
  {'MunifTanjim/prettier.nvim'},
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end
  },
})
