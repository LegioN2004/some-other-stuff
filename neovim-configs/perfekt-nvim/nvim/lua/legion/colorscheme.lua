<<<<<<< HEAD
vim.cmd [[if exists("&termguicolors") && exists ("&winblend")
syntax enable
set termguicolors
set winblend=0 
set wildoptions=pum
"{} set plumblend=5
set background=dark
colorscheme onedark 
""runtime ./colors/NeoSolarized.vim
""colorscheme NeoSolarized
]]

-- To enable transparency
-- if vim.fn.has('gui_running') == 0 then
-- 	vim.g.solarized_termtrans = 0
-- else
-- 	vim.g.solarized_termtrans = 1
-- end
=======
vim.cmd [[if exists("&termguicolors") && exists ("&winblend")
syntax enable
set termguicolors
set winblend=0 
set wildoptions=pum
"{} set plumblend=5
set background=dark

runtime ./colors/NeoSolarized.vim
colorscheme NeoSolarized
]]

-- To enable transparency
if vim.fn.has('gui_running') == 0 then
	vim.g.solarized_termtrans = 0
else
	vim.g.solarized_termtrans = 1
end
>>>>>>> f1e99bb65a2a64ba7429a196a880f68561cd241d
