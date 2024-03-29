return {
  "nvimdev/lspsaga.nvim",
  event = { "LspAttach" },
  config = function()
    local lspsaga = require "lspsaga"

    lspsaga.setup {
      preview = {
        lines_above = 0,
        lines_below = 10,
      },

      code_action = {
        num_shortcut = true,
        keys = {
          quit = "q",
          exec = "<CR>",
        },
      },

      scroll_preview = {
        scroll_down = "<C-n>",
        scroll_up = "<C-p>",
      },
      request_timeout = 2000,

      lightbulb = {
        enable = false,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
      },

      rename = {
        quit = "q",
        exec = "<CR>",
        in_select = false,
      },

      finder = {
        edit = { "o", "<CR>" },
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = { "q", "<ESC>" },
      },

      diagnostic = {
        insert_winblend = 10,
        jump_num_shortcut = true,
        on_insert = false,
        on_insert_follow = false,
        show_code_action = true,
        show_source = true,
        custom_fix = nil,
        custom_msg = nil,
        text_hl_follow = false,
        border_follow = true,
        keys = {
          exec_action = "o",
          quit = "q",
        },
      },

      symbol_in_winbar = {
        enable = false,
        separator = "  ",
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
      },

      definition = {
        edit = "<C-c>o",
        vsplit = "<C-c>v",
        split = "<C-c>i",
        tabe = "<C-c>t",
        quit = "q",
        close = "<Esc>",
      },

      ui = {
        theme = "round",
        border = "rounded",
        winblend = 0,
        expand = "",
        collaspe = "",
        preview = " ",
        code_action = "",
        diagnostic = "🐞",
        hover = " ",
        kind = {},
      },

      outline = {
        win_position = "right",
        win_with = "",
        win_width = 50,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
          jump = "o",
          expand_collaspe = "u",
          quit = "q",
        },
      },

      callhierarchy = {
        show_detail = false,
        keys = {
          edit = "e",
          vsplit = "s",
          split = "i",
          tabe = "t",
          jump = "o",
          quit = "q",
          expand_collaspe = "u",
        },
      },
    }
  end,
}
