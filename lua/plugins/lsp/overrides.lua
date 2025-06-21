local M = {}

M.mason = {
  ensure_installed = {
    "rust-analyzer",
    "taplo",
    "clang-format",
    "clangd",
    "codelldb",
    "lua-language-server",
    "stylua",
    "marksman",
    "tailwindcss-language-server",
  },
}

return M
