-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local options = {
  -- Tab Configuration
  smartindent = true,
  smarttab = true,
  autoindent = true,
  copyindent = true,
  preserveindent = true,

  -- Numbering
  number = true,
  relativenumber = true,
  ruler = false,

  -- Tab Configuration
  shiftwidth = 4,
  tabstop = 4,
  softtabstop = 4,

  -- Folds
  -- foldmethod = 'marker',

  -- Status line
  laststatus = 3, -- Set to 2 to have bar per window

  -- Undo
  undofile = true,
  undodir = os.getenv("HOME") .. "/.local/cache/nvim/undo/",
  backupdir = os.getenv("HOME") .. "/.local/cache/nvim/backups/",

  -- Pumemu
  pumwidth = 15,
  pumheight = 7,
  pumblend = 20,
  winblend = 20,

  -- Update times
  updatetime = 150,

  -- Miscellaneous
  expandtab = true,

  -- Cursor
  cursorline = true,
  cursorlineopt = "number",

  -- Miscellaneous
  path = "$PWD/**",
  cmdheight = 0,
  sessionoptions = "tabpages,globals,blank,buffers,curdir,folds,help,winsize,winpos,terminal",
  conceallevel = 2,
  listchars = "space:·",
  virtualedit = "block",
  mousefocus = true,
  inccommand = "split",
  showtabline = 0,

  textwidth = 0,
  wrapmargin = 0,
  wrap = false,

  clipboard = "",
  shortmess = vim.o.shortmess .. "F",

  smartcase = true,
  ignorecase = true,
  mouse = "a",
  showmode = false,
  splitbelow = true,
  splitright = true,
  termguicolors = true,
  timeoutlen = 300,
  fillchars = { eob = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " },
  mousemoveevent = true,
}

vim.opt.shortmess:append("sI")
vim.opt.formatoptions:remove("c", "r", "o")
vim.opt.whichwrap:append("<>[]hl")

for k, v in pairs(options) do
  vim.loader.enable()
  vim.opt.smoothscroll = true
  vim.opt[k] = v
end

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = { text = { [1] = " ", [2] = " ", [3] = "", [4] = "🞧 " } },
  float = {
    suffix = "",
    header = { "  Diagnostics", "String" },
    prefix = function(_, _, _)
      return "  ", "String"
    end,
  },
})
