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
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")

--------------------------------------------------------------------------------

-- Management
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>C", function()
  LazyVim.news.changelog()
end, { desc = "LazyVim Changelog" })

-- Terminals
map({ "n", "t" }, "<c-j>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

-- Searching
map("n", "n", "'Nn'[v:searchforward].'zzzv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zzzv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- General Movement
map("n", "<C-h>", "<C-w>h", opts("Move Cursor Left Buffer"))
map("n", "<C-j>", "<C-w>j", opts("Move Cursor Down Buffer"))
map("n", "<C-k>", "<C-w>k", opts("Move Cursor Up Buffer"))
map("n", "<C-l>", "<C-w>l", opts("Move Cursor Right Buffer"))
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
vim.api.nvim_set_keymap("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', opts("Rename"))
vim.api.nvim_set_keymap("n", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', opts("Rename"))
vim.api.nvim_set_keymap("v", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', opts("Rename"))

--------------------------------------------------------------------------------

-- Leader
Whichkeys = function()
  local m_mappings = {
    { "m", group = " BOOKMARKS" },
    { "mA", "<cmd>silent BookmarkAnnotate<cr>", desc = "Annotate" },
    { "mB", "<cmd>silent BookmarkToggle<cr>", desc = "Toggle" },
    { "mC", "<cmd>silent BookmarkClear<cr>", desc = "Clear" },
    { "mS", "<cmd>silent BookmarkShowAll<cr>", desc = "Show" },
    { "mX", "<cmd>silent BookmarkClearAll<cr>", desc = "Clear All" },
    { "mj", "<cmd>silent BookmarkNext<cr>", desc = "Next" },
    { "mk", "<cmd>silent BookmarkPrev<cr>", desc = "Prev" },
  }

  local t_mappings = {
    { "<leader>b", group = " TERMINAL" },
    { "<leader>bm", "<C-\\><C-n><cmd>ToggleTerm direction=float<CR>", desc = "Terminal Float" },
    { "<leader>bv", "<C-\\><C-n><cmd>ToggleTerm size=50 direction=vertical<cr>", desc = "Terminal Side" },
    { "<leader>b,", "<C-\\><C-n><cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Terminal Bottom" },
    { "<leader>b1", "<C-\\><C-n><cmd>1ToggleTerm<cr>", desc = "Terminal 1" },
    { "<leader>b2", "<C-\\><C-n><cmd>2ToggleTerm<cr>", desc = "Terminal 2" },
    { "<leader>b3", "<C-\\><C-n><cmd>3ToggleTerm<cr>", desc = "Terminal 3" },
    { "<leader>b4", "<C-\\><C-n><cmd>4ToggleTerm<cr>", desc = "Terminal 4" },
  }

  local g_mappings = {
    { "gcb", group = "□ COMMENT BOX" },
    { "gcbb", "<Cmd>CBccbox<CR>", desc = "Box Title" },
    { "gcbm", "<Cmd>CBllbox14<CR>", desc = "Marked" },
    { "gcbl", "<Cmd>CBline<CR>", desc = "Simple Line" },
    { "gcbt", "<Cmd>CBllline<CR>", desc = "Titled Line" },
    { "gcbd", "<Cmd>CBd<CR>", desc = "Remove a box" },
  }

  local n_mappings = {
    -- POMO --
    { "<leader>P", group = " +pomo" },
    { "<leader>Pv", "<cmd>TimerShow<cr>", desc = "Show" },
    { "<leader>Ps", "<cmd>TimerStart", desc = "Start" },
    { "<leader>PR", "<cmd>TimerResume<cr>", desc = "Resume" },
    { "<leader>Pp", "<cmd>TimerPause<cr>", desc = "Pause" },
    { "<leader>PS", "<cmd>TimerStop<cr>", desc = "Stop" },
    { "<leader>Pr", "<cmd>TimerRepeat<cr>", desc = "Repeat" },
    { "<leader>P1", "<cmd>TimerStart 1m<cr>", desc = "1m" },
    { "<leader>P5", "<cmd>TimerStart 5m<cr>", desc = "5m" },
    { "<leader>PH", "<cmd>TimerStart 30m<cr>", desc = "30m" },
    { "<leader>Ph", "<cmd>TimerStart 1h<cr>", desc = "1h" },

    -- BUFFER --
    { "<leader>b,", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Terminal Bottom" },
    { "<leader>b1", "<cmd>1ToggleTerm<cr>", desc = "Terminal 1" },
    { "<leader>b2", "<cmd>2ToggleTerm<cr>", desc = "Terminal 2" },
    { "<leader>b3", "<cmd>3ToggleTerm<cr>", desc = "Terminal 3" },
    { "<leader>b4", "<cmd>4ToggleTerm<cr>", desc = "Terminal 4" },
    { "<leader>bf", "<cmd>set shiftwidth=4 | set tabstop=4 | set softtabstop=4<CR>", desc = "Fix Spacing" },
    { "<leader>bm", "<cmd>ToggleTerm direction=float<CR>", desc = "Terminal Float" },
    { "<leader>bp", "<cmd>:BufferPin<CR>", desc = "List" },
    { "<leader>br", "<cmd>:BufferRestore<CR>", desc = "List" },

    -- SESSION --
    { "<leader>p", group = " +session" },
  }

  local wk = require("which-key")
  wk.add(m_mappings, { silent = true, noremap = true, nowait = true, mode = "n" })
  wk.add(n_mappings, { silent = true, noremap = true, nowait = true, mode = "n" })
  wk.add(g_mappings, { silent = true, noremap = true, nowait = true, mode = "n" })
  wk.add(t_mappings, { silent = true, noremap = true, nowait = true, mode = "t" })
end
