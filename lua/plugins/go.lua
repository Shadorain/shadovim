return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "allaman/kustomize.nvim",
    requires = "nvim-lua/plenary.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    ft = "yaml",
    opts = {}
  },
  {
    "fredrikaverpil/godoc.nvim",
    cmd = { "GoDoc" },
    opts = {},
  },
}
