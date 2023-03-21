if exists("g:neovide")   " Put anything you want to happen only in Neovide here
"neovide stuff
	"set guifont=Hack\ NF:h10
  set guifont=JetBrainsMono\ NF:h12
	let g:neovide_refresh_rate_idle=5
	let g:neovide_transparency=1.9
	let g:neovide_refresh_rate=60
	let g:neovide_refresh_rate_idle=5
	"let g:neovide_cursor_vfx_mode = "railgun"
	let g:neovide_remember_window_size = v:true
  nnoremap <F11> :let g:neovide_fullscreen = !g:neovide_fullscreen<CR>
endif
