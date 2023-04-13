vim.cmd('autocmd!')

vim.opt.list = false
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true --Switch on search pattern highlighting.
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
-- vim.opt.expandtab = true
-- vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
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
vim.opt.termguicolors = true
vim.opt.ai = true -- always set autoindenting on
vim.opt.si = true -- smart indent
vim.opt.wildmenu = true
vim.opt.showmatch = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.cmdheight=2 --give more space for displaying messages.
vim.opt.smartindent = true
vim.opt.ruler = true
-- vim.opt.clipboard=unnamed,unnamedplus -- set clipboard to universal for easy copy/paste to diff apps
vim.opt.completeopt = menuone, noinsert, noselect --as required by nvim-cmp
vim.opt.hidden = true                             --This option allows you to switch between multiple buffers without saving a changed buffer
vim.opt.mousehide = true                          --Hide the mouse pointer while typing.
vim.opt.updatetime = 50                           --updatetime
-- vim.opt.timeoutlen = 300

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = '*',
	command = 'set nopaste'
})

vim.opt.formatoptions:append { 'r' }

-- vim.opt.guicursor = ""
-- copy to clipboard
-- vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Always change the directory to working directory of file in current buffer
vim.cmd([[
let g:session_autosave = 'no'
"set listchars=eol:⏎,tab:\ \ ┊,trail:●,extends:…,precedes:…,space:·
" set listchars=tab:\ \ ┊,trail:,extends:…,precedes:…,space:

" Always change the directory to working directory of file in current buffer - http://vim.wikia.com/wiki/VimTip64
" set autochdir
"autocmd BufEnter * call CHANGE_CURR_DIR()
"function! CHANGE_CURR_DIR()
"   let _dir = expand("%:p:h")
"   exec "cd " . _dir
"   unlet _dir
"endfunction

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" format on save with coc-prettier
"" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"let s:coc_extensions = [
"\   'coc-css',
"\  'coc-sumneko-lua',
"\  'coc-lightbulb',
"\  'coc-clangd',
"\  'coc-html',
"\  'coc-htmlhint',
"\  'coc-emmet',
"\  'coc-eslint',
"\  'coc-prettier'
"]

"just to make those backup files in another directory so as to not make a mess
set swapfile
set backup
set undofile
set directory=~/nvimfiles/swap//
set backupdir=~/nvimfiles/backup//
set undodir=~/nvimfiles/undo//

set mouse=a

let g:netrw_banner=0        " disable annoying banner
"let g:netrw_browse_split=4  " open in prior window
"let g:netrw_altv=1          " open splits to the right
"let g:netrw_liststyle=3     " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" limelight stuff
let g:limelight_conceal_ctermfg=244

"markdown stuff
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='~/ghq/github.com/sindresorhus/github-markdown-css/github-markdown-dark.css'

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
})
