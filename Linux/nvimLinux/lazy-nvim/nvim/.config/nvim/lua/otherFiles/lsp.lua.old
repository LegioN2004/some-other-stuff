return {
	{
		'neovim/nvim-lspconfig',
		event = "BufReadPre",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
			'j-hui/fidget.nvim',
			'folke/neodev.nvim',
			{'rafamadriz/friendly-snippets'},
		},
		{
			{
				"williamboman/mason.nvim",
				build = ":MasonUpdate" -- :MasonUpdate updates registry contents
			},
			'hrsh7th/nvim-cmp',
			event = "InsertEnter",
			dependencies = {
				'hrsh7th/cmp-nvim-lsp' ,
				'hrsh7th/cmp-buffer' ,
				'hrsh7th/cmp-path' ,
				'hrsh7th/cmp-cmdline' ,
				'saadparwaiz1/cmp_luasnip' ,
				'L3MON4D3/LuaSnip',
				{'rafamadriz/friendly-snippets'},
			},
		},
		-- Snippets
	},
	config = function(_, _)
		local utils = require("utils")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		local lsp_utils = require("plugins.lsp.lsp-utils")
		lsp_utils.setup()
		mason_lspconfig.setup({
			ensure_installed = utils.lsp_servers,
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					on_attach = lsp_utils.on_attach,
					capabilities = lsp_utils.capabilities,
				})
			end,
			-- ["pyright"] = function()
			-- 	lspconfig.pyright.setup({
			-- 		on_attach = lsp_utils.on_attach,
			-- 		capabilities = lsp_utils.capabilities,
			-- 		settings = {
			-- 			python = {
			-- 				analysis = {
			-- 					typeCheckingMode = "off",
			-- 				},
			-- 			},
			-- 		},
			-- 	})
			-- end,
			["clangd"] = function()
				local capabilities_cpp = lsp_utils.capabilities
				capabilities_cpp.offsetEncoding = { "uts-16" }
				lspconfig.clangd.setup({
					on_attach = lsp_utils.on_attach,
					capabilities = capabilities_cpp,
				})
			end,
		})
	end,

	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup({
			on_attach = lsp_utils.on_attach,
			capabilities = lsp_utils.capabilities,
			settings = {
				Lua = {
					diagnostics = {
						-- to let the lua server recognize the 'vim' global
						globals = { 'vim' }
					},
					workspace = {
						-- to make the server aware of the Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true)
					},
				},
	},
})
end,

	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {
			pip = {
				upgrade_pip = true,
			},
ui = {
	border = "rounded",
icons = {
					package_installed = "✓",
package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local utils = require("utils")
			local mr = require("mason-registry")
			local packages = utils.mason_packages
			local function ensure_installed()
				for _, package in ipairs(packages) do
					local p = mr.get_package(package)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
}
