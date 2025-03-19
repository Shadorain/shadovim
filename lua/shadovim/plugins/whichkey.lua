return {
  "folke/which-key.nvim",
  keys = { "<leader>", " ", "'", "`", '"', "m", "g" },
  cmd = "WhichKey",
  opts = {
    setup = {
      delay = function(ctx)
        return ctx.plugin and 0 or 200
      end,
      filter = function(mapping)
        return mapping.desc and mapping.desc ~= ""
      end,
      triggers = {
        -- { "<auto>", mode = "nxso" },
        { "<leader>", mode = { "n", "v", "t" } },
      },
      plugins = {
        marks = true,       -- shows a list of your marks on ' and `
        registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = false,    -- adds help for operators like d, y, ...
          motions = false,      -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false,      -- default bindings on <c-w>
          nav = false,          -- misc bindings to work with windows
          z = false,            -- bindings for folds, spelling and others prefixed with z
          g = false,            -- bindings for prefixed with g
        },
      },
      replace = {
        key = {
          { "<Space>",  "SPC" },
          { "<Leader>", "SPC" },
          { "<CR>",     "RET" },
          { "<Tab>",    "TAB" },
          { "<BS>",     "BS" },
          { "<Esc>",    "ESC" },
        },
      },
      icons = {
        breadcrumb = "",
        separator = "",
        group = " ",
      },
      layout = {
        height = { min = 3, max = 20 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "center",
      },
      win = {
        border = "rounded",
        padding = { 1, 2, 1, 2 },
        wo = {
          winblend = 15,
        }
      },
    },
  },
  config = function(_, opts)
    require("which-key").setup(opts.setup)
    require("config.keymaps").whichkeys()
  end,
}
