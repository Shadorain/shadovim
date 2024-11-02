return {
  {
    "Shadorain/shadotheme",
    lazy = false,
    config = function()
      vim.cmd.colorscheme("shado")
      vim.cmd([[
        hi Keyword gui=italic
        hi WinBar guibg=None
        hi WinBarNC guibg=None
      ]])
    end,
  },

  {
    "xiyaowong/nvim-transparent",
    event = "VimEnter",
    config = true,
  },
}
