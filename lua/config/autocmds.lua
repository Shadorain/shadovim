local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usrcmd = vim.api.nvim_create_user_command

autocmd("BufWritePre", {
  group = augroup("create_dir", { clear = true }),
  callback = function(args)
    if args.match:match("^%w%w+://") then
      return
    end
    vim.fn.mkdir(vim.fn.fnamemodify(vim.loop.fs_realpath(args.match) or args.match, ":p:h"), "p")
  end,
  desc = "Automatically create parent directories if they don't exist when saving a file",
})

autocmd("FileType", {
  pattern = {
    "neo-tree",
    "PlenaryTestPopup",
    "checkhealth",
    "fugitive",
    "git",
    "gitcommit",
    "help",
    "lazy",
    "lazyterm",
    "lspinfo",
    "man",
    "mason",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "Trouble",
    "trouble",
    "toggleterm",
  },
  callback = function()
    vim.opt_local.winbar = nil
    vim.opt_local.number = false
    vim.opt_local.cursorline = false
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.signcolumn = "no"
    vim.b.miniindentscope_disable = true
  end,
  desc = "Disable miniindentscope, number and cursorline in specific filetypes",
})

autocmd("BufWinEnter", {
  group = augroup("q_close_windows", { clear = true }),
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
    if vim.tbl_contains({ "help", "nofile", "quickfix" }, buftype) and vim.fn.maparg("q", "n") == "" then
      vim.keymap.set("n", "q", "<cmd>close<cr>", {
        desc = "Close window",
        buffer = args.buf,
        silent = true,
        nowait = true,
      })
    end
  end,
  desc = "Make q close help, man, quickfix, dap floats",
})

autocmd("FileType", {
  group = augroup("unlist_quickfist", { clear = true }),
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
  desc = "Don't list quickfix buffer",
})

usrcmd("KanagawaLight", function(_)
  vim.opt.background = "light"
  vim.cmd("TransparentDisable")
  require("kanagawa").load("lotus")
end, {})
