return {
		--- lsp stuff -------------------------------------------------------------------------
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
				{'neovim/nvim-lspconfig',
						dependencies = {
								"williamboman/mason.nvim",
								opts = {
										ensure_installed = {
												"clangd",
												"lua-language-server",
										},
								},
								'williamboman/mason-lspconfig.nvim',
								'j-hui/fidget.nvim',
								'folke/neodev.nvim',
						},
						-- Autocompletion
						{
								'hrsh7th/nvim-cmp',
								dependencies = {
										'hrsh7th/cmp-buffer' ,
										'hrsh7th/cmp-path' ,
										'saadparwaiz1/cmp_luasnip' ,
										'hrsh7th/cmp-nvim-lsp' ,
										'hrsh7th/cmp-nvim-lua' ,
								},
						},
						-- Snippets
						{'rafamadriz/friendly-snippets'},
				},
            },
				--- lsp stuff -------------------------------------------------------------------------
config = function ()
local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

require("luasnip/loaders/from_vscode").lazy_load()
-- require("luasnip.loaders.from_vscode").lazy_load()

local on_attach = function(client, bufnr)
    -- format on save
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
    end
end

-- for cpp ------------------------------------------
-- to  start ccls server
-- require 'lspconfig'.ccls.setup {}
-- nvim_lsp.ccls.setup { -- whole ccls setup as lsp
--     on_attach = on_attach,
--     filetype = { "c", "cpp", "objc", "objcpp" },
--     cmd = { "ccls" },
--     root_dir = require 'lspconfig'.util.root_pattern(".ccls", ".ccls-cache", "compile-command.json", ".git/", ".hg/",
--         ".clang_complete")
-- }
--
require'lspconfig'.clangd.setup{}
-- capabilities: default capabilities, with offsetEncoding utf-8,
-- cmd: { "clangd" },
-- filetypes: { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
-- root_pattern(
-- 		'.clangd',
-- 		'.clang-tidy',
-- 		'.clang-format',
-- 		'compile_commands.json',
-- 		'compile_flags.txt',
-- 		'configure.ac',
-- 		'.git'
-- ),
-- single_file_support: true
-- for cpp ------------------------------------------

-- lua lsp config
nvim_lsp.sumneko_lua.setup {
		on_attach = on_attach,
		settings = {
				Lua = {
						diagnostics = {
								-- to let the lua server recognize the 'vim' global
								globals = { 'vim' }
						},
						workspace = {
								-- to make the server aware of the Neovim runtime files
								library = vim.api.nvim_get_runtime_file("", true)
						}
				}
		}

}


--- keymaps for the lsp -----------------------------------------------------------------------------
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

--- keymaps for the lsp -----------------------------------------------------------------------------


local servers = { 'clangd', 'sumneko_lua' }
for _, lsp in pairs(servers) do
		require('lspconfig')[lsp].setup {
				on_attach = on_attach,
				flags = {
						debounce_text_changes = 150,
				}
		}
end
}
end
}
