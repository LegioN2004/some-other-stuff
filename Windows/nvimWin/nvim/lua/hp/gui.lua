-- -- Define a fallback for the 'has' function
-- local function has(feature)
--     return vim.fn.has(feature) == 1
-- end

-- -- Use the 'has' function in your configuration
-- if has('gui_running') and vim.g.neovide == nil then
--     -- configure nvim-qt
--   vim.opt.guifont = 'JetBrainsMono NFM:h11'
--   -- vim.cmd([[set winblend=50]])
-- end

if vim.g.neovide == true then
  -- Put anything you want to happen only in Neovide here
  -- vim.o.guifont='FiraCode NF:h11'
  vim.o.guifont='JetBrainsMono NF:h10'
  vim.cmd([[
  "neovide stuff
  " set guifont=JetBrainsMono\ NFM:h10
  "set guifont=JetBrains\ Mono:h10
  let g:neovide_refresh_rate=60
  let g:neovide_refresh_rate_idle=5
  let g:neovide_transparency=0.7
  let g:neovide_cursor_vfx_mode = "railgun"
  let g:neovide_remember_window_size = v:true
  "" let g:neovide_floating_blur_amount_x = 2.0
  "" let g:neovide_floating_blur_amount_y = 2.0
  " noremap <F11> :let g:neovide_fullscreen = !g:neovide_fullscreen<CR>
]])
  vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end

