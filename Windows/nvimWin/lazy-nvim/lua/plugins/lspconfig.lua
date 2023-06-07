return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true,
    config = function()
      require('lsp-zero.settings').preset("recommended")
    end
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
      -- { 'saadparwaiz1/cmp_luasnip' },
      -- { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      local icons = require("core.icons")
      require('lsp-zero.cmp').extend()

      local luasnip = require('luasnip')
      require("luasnip.loaders.from_vscode").lazy_load()
      luasnip.config.setup {}

      local lsp = require("lsp-zero")
      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      -- local cmp_action = require('lsp-zero.cmp').action()
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })
      cmp_mappings['<Tab>'] = nil
      cmp_mappings['<S-Tab>'] = nil

      lsp.setup_nvim_cmp({
        mapping = cmp_mappings
      })

      -- lsp.set_preferences({
      --   suggest_lsp_servers = false,
      --   sign_icons = {
      --     error = "",
      --     warn = "",
      --     hint = "",
      --     info = "",
      --   },
      -- })

      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      cmp.setup({
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end
        },
        sources = {
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          -- { name = "orgmode" },
        },
        -- formatting = {
        --   fields = { "kind", "abbr", "menu" },
        --   format = function(entry, vim_item)
        --     vim_item.menu = string.format("%s", icons[vim_item.menu])
        --     vim_item.menu = ({
        --       luasnip = icons.kind.Snippet,
        --       nvim_lsp = "[LSP]",
        --       path = icons.kind.File,
        --       buffer = icons.kind.Key,
        --     })[entry.source.name]
        --     return vim_item
        --   end,
        -- },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        window = {
          documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            max_height = 24,
            max_width = 106,
            winhighlight = "FloatBorder:NormalFloat"
          }
        },
      })

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
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
      {
        'williamboman/mason.nvim',
        build = ":MasonUpdate",
      },
    },
    config = function()
      -- This is where all the LSP shenanigans will live

      local lsp = require('lsp-zero')

      lsp.on_attach(function(client, bufnr)
        -- lsp.default_keymaps({buffer = bufnr})
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>wfa", function() vim.lsp.buf.add_workspace_folder() end, opts)
        vim.keymap.set("n", "<leader>wfr", function() vim.lsp.buf.remove_workspace_folder() end, opts)
        vim.keymap.set("n", "<leader>wfl", '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>ld", function() vim.lsp.diagnostic.show_line_diagnostics() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vcf", function() vim.lsp.buf.formatting() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>jca", "<cmd>lua require(\'jdtls\').code_action()<CR>", { silent = true })

        -- lspsaga stuff ------------------------------------------------------------------
        local keymap = vim.keymap.set
        keymap("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>")
        -- It also supports tagstack
        -- Use <C-t> to jump back
        keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
        keymap("n", "<leader>pt", "<cmd>Lspsaga peek_type_definition<CR>")
        keymap("n", "<leader>gpt", "<cmd>Lspsaga goto_type_definition<CR>")
        keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics ++unfocus<CR>")
        keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics ++keep<CR>")
        keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
        keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
        keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
        keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
        -- Diagnostic jump with filters such as only jumping to an error
        keymap("n", "[E", function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end)
        keymap("n", "]E", function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end)
        -- Toggle outline
        keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
        keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
        -- Call hierarchy
        keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
        keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
        -- Floating terminal
        keymap({ "n", "t" }, "<leader>tt", "<cmd>Lspsaga term_toggle<CR>")
        -- lspsaga stuff ------------------------------------------------------------------
      end)

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()
    end
  }
}
