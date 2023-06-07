vim.cmd([[
let g:fzf_action = {
\    'ctrl-t': 'tab-split',
\    'ctrl-h': 'split',
\   'ctrl-v': 'vsplit', }

let g:fzf_preview_window = ['right,80%', 'ctrl-/']
" --multi --preview
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
\   fzf#vim#with_preview(), <bang>0)
]])
