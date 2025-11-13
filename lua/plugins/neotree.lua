return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = { { "<C-e>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" } },
  dependencies = {
    {
      "s1n7ax/nvim-window-picker",
      event = "VeryLazy",
      opts = {
        hint = "floating-big-letter",
        selection_chars = "ABCFJDKSL;CMRUEIWOQP",
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = { -- filter using buffer options
            filetype = { "neo-tree", "neo-tree-popup", "notify", "JABSwindow", "fidget" },
            buftype = { "terminal", "nofile", "quickfix", "help", "prompt", "notify", "float" },
          },
        },
      },
    },
  },
  opts = {
    sources = { "filesystem" },
    source_selector = {
      winbar = true,
      statusline = true,
    },
    close_if_last_window = true,
    default_component_configs = {
      indent = {
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        with_expanders = false,
        expander_collapsed = " ",
        expander_expanded = " ",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
      },
      modified = { symbol = "●" },
      git_status = {
        symbols = {
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "✖", -- this can only be used in the git_status source
          renamed = "󰁕", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
    window = {
      width = 30,
      mappings = {
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["l"] = "open_with_window_picker",
        ["<TAB>"] = "focus_preview",
        ["Z"] = "expand_all_nodes",
      },
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          -- This effectively hides the cursor
          vim.cmd("highlight! Cursor blend=100")
        end,
      },
      {
        event = "neo_tree_buffer_leave",
        handler = function()
          -- Make this whatever your current Cursor highlight group is.
          vim.cmd("highlight! Cursor guibg=#f1c4e0 blend=0")
        end,
      },
    },
    filesystem = {
      filtered_items = { hide_dotfiles = false, hide_gitignored = false },
      follow_current_file = { enabled = true },
      group_empty_dirs = true,
      use_libuv_file_watcher = true,
      components = {
        name = function(config, node, state)
          local result = require("neo-tree.sources.common.components").name(config, node, state)
          if node:get_depth() == 1 then
            result.text = string.gsub(state.path, "(.*[/\\])(.*)", "%2")
          end
          return result
        end,
      },
    },
  },
}
