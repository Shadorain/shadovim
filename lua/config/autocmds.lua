
-- FileType
vim.api.nvim_create_autocmd("FileType", { pattern={"norg", "lua"}, command = "set sw=2 ts=2 sts=2" })
vim.api.nvim_create_autocmd("FileType", { pattern="cpp", command = "set sw=4 ts=4 sts=4" })
vim.api.nvim_create_autocmd("FileType", { pattern="markdown", command = "setlocal spell spelllang=en_us" })
vim.api.nvim_create_autocmd("FileType", { pattern="*", command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" })

-- Ctags
-- vim.api.nvim_create_autocmd("BufRead", { pattern="*.rs", command = "setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi" })
-- vim.api.nvim_create_autocmd("BufWritePost", { pattern="*.rs", command = "silent! exec \"!rusty-tags vi --quiet --start-dir=\" . expand('%:p:h') . \"&\" | redraw!" })
