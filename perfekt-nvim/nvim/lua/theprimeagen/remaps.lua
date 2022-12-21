-- vim.opt.guicursor = "" to get a block cursor
vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>e", vim.cmd.Lex)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n" , "<leader>un" , vim.cmd.UndotreeToggle)

vim.cmd([[
 nnoremap <leader>e <Esc>:Lex<CR>:vertical resize 30<CR><CR>
 let g:netrw_liststyle = 3

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

 map s<left> <C-w>h
 map s<up> <C-w>k
 map s<down> <C-w>j
 map s<right> <C-w>l
 map sh <C-w>h
 map sl <C-w>l
 map sj <C-w>j
 map sk <C-w>k

 "for resizing windows 
 nmap <C-w><left> <C-w><
 nmap <C-w><right> <C-w>>
 nmap <C-w><up> <C-w>+
 nmap <C-w><down> <C-w>-

 "fzf keymaps
 noremap <leader>fr :History<CR>
 ]])
