vim.cmd('autocmd!')

vim.opt.list = false
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = false --Switch on search pattern highlighting.
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
-- vim.opt.expandtab = true
-- vim.opt.scrolloff = 10
-- vim.opt.shell = 'zsh'
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.breakindent = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- while finding files it also looks in the subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.ai = true -- always set autoindenting on
vim.opt.si = true -- smart indent
vim.opt.showmatch = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.cmdheight=2 --give more space for displaying messages.
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.ruler = true
vim.opt.mouse = a
-- vim.opt.clipboard=unnamed,unnamedplus -- set clipboard to universal for easy copy/paste to diff apps
vim.opt.hidden = true --This option allows you to switch between multiple buffers without saving a changed buffer
vim.opt.mousehide = true --Hide the mouse pointer while typing.
vim.opt.updatetime = 50 --updatetime

-- turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = '*',
	command = 'set nopaste'
})

vim.opt.formatoptions:append { 'r' }
-- vim.opt.signcolumn = yes
-- Undo and backup options
vim.opt.backup = false
vim.opt.writebackup = false
-- vim.opt.undofile = true
vim.opt.swapfile = false

-- for colors to render correctly
vim.opt.termguicolors = true


-- Always change the directory to working directory of file in current buffer
vim.cmd([[
set signcolumn=yes
set mouse=a
" Always change the directory to working directory of file in current buffer - http://vim.wikia.com/wiki/VimTip64
" autocmd BufEnter * call CHANGE_CURR_DIR()
" function! CHANGE_CURR_DIR()
" let _dir = expand("%:p:h")
" exec "cd " . _dir
" unlet _dir
" endfunction
let g:netrw_banner=0        " disable annoying banner

if (exists('+colorcolumn'))
	set colorcolumn=80
	highlight ColorColumn ctermbg=9
	endif

	set undofile
	let &undodir = expand('~/nvimfiles/undo')

	if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
		]])

		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		local yank_group = augroup('HighlightYank', {})
		autocmd('TextYankPost', {
			group = yank_group,
			pattern = '*',
			callback = function()
				vim.highlight.on_yank({
					higroup = 'IncSearch',
					timeout = 40,
				})
			end,
		}
)



