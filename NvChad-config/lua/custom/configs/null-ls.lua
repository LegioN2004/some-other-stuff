local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local b = null_ls.builtins
local s = null_ls.sources

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  -- b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}

local opts = {
  sources = {
    -- python
    null_ls.builtins.diagnostics.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    -- c/cpp
    null_ls.builtins.formatting.clang_format,
    -- go (install these with the go package manager
    null_ls.builtins.formatting.gofunpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    -- web-dev, if null-ls stops working then go for the other todos given in the plugins.lua file
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier,

  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmd({
        group = augroup,
        buffer = bufnr,
      }) 
      vim.api.nvim_clear_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = buffer })
        end,
      })
    end
  end,
}

return opts
