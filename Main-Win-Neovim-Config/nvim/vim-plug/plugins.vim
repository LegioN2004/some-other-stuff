call plug#begin('C:\Users\sunny\AppData\Local\nvim\autoload\plugged')

Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tjdevries/express_line.nvim'
Plug 'mbbill/undotree'
Plug 'lewis6991/gitsigns.nvim'
Plug 'szw/vim-maximizer'
Plug 'j-hui/fidget.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': 'latest' }
Plug 'lewis6991/impatient.nvim'

" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'hrsh7th/cmp-buffer'       " Optional
Plug 'hrsh7th/cmp-path'         " Optional
Plug 'saadparwaiz1/cmp_luasnip' " Optional
Plug 'hrsh7th/cmp-nvim-lua'     " Optional

"  Snippets
Plug 'L3MON4D3/LuaSnip'             " Required
Plug 'rafamadriz/friendly-snippets' " Optional
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}
Plug 'nvim-treesitter/nvim-treesitter'  " Better syntax support
Plug 'mfussenegger/nvim-jdtls' "java lsp
call plug#end()
