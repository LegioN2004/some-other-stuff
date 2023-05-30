vim.cmd("autocmd!")

vim.opt.list = true
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true -- set line numbers to show on the LHS

vim.opt.title = true -- auto setting of the window title for the terminal or console emulator in which nvim is running
vim.opt.autoindent = true -- controls whether or not Vim should automatically adjust the indentation of newly entered lines to match the indentation of the previous line
vim.opt.hlsearch = true -- Switch on search pattern highlighting.
vim.opt.showcmd = true -- to display the command you are currently typing in the lower right-hand corner
vim.opt.laststatus = 2 -- shows if the status line will be displayed or not considering the no of windows available and the nos 0,1,2 are options regarding the windows
vim.opt.expandtab = true -- converts tabs to spaces, to ensure consistent formatting and prevent layout issues
vim.opt.scrolloff = 10 -- how many line to move above and below the cursor while moving it
vim.opt.shell = "fish" -- set shell
vim.opt.smarttab = true -- makes vim insert spaces instead of tabs for indenting
vim.opt.tabstop = 4 -- no of spaces that should be used to represent a tab character
vim.opt.softtabstop = 4 -- the no of spaces that should be inserted when you press the Tab key, if expandtab is enabled.
vim.opt.shiftwidth = 2 -- the number of spaces that should be inserted when you press the Tab key, if expandtab is enabled.
vim.opt.inccommand = "split" -- to split the buffer with the buffer showing the diff when doing a search replace or some other stuff
vim.opt.ignorecase = true -- ignores letter cases
vim.opt.breakindent = true -- This option indents wrapped lines to visually distinguish them from new lines.
vim.opt.incsearch = true -- incremental search This option makes Vim highlight matches as you type them during search.
vim.opt.smartcase = true -- This option makes searches case-insensitive unless the search pattern contains uppercase characters.
vim.opt.backspace = "start,eol,indent" -- This option specifies which characters can be deleted with the Backspace key , inside the quotes are different types chatgipitty it
vim.opt.path:append({ "**" }) -- while finding files it also looks in the subfolders
-- inbuilt command completion neovim stuff
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full:full"
vim.opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*DS_STORE,*.db,*/node_modules/*"

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = false
vim.opt.ai = true -- always set autoindenting on
vim.opt.si = true -- smart indent
vim.opt.showmatch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.ruler = false
-- vim.opt.clipboard=unnamed,unnamedplus -- set clipboard to universal for easy copy/paste to diff apps
-- vim.opt.completeopt = "menuone,noinsert,noselect"  -- old -- as required by nvim-cmp
vim.opt.completeopt = "menu,menuone,noselect" --as required by nvim-cmp
vim.opt.hidden = true --This option allows you to switch between multiple buffers without saving a changed buffer
vim.opt.mousehide = true --Hide the mouse pointer while typing.
vim.opt.updatetime = 50 --updatetime
-- vim.opt.timeoutlen = 300

-- Undercurl stuff
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

vim.opt.formatoptions:append({ "r" })

-- vim.opt.guicursor = ""
-- copy to clipboard
-- vim.api.nvim_set_option("clipboard", "unnamedplus")

--highlights in the after/plugin/colorscheme.lua

vim.opt.foldlevel = 99
vim.o.foldcolumn = "1"
-- vim.o.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "/",
	eob = " ",
}
vim.opt.mousemoveevent = true
-- command completion
vim.opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*DS_STORE,*.db"

vim.opt.list = true
vim.opt.listchars = "tab:>⋅,eol:⏎,trail:●,extends:▷,precedes:◁,nbsp:␣"

--- for noice.nvim stuff ---------------
vim.opt.cmdheight = 1
----new
---- Reduce command line messages since we can't see them properly anyway with
---- cmdheight = 0
--vim.opt.shortmess:append("C")
---- vim.opt.shortmess:append("S") -- We have our own search counter
--vim.opt.shortmess:append("c")
--vim.opt.shortmess:append("s")
----------------------------------------

vim.opt.shiftround = true -- Round indent
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.pumheight = 10 -- Maximum number of entries in a popup

vim.opt.autowrite = true -- Enable auto write
vim.opt.conceallevel = 3 -- Hide * markup for bold and italic
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
-- vim.opt.format = "jcroqlnt" -- tcqj
-- hello
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
vim.opt.winminwidth = 5 -- Minimum window width

if vim.fn.has("nvim-0.9.0") == 1 then
	vim.opt.splitkeep = "screen"
	vim.opt.shortmess:append({ C = true })
end

vim.cmd([[
filetype plugin on
let g:session_autosave = 'no'
"set listchars=eol:⏎,tab:\ \ ┊,trail:●·,extends:…,precedes:…,space:·
"set listchars=tab:\ \ ┊,trail:,extends:…,precedes:…,space:

if (exists('+colorcolumn'))
set colorcolumn=80
highlight ColorColumn ctermbg=9
endif

" format on save with coc-prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

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

"modifiable" setting turned on, to not prevent the "VeryLazy" autocommand  and other autocmds from being executed.
set modifiable
set buftype=
]])

-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_gem_provider = 0
-- vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
