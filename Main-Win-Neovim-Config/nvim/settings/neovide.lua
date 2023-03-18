if vim.g.neovide == true then
	-- vim.o.guifont='FiraCode NF:h14'
	vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
vim.cmd([[
"neovide stuff
if exists("g:neovide")   " Put anything you want to happen only in Neovide here
	"set guifont=Hack\ NF:h10
  set guifont=JetBrainsMono\ NF:h12
	lt g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	let g:neovide_transparency=5.9
	let g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	"let g:neovide_cursor_vfx_mode = "railgun"
	let g:neovide_remember_window_size = v:true
	"let g:neovide_floating_blur_amount_x = 2.0
	"let g:neovide_floating_blur_amount_y = 2.0
endif
]])
