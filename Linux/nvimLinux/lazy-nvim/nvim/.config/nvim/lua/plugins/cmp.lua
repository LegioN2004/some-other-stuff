return {
	-- Autocompletion engine
	{ "hrsh7th/nvim-cmp" }, -- Required
	{ "hrsh7th/cmp-nvim-lsp" }, -- Required
	{ "hrsh7th/cmp-vsnip" }, -- Required
	{ "hrsh7th/cmp-buffer" }, --  Optional
	{ "hrsh7th/cmp-path" }, --  Optional
	{ "hrsh7th/cmp-nvim-lua" }, --  Optional
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip" }, -- Set of preconfigured snippets for different languages.
	},
}
