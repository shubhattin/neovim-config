local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}

local function use(plugin)
  table.insert(plugins, plugin)
end

if true then -- VSCode Inclusive Plugins
  use('ggandor/leap.nvim') -- leaping tool
end

if not vim.g.vscode then
  -- Basic Required Packages
  use "folke/neodev.nvim"
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-tree/nvim-web-devicons' -- icons

  -- Theming, Visual Tools
  use 'Mofiqul/dracula.nvim' -- dracula theme
  use 'feline-nvim/feline.nvim' -- bottom tab
  use {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'} -- code highlighting
  use 'nvim-treesitter/playground'
  use 'nvim-telescope/telescope.nvim' -- file finder
  use {
    'nvim-tree/nvim-tree.lua', -- file tree explorer
    version = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- Set a nerd font to enable this font service
  -- e.g :- CaskaydiaCove NF, Fira Code NF Retina, Hack NF
  -- Mono font version of the above do not show icons properly
  use 'romgrk/barbar.nvim' -- Multple tabs/buffers
  use "akinsho/toggleterm.nvim" -- Terminal
  use('mbbill/undotree')
  use {'lewis6991/gitsigns.nvim'} -- shows git modifers in files
  use('tpope/vim-fugitive') -- GitTool
  use("github/copilot.vim")
  use 'kdheepak/lazygit.nvim'

  -- LSP, Linters, Formatter
  use "jose-elias-alvarez/null-ls.nvim"
  use {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = { -- LSP Support
      {'neovim/nvim-lspconfig'}, {'williamboman/mason.nvim'}, {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'}, {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-nvim-lua'}, -- Snippets
      {'L3MON4D3/LuaSnip'}, {'rafamadriz/friendly-snippets'}
    }
  }

  -- Helper Tools
  use 'ThePrimeagen/vim-be-good'
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 400
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
end

require("lazy").setup(plugins)

vim.go.loadplugins = true
