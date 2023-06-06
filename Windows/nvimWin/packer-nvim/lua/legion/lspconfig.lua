local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local luasnip = require('luasnip')
require("luasnip/loaders/from_vscode").lazy_load()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
})
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup {
		snippet = {
				expand = function(args)
						luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
		},
		formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
						vim_item.menu = ({
								luasnip = "[Snippet]",
								nvim_lsp = "[LSP]",
								buffer = "[Buffer]",
								path = "[Path]",
						})[entry.source.name]
						return vim_item
				end,
		},
		sources = {
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "orgmode" },
		},
		confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
		},
		window = {
				documentation = {
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				},
		},
		experimental = {
				ghost_text = false,
				native_menu = false,
		},
}

lsp.setup_nvim_cmp({
		mapping = cmp_mappings
})

lsp.set_preferences({
		suggest_lsp_servers = false,
		sign_icons = {
				error = "",
				warn = "",
				hint = "",
				info = "",
		},
})

lsp.on_attach(function(client, bufnr)
		local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vof", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '<leader>vsl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "gI", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "gr", function() require("telescope.builtin").lsp_references() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", "<leader>ds", function() require('telescope.builtin').lsp_document_symbols() end, opts)
  vim.keymap.set("n", "<leader>ws", function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end, opts)
  vim.keymap.set("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, opts)
  vim.keymap.set("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, opts)
  vim.keymap.set("n", "<leader>wl", '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vld", function() vim.lsp.diagnostic.show_line_diagnostics() end, opts)
  vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.formatting() end, opts)
  vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>jca", "<cmd>lua require(\'jdtls\').code_action()<CR>", {silent = true})
end)

lsp.setup()

vim.diagnostic.config({
		virtual_text = {
				prefix = "●",
				severity_sort = true,
		},
		float = {
				border = "rounded",
				source = "always", -- Or "if_many"
				prefix = " - ",
		},
		severity_sort = true,
})
