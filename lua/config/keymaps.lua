-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

--------------------------------------------------------------------------------

-- Disable Default Maps
del("n", "<S-h>")
del("n", "<S-l>")
del("n", "<leader>l")

--- Split Navigation
del("n", "<c-h>")
del("n", "<c-j>")
del("n", "<c-k>")
del("n", "<c-l>")

--------------------------------------------------------------------------------

-- Management
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>C", function()
  LazyVim.news.changelog()
end, { desc = "LazyVim Changelog" })

-- Terminals
map({ "n", "t" }, "<c-j>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, opts("Terminal (Root Dir)"))

-- Searching
map("n", "n", "'Nn'[v:searchforward].'zzzv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zzzv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- General Movement
map("i", "<C-j>", "<Down>", opts("Move Cursor Down in Insert Mode"))
map("i", "<C-k>", "<Up>", opts("Move Cursor Up in Insert Mode"))
map("i", "<C-h>", "<Left>", opts("Move Cursor Left in Insert Mode"))
map("i", "<C-l>", "<Right>", opts("Move Cursor Right in Insert Mode"))

-- Split Management
map("t", "<C-S-h>", "<C-\\><C-N><C-w>h", opts("Move out of terminal to split left"))
map("t", "<C-S-j>", "<C-\\><C-N><C-w>j", opts("Move out of terminal to split up"))
map("t", "<C-S-k>", "<C-\\><C-N><C-w>k", opts("Move out of terminal to split down"))
map("t", "<C-S-l>", "<C-\\><C-N><C-w>l", opts("Move out of terminal to split right"))
map("n", "<leader>h", "<C-w>h", opts("Move to split left"))
map("n", "<leader>l", "<C-w>l", opts("Move to split up"))
map("n", "<leader>j", "<C-w>j", opts("Move to split down"))
map("n", "<leader>k", "<C-w>k", opts("Move to split right"))
map("n", "Ww", "<C-w>c", opts("Close split"))
map("n", "Wb", "<C-w>=", opts("Balance splits"))

-- Tabs
for i, sym in ipairs({ "!", "@", "#", "$", "%", "^", "&", "*", "(" }) do
  map("n", "<leader>" .. sym, "<cmd>Tabbot send " .. i .. "<cr>", opts("which_key_ignore"))
end
for i = 1, 9 do
  map("n", "<leader>" .. i, "<cmd>Tabbot go " .. i .. "<cr>", opts("which_key_ignore"))
end

-- Debugging
map("n", "<F11>", '<cmd>lua require("dap").step_into()<CR>', opts("Debugger step into"))
map("n", "<F10>", '<cmd>lua require("dap").step_over()<CR>', opts("Debugger step over"))
map("n", "<F9>", '<cmd>lua require("dap").step_out()<CR>', opts("Debugger step out"))

-- Miscellaneous
map("n", "<F3>", ":set invnumber invrelativenumber<CR>", opts("Toggle Line Numbers"))
map("n", "<leader>D", function()
  Snacks.dashboard.open()
end, opts("Dashboard"))

-- Renaming
map("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', opts("Rename"))
map("n", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', opts("Rename"))
map("v", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', opts("Rename"))
