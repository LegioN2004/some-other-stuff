call plug#begin('C:\Users\sunny\AppData\Local\nvim\autoload\plugged')

	" Better syntax support
	Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'jiangmiao/auto-pairs'
	Plug 'joshdick/onedark.vim'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'tjdevries/express_line.nvim'
  Plug 'mbbill/undotree'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'szw/vim-maximizer'
  Plug 'j-hui/fidget.nvim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': 'latest' }
call plug#end()
