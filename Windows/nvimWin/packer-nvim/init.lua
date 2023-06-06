require('legion.plugins')
require('legion.alpha-startup')
require('legion.lspconfig')
require('legion.lualine')
-- require('legion.macros')
require('legion.nvim-tree')
require('legion.settings')
require('legion.keymaps')
require('legion.telescope')
require('legion.toggleterm')
require('legion.treesitter')
require('legion.gitsigns')

vim.cmd([[
let g:coc_node_path = '~/.nvm/versions/node/v18.15.0/bin/node'
let g:coc_npm_path = '~/.nvm/versions/node/v18.15.0/bin/node'
au! BufWritePost $MYVIMRC source %
]])
