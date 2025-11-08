return {
  "folke/snacks.nvim",
  dependencies = {
    {
      "s1n7ax/nvim-window-picker",
      name = "window-picker",
      event = "VeryLazy",
      opts = {
        hint = "floating-big-letter",
        selection_chars = "HJKLFDSA;CMRUEIWOQP",
        show_prompt = false,
        filter_rules = {
          autoselect_one = true,
          include_current_win = false,
          include_unfocusable_windows = false,
          -- stylua: ignore
          bo = {
            filetype = { "snacks_picker_input", "snacks_picker_list", "NvimTree", "neo-tree", "notify", "snacks_notif", },
            buftype = { "terminal", "nofile", "quickfix", "help", "prompt", "notify", "float" },
          },
        },
      },
    },
  },
  opts = {
    explorer = {
      replace_netrw = true,
      trash = true,
    },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          enabled = true,
          auto_close = false,
          actions = {
            window_picker = function(_, item)
              if item.dir then
                return
              end
              local window_id = require("window-picker").pick_window()
              if not window_id then
                return
              end
              vim.api.nvim_set_current_win(window_id)
              vim.cmd("edit " .. item._path)
              Snacks.explorer()
            end,
          },
          win = {
            list = {
              keys = {
                ["l"] = "window_picker",
                ["v"] = "edit_vsplit",
                ["s"] = "edit_split",
              },
            },
          },
        },
      },
    },
  },
}
