return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "css", "scss" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {},
        html = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("daedalus_web_indent", { clear = true }),
        pattern = {
          "css",
          "html",
          "javascript",
          "javascriptreact",
          "json",
          "jsonc",
          "scss",
          "typescript",
          "typescriptreact",
        },
        callback = function()
          vim.opt_local.shiftwidth = 2
          vim.opt_local.tabstop = 2
          vim.opt_local.softtabstop = 2
        end,
      })
    end,
  },
}
