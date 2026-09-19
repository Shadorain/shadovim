-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- TypeScript extra: native tsc LSP (TS 7+). Prettier formats; eslint only lints.
vim.g.lazyvim_ts_lsp = "tsc"
vim.g.lazyvim_eslint_auto_format = false


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
  updatetime = 200,

  -- Miscellaneous
  expandtab = true,

  -- Cursor
  cursorline = true,
  cursorlineopt = "number",

  -- Miscellaneous
  -- path left at default ('.,,'): Telescope/Snacks already do fast fd/rg file finding;
  -- a recursive "$PWD/**" glob makes gf/:find/path-completion walk the whole tree.
  cmdheight = 0,
  sessionoptions = "tabpages,globals,blank,buffers,curdir,folds,help,winsize,winpos,terminal",
  conceallevel = 2,
  listchars = "space:·",
  list = false,
  virtualedit = "block",
  mousefocus = true,
  inccommand = "split",
  showtabline = 0,

  textwidth = 0,
  wrapmargin = 0,
  wrap = false,

  smartcase = true,
  ignorecase = true,
  mouse = "a",
  showmode = false,
  splitbelow = true,
  splitright = true,
  termguicolors = true,
  timeoutlen = 300,
  fillchars = { eob = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " },
  mousemoveevent = false, -- no plugin here reads MouseMove; over SSH this floods the pipe with motion events
}

-- LazyVim sets clipboard=unnamedplus. That plus OSC52 paste is why Orca
-- yy/x hit the host clipboard and why notifications say
-- "Timed out waiting for a clipboard response from the terminal".
vim.opt.clipboard = ""

local function inside_herdr()
  return vim.env.HERDR_ENV == "1"
    or (vim.env.HERDR_PANE_ID or "") ~= ""
    or (vim.env.HERDR_TAB_ID or "") ~= ""
    or (vim.env.HERDR_WORKSPACE_ID or "") ~= ""
end

-- Herdr has no native clipboard; OSC52 copy is the path out.
-- Orca TUI still needs OSC52 for "+y (DISPLAY=:99 is Xvfb, not the host).
-- Neither answers OSC52 clipboard queries, so paste is a local cache only.
if inside_herdr() or vim.env.TERM_PROGRAM == "Orca" or (vim.env.ORCA_PANE_KEY or "") ~= "" then
  local osc52 = require("vim.ui.clipboard.osc52")
  local cache = {
    ["+"] = { {}, "v" },
    ["*"] = { {}, "v" },
  }
  local function copy(reg)
    local send = osc52.copy(reg)
    return function(lines, regtype)
      cache[reg] = { lines, regtype or "v" }
      send(lines)
    end
  end
  local function paste(reg)
    return function()
      return cache[reg]
    end
  end
  vim.g.clipboard = {
    name = "OSC 52 copy",
    copy = { ["+"] = copy("+"), ["*"] = copy("*") },
    paste = { ["+"] = paste("+"), ["*"] = paste("*") },
  }
end

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
