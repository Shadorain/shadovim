return {
  { "gbprod/stay-in-place.nvim", event = "BufWinEnter", config = true },
  { "nacro90/numb.nvim", event = "BufWinEnter", config = true },

  {
    "smoka7/hop.nvim",
    opts = { keys = "etovxqpdygfblzhckisuran", virtual_cursor = false, case_insensitive = false },
    keys = {
      { "s", ":HopChar1<cr>", mode = { "n", "v" } },
      { "S", ":HopPattern<cr>", mode = { "n", "v" } },
      {
        "f",
        ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>",
        mode = { "n", "o" },
      },
      {
        "F",
        ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>",
        mode = { "n", "o" },
      },
      {
        "t",
        ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>",
        mode = { "n", "o" },
      },
      {
        "T",
        ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>",
        mode = { "n", "o" },
      },
    },
  },

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
    keys = {
      { mode = { "n", "v" }, "gcbb", "<Cmd>CBccbox<CR>", desc = "Box Title" },
      { mode = { "n", "v" }, "gcbm", "<Cmd>CBllbox14<CR>", desc = "Marked" },
      { mode = { "n", "v" }, "gcbl", "<Cmd>CBline<CR>", desc = "Simple Line" },
      { mode = { "n", "v" }, "gcbt", "<Cmd>CBllline<CR>", desc = "Titled Line" },
      { mode = { "n", "v" }, "gcbd", "<Cmd>CBd<CR>", desc = "Remove a box" },
    },
  },

  {
    "epwalsh/pomo.nvim",
    version = "*",
    cmd = { "TimerStart", "TimerRepeat", "TimerShow" },
    opts = { notifiers = { { name = "Default", opts = { sticky = false } } } },
    keys = {
      { mode = { "n", "v" }, "<leader>Tv", "<cmd>TimerShow<cr>", desc = "Show" },
      { mode = { "n", "v" }, "<leader>Ts", "<cmd>TimerStart", desc = "Start" },
      { mode = { "n", "v" }, "<leader>TR", "<cmd>TimerResume<cr>", desc = "Resume" },
      { mode = { "n", "v" }, "<leader>Tp", "<cmd>TimerPause<cr>", desc = "Pause" },
      { mode = { "n", "v" }, "<leader>TS", "<cmd>TimerStop<cr>", desc = "Stop" },
      { mode = { "n", "v" }, "<leader>Tr", "<cmd>TimerRepeat<cr>", desc = "Repeat" },
      { mode = { "n", "v" }, "<leader>T1", "<cmd>TimerStart 1m<cr>", desc = "1m" },
      { mode = { "n", "v" }, "<leader>T5", "<cmd>TimerStart 5m<cr>", desc = "5m" },
      { mode = { "n", "v" }, "<leader>TH", "<cmd>TimerStart 30m<cr>", desc = "30m" },
      { mode = { "n", "v" }, "<leader>Th", "<cmd>TimerStart 1h<cr>", desc = "1h" },
    },
  },

  {
    "tomasky/bookmarks.nvim",
    cmd = {
      "BookmarkAnnotate",
      "BookmarkToggle",
      "BookmarkClear",
      "BookmarkShowAll",
      "BookmarkClearAll",
      "BookmarkNext",
      "BookmarkPrev",
    },
    config = true,
    keys = {
      { mode = { "n", "v" }, "mA", "<cmd>silent BookmarkAnnotate<cr>", desc = "Annotate" },
      { mode = { "n", "v" }, "mB", "<cmd>silent BookmarkToggle<cr>", desc = "Toggle" },
      { mode = { "n", "v" }, "mC", "<cmd>silent BookmarkClear<cr>", desc = "Clear" },
      { mode = { "n", "v" }, "mS", "<cmd>silent BookmarkShowAll<cr>", desc = "Show" },
      { mode = { "n", "v" }, "mX", "<cmd>silent BookmarkClearAll<cr>", desc = "Clear All" },
      { mode = { "n", "v" }, "mj", "<cmd>silent BookmarkNext<cr>", desc = "Next" },
      { mode = { "n", "v" }, "mk", "<cmd>silent BookmarkPrev<cr>", desc = "Prev" },
    },
  },

  { "filipdutescu/renamer.nvim", requires = { "nvim-lua/plenary.nvim" }, opts = { border = true } },

  {
    "nat-418/bufala.nvim",
    cmd = "Bufala",
    opts = { layout = "stack" },
  },
  {
    "nat-418/tabbot.nvim",
    cmd = "Tabbot",
    config = true,
  },
}
