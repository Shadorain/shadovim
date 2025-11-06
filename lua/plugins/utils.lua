return {
  { "gbprod/stay-in-place.nvim", event = "BufWinEnter", config = true },
  { "nacro90/numb.nvim", event = "BufWinEnter", config = true },
  {
    "jghauser/mkdir.nvim",
    event = "BufWritePre",
    config = function()
      require("mkdir")
    end,
  },

  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.replace = {
        key = {
          { "<Space>", "SPC" },
          { "<Leader>", "SPC" },
          { "<CR>", "RET" },
          { "<Tab>", "TAB" },
          { "<BS>", "BS" },
          { "<Esc>", "ESC" },
        },
      }
      return opts
    end,
  },

  {
    "matbme/JABS.nvim",
    cmd = { "JABSOpen" },
    keys = {
      { "<leader>J", "<cmd>JABSOpen<CR>", desc = "Open JABS" },
    },
    opts = {
      border = "rounded",
      offset = {
        bottom = 6,
      },
      preview = {
        border = "rounded",
      },
      keymap = {
        close = "d",
        preview = "p",
      },
      highlight = {
        current = "Title",
        hidden = "FloatermNC",
        split = "EndOfBuffer",
        alternate = "Identifier",
      },
    },
  },

  {
    "LunarVim/peek.lua",
    keys = { { "gp", ":lua require('peek').Peek('definition')<CR>", mode = { "n", "x", "o" }, desc = "Peek" } },
  },
  {
    "willothy/flatten.nvim",
    lazy = false,
    priority = 1001,
    config = true,
  },
  {
    "tummetott/unimpaired.nvim",
    event = "BufReadPost",
    config = true,
  },
  {
    "LudoPinelli/comment-box.nvim",
    cmd = { "CBccbox", "CBllline", "CBline", "CBllbox14", "CBd" },
    config = true,
  },
}
