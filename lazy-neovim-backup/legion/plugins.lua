local fn = vim.fn

-- Automatically install packer
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("Packer is not installed")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

--put plugins here
return require("packer").startup(function()
	use("wbthomason/packer.nvim") --main packer neovim plugin manager
	use("lewis6991/impatient.nvim") --load fast
	--movement stuff
	-- use 'justinmk/vim-sneak'
	-- use 'phaazon/hop.nvim'
	-- session stuff
	-- use 'xolox/vim-session'
	-- use 'xolox/vim-misc'
	--language specific stuff
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("tpope/vim-fugitive")
	--note taking org stuff
	use("nvim-orgmode/orgmode")
	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- use("jiangmiao/auto-pairs")
	use("kyazdani42/nvim-web-devicons")
	--syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	-- nvim ui stuff
	--use 'akinsho/bufferline.nvim'
	use("folke/zen-mode.nvim")
	use("junegunn/limelight.vim")
	use("junegunn/goyo.vim")
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("ThePrimeagen/vim-be-good") --Vim be good is a plugin designed to make you better at vim by creating a game to practice basic movements in
	use("mbbill/undotree")
	use("nvim-lualine/lualine.nvim")
	use("lewis6991/gitsigns.nvim")
	use("szw/vim-maximizer")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	--colorscheme
	use("navarasu/onedark.nvim")
	use("gruvbox-community/gruvbox")
	use({
		"svrana/neosolarized.nvim",
		requires = { "tjdevries/colorbuddy.nvim" },
	})
	-- not using the telescope file explorer doesn't show files like ide's i need to see them without entering the folder everytime
	-- instead this
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use("junegunn/fzf")
	use("junegunn/fzf.vim")
	--	use { 'junegunn/fzf', { 'do': { -> fzf#install() } }
	use({ "neoclide/coc.nvim", branch = "release" }) --code completion and lsp type stuff
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
