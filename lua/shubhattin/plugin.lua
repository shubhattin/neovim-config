-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -- Setup lazy.nvim
-- require("lazy").setup({
--   spec = {
--     -- import your plugins
--     { import = "plugins" },
--   },
--   -- Configure any other settings here. See the documentation for more details.
--   -- colorscheme that will be used when installing plugins.
--   install = { colorscheme = { "habamax" } },
--   -- automatically check for plugin updates
--   checker = { enabled = true },
-- })

local plugins = {}

local function use(plugin)
  table.insert(plugins, plugin)
end

if true then -- VSCode Inclusive Plugins
  use("ggandor/leap.nvim") -- leaping tool
end

if not vim.g.vscode then
  -- Basic Required Packages
  use("folke/neodev.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-tree/nvim-web-devicons") -- icons

  -- Theming, Visual Tools
  use("Mofiqul/dracula.nvim") -- dracula theme
  use("feline-nvim/feline.nvim") -- bottom tab
  use({
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  }) -- code highlighting
  use("nvim-treesitter/playground")
  use("nvim-telescope/telescope.nvim") -- file finder
  use({
    "nvim-tree/nvim-tree.lua", -- file tree explorer
  })
  -- Set a nerd font to enable this font service
  -- e.g :- CaskaydiaCove NF, Fira Code NF Retina, Hack NF
  -- Mono font version of the above do not show icons properly
  use("romgrk/barbar.nvim") -- Multple tabs/buffers
  use("akinsho/toggleterm.nvim") -- Terminal
  use("mbbill/undotree")
  use({ "lewis6991/gitsigns.nvim" }) -- shows git modifers in files
  use("tpope/vim-fugitive") -- GitTool
  use("github/copilot.vim")
  use("kdheepak/lazygit.nvim")
  use({
    "andrewferrier/wrapping.nvim",
    config = function()
      -- require("wrapping").setup()
    end,
  }) -- wrapping lines (eg for rapping markdown, text files)
  -- use [ow for soft wrap and ]ow for hard wrap

  -- LSP, Linters, Formatter
  use({
    "VonHeikemen/lsp-zero.nvim",
    dependencies = { -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" }, -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  })
  use("elentok/format-on-save.nvim")

  -- Helper Tools
  use("ThePrimeagen/vim-be-good")
  use({
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 400
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })
end

require("lazy").setup(plugins)

vim.go.loadplugins = true
