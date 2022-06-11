local use = require("packer").use

return require("packer").startup(function()
  use("wbthomason/packer.nvim")

  --use({ "lifepillar/vim-gruvbox8", config = "vim.cmd [[ colorscheme gruvbox8 ]]" })
  use({ "morhetz/gruvbox", config = "vim.cmd [[ colorscheme gruvbox ]]" })
  --use({ "joshdick/onedark.vim", config = "vim.cmd [[ colorscheme onedark ]]" })

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
  })
  use("stevearc/aerial.nvim")
  use("mbbill/undotree")

  use("christoomey/vim-tmux-navigator")

  use("lewis6991/gitsigns.nvim")
  use("norcalli/nvim-colorizer.lua")
  use("akinsho/toggleterm.nvim")
  use("terrortylor/nvim-comment")
  use("tpope/vim-surround")

  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("p00f/nvim-ts-rainbow")
  use("nvim-treesitter/nvim-treesitter-refactor")
  use("nvim-treesitter/playground")

  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  --use("williamboman/nvim-lsp-installer")
  use("neovim/nvim-lspconfig")
  use("tami5/lspsaga.nvim")
  use("windwp/nvim-autopairs")
  use("lukas-reineke/indent-blankline.nvim")
  use("jose-elias-alvarez/null-ls.nvim")

  use("L3MON4D3/LuaSnip")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("onsails/lspkind.nvim")

  use("simrat39/rust-tools.nvim")
  use("mattn/emmet-vim")

  use("mfussenegger/nvim-dap")

  -- require all plugins
  require("elmer.plugins.lualine")
  require("elmer.plugins.bufferline")
  require("elmer.plugins.treesitter")
  require("elmer.plugins.telescope")
  require("elmer.plugins.lsp")
  require("elmer.plugins.lspsaga")
  require("elmer.plugins.lspconfig")
  require("elmer.plugins.autopairs")
  require("elmer.plugins.colorizer")
  require("elmer.plugins.gitsigns")
  require("elmer.plugins.comment")
  require("elmer.plugins.indent_blankline")
  require("elmer.plugins.null_ls")
  require("elmer.plugins.tree")
  require("elmer.plugins.toggleterm")
  require("elmer.plugins.aerial")
  require("elmer.plugins.lspkind")
end)
