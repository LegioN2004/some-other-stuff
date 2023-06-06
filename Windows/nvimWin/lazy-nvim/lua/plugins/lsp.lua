return {
	-- LSP Support
	{ 'neovim/nvim-lspconfig' },

	-- Autocompletion
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-nvim-lua' },

	-- Snippets
	{ 'L3MON4D3/LuaSnip' },
	{ 'rafamadriz/friendly-snippets' },
	{ "mfussenegger/nvim-jdtls",          ft = "java" },

	-- lsp servers
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'williamboman/mason.nvim',}
}