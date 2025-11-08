return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[
|
\       /
.---. 
'-.  |   |  .-'
___|   |___
-=  [           ]  =-
`---.   .---' 
__||__ |   | __||__
'-..-' |   | '-..-'
||   |   |   ||
||_.-|   |-,_||
.-"`   `"`'`   `"-.
.'                   '.
 ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "i", desc = "New File", action = ":ene | startinsert" },
          -- { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          -- { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Sessions", action = function() require("resession").load() end },
          { icon = " ", key = "l", desc = "Last Session", action = function() require("resession").load("last") end },
          { icon = "󰒲 ", key = "U", desc = "Update Plugins", action = ":Lazy sync" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
