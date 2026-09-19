return {
  "romgrk/barbar.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bn", "<cmd>BufferPrevious<cr>", desc = "Prev Buffer" },
    { "<leader>bb", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
    { "<leader>bp", "<Cmd>BufferPin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferCloseAllButPinned<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bD", "<Cmd>BufferCloseAllButCurrent<CR>", desc = "Delete Non-Current Buffers" },
    { "<leader>br", "<Cmd>BufferCloseBuffersRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferCloseBuffersLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<leader>bk", "<Cmd>BufferClose<CR>", desc = "Delete Buffer" },
    { "<leader>bt", "<Cmd>BufferRestore<CR>", desc = "Restore Buffer" },
    { "<S-h>", "<cmd>BufferPrevious<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferPrevious<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferMovePrevious<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferMoveNext<cr>", desc = "Move buffer next" },
  },
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    auto_hide = 1,
    separator = { left = "│", right = "│" },
    separator_at_end = false,
    insert_at_end = true,
    sidebar_filetypes = {
      ["neo-tree"] = { event = "BufWipeout" },
      ["snacks_layout_box"] = { event = "BufWipeout" },
    },
    icons = {
      filetype = { custom_colors = true },
    },
  },
}
