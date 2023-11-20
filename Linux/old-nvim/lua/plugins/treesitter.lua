return {
  {
    -- Used by mini.ai. No need to specify the text objects within treesitter config.
    "nvim-treesitter/nvim-treesitter-textobjects", -- Additional textobjects for treesitter
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-treesitter/nvim-treesitter-context", -- Keep e.g. function at top when scrolling below
    name = "treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    name = "ts_context_commentstring",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "mrjones2014/nvim-ts-rainbow", -- Rainbow parentheses
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "windwp/nvim-ts-autotag",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({
        with_sync = true,
      })
      ts_update()
    end,
    config = function()
      local status, autotag = pcall(require, 'nvim-ts-autotag')
      if (not status) then return end
      autotag.setup {}
      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          "lua",
          "markdown",
          "java",
          "cpp",
          "css",
          "html",
          -- "c",
          -- "js",
          -- "ts",
          -- "python",
          -- "csharp",
        },
        sync_install = false,
        -- auto_install = true,
        -- ignore_install = {  },

        highlight = {
          -- `false` will disable the whole extension
          enable = true,
          -- disable = { },
          additional_vim_regex_highlighting = false,
        },

        rainbow = {
          enable = true,
          extended_mode = true,
        },

        autotag = {
          enable = true, -- Through auto-tag plugin
        },

        indent = { -- Indentation based on = operator (experimental)
          enable = true,
        },

        context_commentstring = {
          -- For nvim-ts-context-commentstring plugin
          enable = true,
          enable_autocmd = false, -- Disabled when used with Comment.nvim
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            scope_incremental = "<CR>",
            node_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
            -- ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
            -- ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
            -- ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
            -- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          },
        },
        -- swap = {
        --   enable = true,
        --   swap_next = {
        --     ["<leader>xp"] = { query = "@parameter.inner", desc = "Swap parameter with the next one" },
        --   },
        --   swap_previous = {
        --     ["<leader>xP"] = { query = "@parameter.inner", desc = "Swap parameter with the previous one" },
        --   },
        -- },
      })

      -- Must installed zig via scoop in Windows
      -- if _G.IS_WINDOWS then
      --   require("nvim-treesitter.install").compilers = { "zig" }
      -- else
      --   require("nvim-treesitter.install").compilers = { "clang", "gcc", "cc", "cl", "zig" }
      -- end
    end,
  },
}
