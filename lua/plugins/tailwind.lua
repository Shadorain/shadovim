return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  cmd = { "TailwindStart" },
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
  },
  opts = {
    document_color = {
      enabled = true, -- can be toggled by commands
      kind = "inline", -- "inline" | "foreground" | "background"
    },
    server = {
      override = true,
      settings = {
        includeLanguages = {
          rust = "html",
        },
      },
    },
  },
}
