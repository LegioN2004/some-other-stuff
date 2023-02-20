-- vim.opt.guicursor = "" to get a block cursor
vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>e", vim.cmd.Lex)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n" , "<leader>un" , vim.cmd.UndotreeToggle)
vim.keymap.set("n" , "<leader>te" , vim.cmd.Telescope)

vim.cmd([[
"" nnoremap ;f <Esc>:Lex<CR>:vertical resize 30<CR><CR>
 nnoremap ;f <Esc>:NvimTreeToggle<CR>:vertical resize 30<CR><CR>
let g:netrw_liststyle = 3

"sessions management
nnoremap <leader>mk :mksession ~/.nvim/sessions/
nnoremap <leader>so :so ~/.nvim/sessions/

"tab movement
nmap <tab> :tabnext<Return>
nmap <S-tab> :tabprevious<Return>

"some keybinds for convenience
nmap tw :w!<cr>
nmap twq :wq!<cr>
nmap ts  :so %<cr>
nmap tqa :qa!<cr>
nnoremap tq :q!<cr>
nmap ts :so %<cr>
" vnoremap <C-c> "*y

"some windows keybinds
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
nmap tn :tabnew<Return><C-w>w

"tab movement
nmap <tab> :tabnext<Return>
nmap <S-tab> :tabprevious<Return>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"for resizing windows 
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

"fzf keymaps
noremap <leader>fr :History<CR>

"sessions management
nnoremap <leader>mk :mksession ~/.nvim/sessions/
nnoremap <leader>so :so ~/.nvim/sessions/

nnoremap <leader>my :e $MYVIMRC<CR>
nnoremap <leader>e :Ex<CR>

" -- from ThePrimeagen ---------------------------------------------------------------------------------------------------------
" going up and down with cursor in the center of the buffer
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap n nzzzv
nnoremap N Nzzzv

]])