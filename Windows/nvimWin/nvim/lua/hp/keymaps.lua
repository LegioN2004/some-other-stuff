local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- local keymap = vim.keymap -- for the keymap vim.keymap.set use keymap and single quotes only for the specifying key

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--dont yank  with x
--vim.keymap.set('n', 'x', '"_x')

--increment / decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- delete a word backwords
-- vim.keymap.set('n', '<C-w>', 'vb"_d')
-- vim.keymap.set('n', 'dw', 'vb"_d')

-- select all text at once
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- -- keybinds for easier saving and quitting
keymap("n", "tw", ":w!<CR>", opts)
keymap("n", "tq", ":q!<CR>", opts)
keymap("n", "tqa", ":qa!<CR>", opts)
keymap("n", "twq", ":wq!<CR>", opts)
keymap("n", "ts", ":so<CR>", opts)

vim.keymap.set("n", "<leader>te", ":Telescope<CR>")
--splitting windows
vim.keymap.set("n", "sv", "<c-w>v", { silent = true })
vim.keymap.set("n", "sh", "<c-w>s", { silent = true })
vim.keymap.set("n", "sx", ":close<cr>", { silent = true })

--(window keybinds) new tab
keymap("n", "tn", ":tabnew<Return><C-w>w", opts)

--tab movement
keymap("n", "<tab>", ":tabnext<Return>", opts)
keymap("n", "<S-tab>", ":tabprevious<Return>", opts)

--tab movement
keymap("n", "<leader><tab>", ":bnext<Return>", opts)
keymap("n", "<leader><S-tab>", ":bprevious<Return>", opts)
-- keymap("n", "bn", ":bnext<Return>", opts)
-- keymap("n", "bp", ":bprevious<Return>", opts)
-- keymap("n", "bd", ":bdelete<Return>", opts)

--better movement between splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- from ThePrimeagen ------------------------------------------

-- best remap from the ThePrimeagen
-- greatest remap ever
vim.keymap.set("x", "<leader>p", '"_dP')

-- Paste from clipboard.
-- vim.keymap.set({ 'n', 'x' }, 'cp', '"+y')
-- vim.keymap.set({ 'n', 'x' }, 'cv', '"+p')

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- half page up/down with centered view
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- searching forward or back with half page up/down
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

------------------------------------------------------------------

-- shortcuts for commenting
vim.keymap.set("n", "<leader>/", ":Commentary<CR>")
vim.keymap.set("v", "<leader>/", ":Commentary<CR>")

-- undotree keymaps
vim.keymap.set("n", "<leader>un", ":UndotreeToggle<cr>")

-- maximizer keymap
vim.keymap.set("n", "<leader>mt", ":MaximizerToggle<cr>")

-- open init.lua file
vim.keymap.set("n", "<leader>my", ":e $MYVIMRC<cr>")

-- modify x to delete text without changing the internal registers.
vim.keymap.set({ 'n', 'x' }, 'x', '"_x')

vim.keymap.set("n", ";f", require("oil").open, { desc = "Open parent directory" })

vim.cmd([[
"fzf keybindings
nnoremap <silent> <leader>fzf :FZF ~<cr>
"nnoremap <silent> <leader>fr :History<CR>
nnoremap <silent> <leader>ff :e %:h/<C-d>
nnoremap <silent> <leader>fi :FZF /home/sunny/ghq/github.com/legion2004/programs/ <cr>
nnoremap <silent> <leader>dot :FZF /home/sunny/dotfiles/ <cr>
"open files from the home folder
"nnoremap <silent> <leader>hot :FZF~ <cr>

"better tabbing
vnoremap < <gv
vnoremap > >gv

"toggle fugitive
nnoremap <leader>gs :Git<CR>

"sessions management
nnoremap <leader>mk :mksession ~/nvimfiles/sessions/
nnoremap <leader>so :so ~/nvimfiles/sessions/

"xolox-vim-sessions management
let g:session_directory = "~/nvimfiles/xolox-vim-sessions"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"nnoremap ;f <Esc>:Lex<CR>:vertical resize 30<CR><CR>
"nnoremap <leader>ex <Esc>:Ex<CR>
""let g:netrw_liststyle = 3
"let g:netrw_banner=0        " disable annoying banner

" NvimTreeToggle remap
" nnoremap ;f <Esc>:NvimTreeToggle<CR>:vertical resize 30<CR><CR>

"checkout and fix these fzf keybinds
" PLUGIN: FZF
"nnoremap <silent> <Leader>b :Buffers<CR>
"nnoremap <silent> <Leader>rg :Rg<CR> "ripgrep grep lines
"nnoremap <silent> <Leader>ag :Ag<CR> "project finder
"nnoremap <silent> <Leader>/ :BLines<CR> "line finder
"nnoremap <silent> <Leader>/ :Lines<CR> "line finder
"nnoremap <silent> <Leader>' :Marks<CR> "marked files find
"nmap <Leader>t :BTags<CR>  "tag finder
"nmap <Leader>T :Tags<CR>   "search for tags across project
"nnoremap <silent> <Leader>g :Commits<CR>
"nnoremap <silent> <Leader>H :Helptags<CR> "help finder
"nnoremap <silent> <Leader>hh :History<CR> "history finder
"nnoremap <silent> <Leader>h: :History:<CR> "history finder
"nnoremap <silent> <Leader>h/ :History/<CR> "history finder
"nnoremap <silent> <Leader>h/ :Maps<CR> "mappings finder
"nnoremap <silent> <Leader>h/ :Commands<CR> "commands finder
"nnoremap <silent> <Leader>h/ :Filetypes<CR> "Filetypes finder

"set grep to ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" for fish use this to use fzf :set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
" for bash/zsh use this export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
" and remove the upper lines

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
]])

-- new stufff from the lazyvim config --------------------------------------------------------

--local Util = require("lazyvim.util")

--local function map(mode, lhs, rhs, opts)
--	local keys = require("lazy.core.handler").handlers.keys
--	---@cast keys LazyKeysHandler
--	-- do not create the keymap if a lazy keys handler exists
--	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
--		opts = opts or {}
--		opts.silent = opts.silent ~= false
--		vim.keymap.set(mode, lhs, rhs, opts)
--	end
--end

---- better up/down
--map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

---- Move Lines
--map("n", "<S-down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
--map("n", "<S-up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
--map("i", "<S-down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
--map("i", "<S-up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
--map("v", "<S-down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
--map("v", "<S-up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

---- buffers
--if Util.has("bufferline.nvim") then
--	-- map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
--	-- map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
--	map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
--	map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
--else
--	-- map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
--	-- map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
--	map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
--	map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
--end
--map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
--map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

---- Clear search with <esc>
--map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

---- Clear search, diff update and redraw
---- taken from runtime/lua/_editor.lua
--map(
--	"n",
--	"<leader>ur",
--	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--	{ desc = "Redraw / clear hlsearch / diff update" }
--)

--map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

---- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
---- map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
---- map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
---- map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
---- map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
---- map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
---- map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

---- Add undo break-points
--map("i", ",", ",<c-g>u")
--map("i", ".", ".<c-g>u")
--map("i", ";", ";<c-g>u")

---- save file
----map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

---- lazy
--map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

---- new file
--map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

--map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
--map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

--if not Util.has("trouble.nvim") then
--	map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
--	map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
--end

---- stylua: ignore start

---- toggle options
--map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
--map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
--map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
--map("n", "<leader>ul", function()
--	Util.toggle("relativenumber", true)
--	Util.toggle("number")
--end, { desc = "Toggle Line Numbers" })
--map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
--local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
--map("n", "<leader>uc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end,
--	{ desc = "Toggle Conceal" })

---- lazygit
--map("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false }) end,
--	{ desc = "Lazygit (root dir)" })
--map("n", "<leader>gG", function() Util.float_term({ "lazygit" }, { esc_esc = false }) end, { desc = "Lazygit (cwd)" })

---- quit
--map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

---- highlights under cursor
--if vim.fn.has("nvim-0.9.0") == 1 then
--	map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
--end

---- floating terminal
---- map("n", "<leader>ft", function() Util.float_term(nil, { cwd = Util.get_root() }) end, { desc = "Terminal (root dir)" })
---- map("n", "<leader>fT", function() Util.float_term() end, { desc = "Terminal (cwd)" })
---- map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

---- windows
--map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
--map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })

---- tabs
--map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
--map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
--map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
