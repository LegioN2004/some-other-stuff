local fn = vim.fn

---- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

---- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

---- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("Packer is not installed")
	return
end

---- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

---- put plugins here
return require 'packer'.startup(function()
	use 'wbthomason/packer.nvim' --main packer neovim plugin manager
	use 'lewis6991/impatient.nvim' --load fast

	--movement stuff
	-- use 'justinmk/vim-sneak'
	-- use 'phaazon/hop.nvim'

	-- session stuff
	-- use 'xolox/vim-session'
	-- use 'xolox/vim-misc'

	-- language specific stuff
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'tpope/vim-fugitive'
	use 'nvim-orgmode/orgmode' -- note taking org stuff
	-- markdown preview
	-- 	use({
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = "cd app && npm install",
	-- 	setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
	-- 	ft = { "markdown" },
	-- })
	use 'jiangmiao/auto-pairs'
	use 'mrjones2014/nvim-ts-rainbow'
	use 'kyazdani42/nvim-web-devicons'
	--syntax highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	-- LSP's
	use {'VonHeikemen/lsp-zero.nvim', tag = 'v2.x',}
	use 'neovim/nvim-lspconfig'             --  Required
	use 'williamboman/mason.nvim'           --  Optional
	use 'williamboman/mason-lspconfig.nvim' --  Optional
	--  Autocompletion Engine
	use 'hrsh7th/nvim-cmp'         --  Required
	use 'hrsh7th/cmp-nvim-lsp'     --  Required
	use 'hrsh7th/cmp-buffer'       --  Optional
	use 'hrsh7th/cmp-path'         --  Optional
	use 'saadparwaiz1/cmp_luasnip' --  Optional
	use 'hrsh7th/cmp-nvim-lua'     --  Optional
	--  Snippets
	use 'L3MON4D3/LuaSnip'             --  Required
	use 'rafamadriz/friendly-snippets' --  Optional
	use 'mfussenegger/nvim-jdtls' -- java lsp

	-- nvim ui stuff
	--use 'akinsho/bufferline.nvim'
	use 'airblade/vim-rooter'
	use 'tjdevries/express_line.nvim'
	use 'j-hui/fidget.nvim'
	use 'mbbill/undotree'
	use 'lewis6991/gitsigns.nvim'
	use 'szw/vim-maximizer'
	use 'nvim-lua/popup.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	--colorscheme
	use 'navarasu/onedark.nvim'
	use 'gruvbox-community/gruvbox'
	use {
		'svrana/neosolarized.nvim',
		requires = { 'tjdevries/colorbuddy.nvim' }
	}
	-- not using the telescope file explorer doesn't show files like ide's i need to see them without entering the folder everytime
	-- instead this
    use {
      'stevearc/oil.nvim',
      config = function() require('oil').setup() end
    }
  -- use {
  --   'nvim-tree/nvim-tree.lua',
  --   requires = {
  --     'nvim-tree/nvim-web-devicons', -- optional, for file icons
  --   },
  --   tag = 'nightly'           -- optional, updated every week. (see issue #1193)
  -- }
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
