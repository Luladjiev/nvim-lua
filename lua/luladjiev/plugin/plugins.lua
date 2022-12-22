require('lazy').setup({
  { -- LSP
    'VonHeikemen/lsp-zero.nvim',

    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',

    dependencies = {
      -- Additional text objects via treesitter
      'nvim-treesitter/nvim-treesitter-textobjects',
    },

    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -- Git related plugins
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },
  { 'lewis6991/gitsigns.nvim' },

  { 'dracula/vim', name = 'dracula' },

  -- Fancier statusline
  { 'nvim-lualine/lualine.nvim' },
  -- Add indentation guides even on blank lines
  { 'lukas-reineke/indent-blankline.nvim' },
  -- 'gc' to comment visual regions/lines
  { 'numToStr/Comment.nvim' },
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', enabled = vim.fn.executable 'make' == 1 },

  -- Undo on steroids
  { 'mbbill/undotree' },

  -- Help with all those keybindings
  {
    'folke/which-key.nvim',
    lazy = true,
    config = function()
      require('which-key').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  },
})
