return {
  "nosduco/remote-sshfs.nvim",
  lazy = true,
  opts = {},
  config = function(_, opts)
    require("remote-sshfs").setup(opts)
  end,
}
