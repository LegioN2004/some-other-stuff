require('nvim-tree').setup{
  on_attach = on_attach,
  sync_root_with_cwd = true,
  sort_by = "case_sensitive",
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    highlight_opened_files = "name",
    group_empty = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = "after",
      glyphs = {
        git = {
          -- unstaged = icons.FileUnstaged,
          -- staged = icons.FileStaged,
          -- unmerged = icons.FileUnmerged,
          -- renamed = icons.FileRenamed,
          -- untracked = icons.FileUntracked,
          -- deleted = icons.FileDeleted,
          -- ignored = icons.FileIgnored,
        },
      },
    },
  },
  hijack_netrw = true,
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
  },
  actions = { open_file = { quit_on_open = false } },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
}
