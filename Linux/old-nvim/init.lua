require('core.settings')
require('core.autocmds')

-- lazy stuff start
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
	print("Installing Lazy.nvim close and reopen Neovim...")
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	print("Lazy is not installed")
	return
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup('plugins', {
	ui = {
		border = "rounded",
	},
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = false, -- get a notification when new updates are found
		frequency = 86400, -- check for updates every hour
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = false, -- get a notification when changes are found
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		defaults = { lazy = true },
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			debug = false,
			disabled_plugins = {
				-- "netrw",
				-- "netrwPlugin",
				-- "netrwSettings",
				-- "netrwFileHandlers",
				"gzip",
				"zip",
				"zipPlugin",
				"tar",
				"tarPlugin",
				"getscript",
				"getscriptPlugin",
				"vimball",
				"vimballPlugin",
				"2html_plugin",
				"logipat",
				"rrhelper",
				"spellfile_plugin",
				"matchit",
				"tohtml",
				"matchparen"
			},
		},
	},
})

-- core stufff
require('core.alpha')
require('core.keymaps')
require('core.macros')

vim.cmd([[
" let g:coc_node_path = '~/.nvm/versions/node/v18.15.0/bin/node'
" let g:coc_npm_path = '~/.nvm/versions/node/v18.15.0/bin/node'
" au! BufWritePost $MYVIMRC source %
]])
