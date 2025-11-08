return {
  {
    "gbprod/yanky.nvim",
    keys = {
      { "<leader>p", mode = { "n", "x", "o" }, false },
      {
        "<leader>P",
        function()
          if LazyVim.pick.picker.name == "telescope" then
            require("telescope").extensions.yank_history.yank_history({})
          elseif LazyVim.pick.picker.name == "snacks" then
            Snacks.picker.yanky()
          else
            vim.cmd([[YankyRingHistory]])
          end
        end,
        mode = { "n", "x" },
        desc = "Open Yank History",
      },
    },
  },
    {
  "MagicDuck/grug-far.nvim",
  keys = {
    {
      "<leader>sr",
      function()
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        require("grug-far").toggle_instance({
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        })
      end,
      mode = { "n", "x" },
      desc = "Search and Replace",
    },
  },
}
}
