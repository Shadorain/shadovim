-- local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usrcmd = vim.api.nvim_create_user_command

-- FileType
autocmd("FileType", { pattern = { "norg", "lua" }, command = "set sw=2 ts=2 sts=2" })
autocmd("FileType", { pattern = "cpp", command = "set sw=4 ts=4 sts=4" })
autocmd("FileType", { pattern = "markdown", command = "setlocal spell spelllang=en_us" })
autocmd("FileType", { pattern = "*", command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" })

-- Ctags
-- autocmd("BufRead", { pattern="*.rs", command = "setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi" })
-- autocmd("BufWritePost", { pattern="*.rs", command = "silent! exec \"!rusty-tags vi --quiet --start-dir=\" . expand('%:p:h') . \"&\" | redraw!" })

usrcmd("TailwindStart", function(_) end, {})
