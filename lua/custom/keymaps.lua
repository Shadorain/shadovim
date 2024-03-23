local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- System
map("n", "<Leader><TAB>", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false, no_ignore=true, follow=true, hidden=true})<cr>", opts)

vim.cmd([[imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")]])

-- Renaming
vim.api.nvim_set_keymap("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
