return {
  "Bekaboo/dropbar.nvim",
  -- lazy = false,
  dependencies = { build = "make", "neovim/nvim-lspconfig", "xiyaowong/nvim-transparent" },
  config = function()
    local dropbar_api = require("dropbar.api")
    vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
    vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
    vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })

    require("dropbar").setup({
      bar = {
        sources = function(buf, _)
          local sources = require("dropbar.sources")
          local utils = require("dropbar.utils")
          if vim.bo[buf].ft == "markdown" then
            return { sources.markdown }
          end
          if vim.bo[buf].buftype == "terminal" then
            return { sources.terminal }
          end
          return { utils.source.fallback({ sources.lsp, sources.treesitter }) }
        end,
      },
      icons = {
        ui = {
          bar = {
            separator = "  ",
            extends = "…",
          },
        },
      },
    })
  end,
}
