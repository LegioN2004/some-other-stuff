local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed ({
    'clangd' ,
    'lua_ls' ,
})

-- rust stuff from here https://sharksforarms.dev/posts/neovim-rust/ ----------------------------------------------

-- nvim-lspconfig rust configuration
-- local lspconfig = require('lspconfig')
-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}
-- lspconfig.rust_analyzer.setup {
--   -- Server-specific settings. See `:help lspconfig-setup`
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }



-- local function on_attach(client, buffer)
--   -- This callback is called when the LSP is atttached/enabled for this buffer
--   -- we could set keymaps related to LSP, etc here.
-- end


-- local opts = {
--     tools = {
--         runnables = {
--             use_telescope = true,
--         },
--         inlay_hints = {
--             auto = true,
--             show_parameter_hints = false,
--             parameter_hints_prefix = "",
--             other_hints_prefix = "",
--         },
--     },
--     server = {
--         -- on_attach is a callback called when the language server attachs to the buffer
--         on_attach = on_attach,
--         settings = {
--             -- to enable rust-analyzer settings visit:
--             -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
--             ["rust-analyzer"] = {
--                 -- enable clippy on save
--                 checkOnSave = {
--                     command = "clippy",
--                 },
--             },
--         },
--     },
-- }
-------------------------------------------------------------------------------------------------------------------------------


-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
	Lua = {
	  diagnostics = {
		-- Get the language server to recognize the `vim` global
		globals = { "vim" },
	  },
	  workspace = {
		-- Make the server aware of Neovim runtime files
		-- library = 
		library = {
          vim.api.nvim_get_runtime_file("", true),
		  vim.fn.stdpath("config"),
		},
		checkThirdParty = false,
	  },
	  -- Do not send telemetry data containing a randomized but unique identifier
	  telemetry = {
		enable = false,
	  },
	},
  },
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
	error = '',
	warn = '',
	hint = '',
	info = ''
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vac", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
