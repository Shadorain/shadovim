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
            window_picker = function(picker, item)
              if not item then
                return
              end
              -- If it's a directory, toggle it open/closed
              if item.dir then
                require("snacks.explorer.tree"):toggle(item.file)
                picker:refresh()
                return
              end
              -- Otherwise, open file in selected window
              local window_id = require("window-picker").pick_window()
              if not window_id then
                return
              end
              vim.api.nvim_set_current_win(window_id)
              vim.cmd("edit " .. vim.fn.fnameescape(item._path))
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
