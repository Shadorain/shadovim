return {
  "stevearc/resession.nvim",
  event = "VimEnter",
  dependencies = { { "tiagovla/scope.nvim", lazy = false, config = true } },
  keys = {
    { "<leader>ps", function() require("resession").save() end, desc = "Save" },
    { "<leader>pl", function() require("resession").load() end, desc = "Load" },
    { "<leader>pd", function() require("resession").delete() end, desc = "Delete" },
  },
  config = function()
    local resession = require("resession")
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        resession.save("last")
      end,
    })

    resession.setup({
      options = {
        "binary",
        "bufhidden",
        "buflisted",
        "cmdheight",
        "diff",
        "filetype",
        "modifiable",
        "previewwindow",
        "readonly",
        "scrollbind",
        "winfixheight",
        "winfixwidth",
        "statuscolumn",
      },
      buf_filter = function(bufnr)
        local buftype = vim.bo[bufnr].buftype
        if buftype == "help" then
          return true
        end
        if buftype ~= "" and buftype ~= "acwrite" then
          return false
        end
        if vim.api.nvim_buf_get_name(bufnr) == "" then
          return false
        end
        return true -- this is required, since the default filter skips nobuflisted buffers
      end,
      extensions = { scope = {}, overseer = {} },
    })
  end,
}
