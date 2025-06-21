return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  lazy = false,
  opts = {
    auto_hide = 1,
    separator = { left = "│", right = "│" },
    separator_at_end = false,
    insert_at_end = true,
    sidebar_filetypes = {
      ['neo-tree'] = { event = 'BufWipeout' }
    },
    icons = {
      filetype = {
        custom_colors = true,
      }
    },
  },
}
