local plugins = {
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			require("plugins.languageConfigs.pyright").load_mappings("dap_python")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		ft = { "python" },
		opts = function()
			local null_ls = require('null-ls')
			local opts = {
				sources = {
					null_ls.builtins.diagnostics.mypy,
					null_ls.builtins.diagnostics.ruff,
				},
			}
		end
	},
}
return plugins
