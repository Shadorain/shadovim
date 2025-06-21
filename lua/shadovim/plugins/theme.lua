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
    "NTBBloodbath/sweetie.nvim",
    config = function()
      vim.opt.background = "light"
      vim.g.sweetie = {
        palette = {
          dark = {},
          light = {
            bg = "#e4e5f1",
          }
        }
      }
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    -- cmd = { "KanagawaLight" },
    -- lazy = false,
    config = function()
      require('kanagawa').setup({
        compile = false,  -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,   -- do not set background color
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {             -- add/modify theme and palette colors
          palette = {},
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
                  bg = "#eae8e0"
                },
              },
            },
            dragon = {},
            all = {}
          },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave",  -- Load "wave" theme
        background = {   -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus"
        }
      })
    end,
  },

  {
    "xiyaowong/nvim-transparent",
    event = "VimEnter",
    lazy = false,
    config = true,
  },
}
