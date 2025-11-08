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
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        colors = {
          theme = {
            wave = {},
            lotus = {
              ui = {
                bg = "#f4f3ef",
                bg_gutter = "#f4f3ef",
                bg_dim = "#eae8e0",
                bg_p1 = "#eae8e0",
                bg_p2 = "#eae8e0",
                float = {
                  bg = "#eae8e0",
                  bg_border = "None",
                },
                pmenu = {
                  bg = "#eae8e0",
                },
              },
            },
            dragon = {},
            all = {},
          },
        },
        background = {
          dark = "wave",
          light = "lotus",
        },
      })
    end,
  },

  {
    "xiyaowong/nvim-transparent",
    lazy = false,
    config = function()
      local transparent = require("transparent")
      transparent.setup()
      transparent.clear_prefix("DropBar")
    end,
  },

  { "LazyVim/LazyVim", opts = { colorscheme = "shado" } },
}
