-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    close_if_last_window = true,
    enable_opened_markers = true,

    source_selector = {
      winbar = true,
      separator = { left = '▏', right = '▕' },
      content_layout = 'center',
      tabs_layout = 'equal',
      sources = {
        { source = 'filesystem', display_name = '  Files' },
        { source = 'buffers',    display_name = '  Bufs' },
        { source = 'git_status', display_name = '  Git' },
      },
    },

    default_component_configs = {
      container = {
        enable_character_fade = true,
      },
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = '│',
        last_indent_marker = '└',
        highlight = 'NeoTreeIndentMarker',
        with_expanders = true,
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = '󰉖',
        folder_empty_open = '󰷏',
        default = '',
        highlight = 'NeoTreeFileIcon',
      },
      modified = {
        symbol = '',
        highlight = 'NeoTreeModified',
      },
      name = {
        trailing_slash = false,
        highlight_opened_files = 'all',
        use_git_status_colors = true,
      },
      git_status = {
        symbols = {
          added     = '✚',
          deleted   = '✖',
          modified  = '',
          renamed   = '󰁕',
          untracked = '',
          ignored   = '',
          unstaged  = '󰄱',
          staged    = '',
          conflict  = '',
        },
        align = 'right',
      },
    },

    window = {
      width = 35,
      mappings = {
        ['\\'] = 'close_window',
      },
    },

    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = true,
        never_show = { '.DS_Store', 'thumbs.db' },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },

    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          vim.cmd 'highlight! Cursor blend=100'
        end,
      },
      {
        event = 'neo_tree_buffer_leave',
        handler = function()
          vim.cmd 'highlight! Cursor blend=0'
        end,
      },
    },
  },
}
