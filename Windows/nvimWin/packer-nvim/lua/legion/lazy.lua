local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

--put plugins here
require('lazy').setup({
	defaults = { lazy = true },
	checker = { enabled = true },
	change_detection = {
		notify = true,
	},
	{ 'tpope/vim-commentary', event = VeryLazy },
	{ 'tpope/vim-surround',   event = VeryLazy },
	{ 'tpope/vim-fugitive',   event = VeryLazy },
	{ 'nvim-orgmode/orgmode', event = VeryLazy },
	{
		"iamcco/markdown-preview.nvim",
		event = VeryLazy,
		build = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
			ft = { "markdown" }
		end
	},
	{ 'jiangmiao/auto-pairs',    event = VeryLazy },
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	},
	'folke/zen-mode.nvim',
	'junegunn/limelight.vim',
	'junegunn/goyo.vim',
	{ 'akinsho/toggleterm.nvim', version = "*",   config = true },
	'ThePrimeagen/vim-be-good',
	{
		"mbbill/undotree",
		cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
	},
	{ 'lewis6991/gitsigns.nvim', event = VeryLazy },
	{ 'szw/vim-maximizer',       event = VeryLazy },
	{ 'nvim-orgmode/orgmode',    event = VeryLazy },
	'nvim-lualine/lualine.nvim',
	'nvim-lua/popup.nvim',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	{ 'gruvbox-community/gruvbox', event = VeryLazy },
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		version = "nightly" -- optional, updated every week. (see issue #1193)
	},
  {'neovim/nvim-lspconfig', lazy=false},
	{ 'junegunn/fzf',              event = VeryLazy },
	{ 'junegunn/fzf.vim',          event = VeryLazy },
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
		end
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"netrw",
			},
		},
	},
})

-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = "VeryLazy",
-- 	callback = function()
-- 		require("keymaps")
-- 		require("commands")
-- 	end,
-- })
