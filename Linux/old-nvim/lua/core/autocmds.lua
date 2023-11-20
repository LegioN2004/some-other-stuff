local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- disable statusline in dashboard
autocmd("FileType", {
	pattern = "alpha",
	callback = function()
		vim.opt.laststatus = 0
	end,
})

autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.opt.statusline = "%#normal# "
	end,
})

autocmd("FileType", {
	pattern = { "gitcommit", "markdown", "org", "gitignore" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- highlight when yanked with a very fast
local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- autoformat from lsp
-- local format_sync_grp = vim.api.nvim_create_augroup("Format", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = { "*.rs", "*.cpp", "*.html", "*.java", "*.lua", "*.vim", "*.css"},
-- 	callback = function()
-- 		vim.lsp.buf.format({ timeout_ms = 200 })
-- 	end,
-- 	group = format_sync_grp,
-- })

--vim.cmd([[
--" Always change the directory to working directory of file in current buffer - http://vim.wikia.com/wiki/VimTip64
--" set autochdir
--"autocmd BufEnter * call CHANGE_CURR_DIR()
--"function! CHANGE_CURR_DIR()
--"   let _dir = expand("%:p:h")
--"   exec "cd " . _dir
--"   unlet _dir
--"endfunction
--]]

-- close lazy panel with esc
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lazy",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- from the LazyVim repo
-- This file is automatically loaded by plugins.init

local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	command = "checktime",
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- go to last loc when opening a buffer
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   group = augroup("last_loc"),
--   callback = function()
--     local mark = vim.api.nvim_buf_get_mark(0, '"')
--     local lcount = vim.api.nvim_buf_line_count(0)
--     if mark[1] > 0 and mark[1] <= lcount then
--       pcall(vim.api.nvim_win_set_cursor, 0, mark)
--     end
--   end,
-- })

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   group = augroup("auto_create_dir"),
--   callback = function(event)
--     if event.match:match("^%w%w+://") then
--       return
--     end
--     local file = vim.loop.fs_realpath(event.match) or event.match
--     vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
--   end,
-- })

-- new stuff
-- vim.cmd([[
-- augroup Telescope
-- autocmd!
-- autocmd FileType TelescopePrompt let g:AutoPairsEnable = 0
-- augroup END
-- ]])

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
autocmd("InsertEnter", {
	callback = function()
		vim.opt.relativenumber = false
	end,
})
autocmd("InsertLeave", {
	callback = function()
		vim.opt.relativenumber = true
	end,
})

-- Open a file from its last left off position
autocmd("BufReadPost", {
	callback = function()
		if
			not vim.fn.expand("%:p"):match(".git")
			and vim.fn.line("'\"") > 1
			and vim.fn.line("'\"") <= vim.fn.line("$")
		then
			vim.cmd("normal! g'\"")
			vim.cmd("normal zz")
		end
	end,
})

-- File extension specific tabbing
-- autocmd("Filetype", {
--    pattern = "python",
--    callback = function()
--       vim.opt_local.expandtab = true
--       vim.opt_local.tabstop = 4
--       vim.opt_local.shiftwidth = 4
--       vim.opt_local.softtabstop = 4
--    end,
-- })

-- Enable spellchecking in markdown, text and gitcommit files
autocmd("FileType", {
	pattern = { "gitcommit", "markdown", "text" },
	callback = function()
		vim.opt_local.spell = true
	end,
})
