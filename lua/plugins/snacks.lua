return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.explorer = {
      replace_netrw = true,
      trash = true,
    }
    return opts
  end,
}
