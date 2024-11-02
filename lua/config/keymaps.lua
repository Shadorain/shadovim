local M = {}

-- Leader
M.whichkeys = function()
  -- local m_mappings = {
  --   ["m"] = {
  --     name = "  BOOKMARKS",
  --     -- Bookmarks
  --     A = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
  --     B = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
  --     C = { "<cmd>silent BookmarkClear<cr>", "Clear" },
  --     X = { "<cmd>silent BookmarkClearAll<cr>", "Clear All" },
  --     j = { "<cmd>silent BookmarkNext<cr>", "Next" },
  --     k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
  --     S = { "<cmd>silent BookmarkShowAll<cr>", "Show" },
  --
  --     -- Harpoon
  --     m = { '<cmd>lua require("harpoon"):list():append()<cr>', "Harpoon" },
  --     ["."] = { '<cmd>lua require("harpoon"):list():prev()<cr>', "Harpoon Next" },
  --     [","] = { '<cmd>lua require("harpoon"):list():next()<cr>', "Harpoon Prev" },
  --     [";"] = { '<cmd>lua require("harpoon.ui"):toggle_quick_menu(require("harpoon"):list())<cr>', "Harpoon UI" },
  --   },
  -- }
  local m_mappings = {
    { "m", group = " BOOKMARKS" },
    -- Bookmarks
    { "mA", "<cmd>silent BookmarkAnnotate<cr>", desc = "Annotate" },
    { "mB", "<cmd>silent BookmarkToggle<cr>", desc = "Toggle" },
    { "mC", "<cmd>silent BookmarkClear<cr>", desc = "Clear" },
    { "mS", "<cmd>silent BookmarkShowAll<cr>", desc = "Show" },
    { "mX", "<cmd>silent BookmarkClearAll<cr>", desc = "Clear All" },
    { "mj", "<cmd>silent BookmarkNext<cr>", desc = "Next" },
    { "mk", "<cmd>silent BookmarkPrev<cr>", desc = "Prev" },
    -- Harpoon
    { "m,", '<cmd>lua require("harpoon"):list():next()<cr>', desc = "Harpoon Prev" },
    { "m.", '<cmd>lua require("harpoon"):list():prev()<cr>', desc = "Harpoon Next" },
    { "m;", '<cmd>lua require("harpoon.ui"):toggle_quick_menu(require("harpoon"):list())<cr>', desc = "Harpoon UI" },
    { "mm", '<cmd>lua require("harpoon"):list():append()<cr>', desc = "Harpoon" },
  }
  -- local v_mappings = {
  --   d = {
  --     name = "Debug",
  --     K = { '<cmd>lua require("dap.ui.variables").visual_hover()<cr>', "Range Hover" },
  --   },
  --   D = {
  --     name = "Dioxus",
  --     x = { "<cmd>!dx translate<cr>", "Range DX Translate" },
  --   },
  -- }
  local v_mappings = {
    {
      mode = { "v" },
      { "<leader>D",  group = "Dioxus", },
      { "<leader>Dx", "<cmd>!dx translate<cr>",                                  desc = "Range DX Translate", },
      { "<leader>d",  group = "Debug", },
      { "<leader>dK", '<cmd>lua require("dap.ui.variables").visual_hover()<cr>', desc = "Range Hover" },
    },
  }
  local t_mappings = {
    { "<leader>b", group = " TERMINAL" },
    -- { "<leader>bk", "<C-\\><C-n><cmd>ToggleTerm direction=float<CR>", desc = "Terminal Float" },
    { "<leader>bm", "<C-\\><C-n><cmd>ToggleTerm direction=float<CR>", desc = "Terminal Float" },
    { "<leader>bv", "<C-\\><C-n><cmd>ToggleTerm size=50 direction=vertical<cr>", desc = "Terminal Side" },
    { "<leader>b,", "<C-\\><C-n><cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Terminal Bottom" },
    { "<leader>b1", "<C-\\><C-n><cmd>1ToggleTerm<cr>", desc = "Terminal 1" },
    { "<leader>b2", "<C-\\><C-n><cmd>2ToggleTerm<cr>", desc = "Terminal 2" },
    { "<leader>b3", "<C-\\><C-n><cmd>3ToggleTerm<cr>", desc = "Terminal 3" },
    { "<leader>b4", "<C-\\><C-n><cmd>4ToggleTerm<cr>", desc = "Terminal 4" },
  }

  local g_mappings = {
    { "<leader>c", group = "// COMMENTS" },
    { "<leader>cB", group = "□ COMMENT BOX" },
    { "<leader>cbb", "<Cmd>CBccbox<CR>", desc = "Box Title" },
    { "<leader>cbd", "<Cmd>CBd<CR>", desc = "Remove a box" },
    { "<leader>cbl", "<Cmd>CBline<CR>", desc = "Simple Line" },
    { "<leader>cbm", "<Cmd>CBllbox14<CR>", desc = "Marked" },
    { "<leader>cbt", "<Cmd>CBllline<CR>", desc = "Titled Line" },
  }

  local n_mappings = {
    { "<leader><leader>", group = "Shadovim" },
    { "<leader><leader>u", "<cmd>ShadovimUpdate<cr>", desc = "Update Shadovim" },
    { "<leader><leader>m", "<cmd>ShadovimCheckMason<cr>", desc = "Check Mason" },
    { "<leader><leader>r", "<cmd>source ~/.config/nvim/init.lua<cr>", desc = "Reload Config" },
    { "<leader><leader>s", "<cmd>Fidget suppress<cr>", desc = "Suppress Notifications" },
    { "<leader><leader>c", "<cmd>Fidget clear<cr>", desc = "Clear Notifications" },
    { "<leader><leader>l", "<cmd>Fidget lsp_suppress<cr>", desc = "Suppress LSP Notifications" },

    -- { "<leader>D", group = "Dioxus" },
    -- { "<leader>Dx", "<cmd>%!dx translate<cr>", desc = "DX Translate File" },

    { "<leader>P", group = " POMO" },
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

    { "<leader>b", group = " BUFFERS" },
    { "<leader>b,", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Terminal Bottom" },
    { "<leader>b1", "<cmd>1ToggleTerm<cr>", desc = "Terminal 1" },
    { "<leader>b2", "<cmd>2ToggleTerm<cr>", desc = "Terminal 2" },
    { "<leader>b3", "<cmd>3ToggleTerm<cr>", desc = "Terminal 3" },
    { "<leader>b4", "<cmd>4ToggleTerm<cr>", desc = "Terminal 4" },
    { "<leader>bb", "<cmd>bn<CR>", desc = "Next" },
    { "<leader>bf", "<cmd>set shiftwidth=4 | set tabstop=4 | set softtabstop=4<CR>", desc = "Fix Spacing" },
    { "<leader>bk", "<cmd>lua MiniBufremove.delete()<CR>", desc = "Delete" },
    { "<leader>bl", "<cmd>ls<CR>", desc = "List" },
    { "<leader>bm", "<cmd>ToggleTerm direction=float<CR>", desc = "Terminal Float" },
    { "<leader>bn", "<cmd>bp<CR>", desc = "Prev" },
    { "<leader>bu", "<cmd>lua MiniBufremove.unshow<CR>", desc = "Unload" },
    { "<leader>bv", "<cmd>ToggleTerm size=50 direction=vertical<cr>", desc = "Terminal Side" },

    { "<leader>d", group = " DEBUG" },
    { "<leader>dK", '<cmd>lua require("dap.ui.widgets").hover()<CR>', desc = "Hover" },
    { "<leader>db", '<cmd>lua require("dap").toggle_breakpoint()<CR>', desc = "Breakpoint" },
    { "<leader>dc", '<cmd>lua require("dap").continue()<CR>', desc = "Continue" },
    { "<leader>df", '<cmd>lua require("dapui").float_element()<CR>', desc = "Float" },
    { "<leader>dj", '<cmd>lua require("dap").down()<CR>', desc = "Down STrace" },
    { "<leader>dk", '<cmd>lua require("dap").up()<CR>', desc = "Up STrace" },
    { "<leader>dl", '<cmd>lua require("dap").run_last()<CR>', desc = "Run Last" },
    { "<leader>dp", '<cmd>lua require("dap.ui.widgets").preview()<CR>', desc = "Preview" },
    { "<leader>dq", '<cmd>lua require("dap").terminate()<CR>', desc = "Terminate" },
    { "<leader>ds", group = " STEP" },
    { "<leader>du", '<cmd>lua require("dapui").toggle()<CR>', desc = "UI" },
    { "<leader>dsi", '<cmd>lua require("dap").step_into()<CR>', desc = "Into" },
    { "<leader>dso", '<cmd>lua require("dap").step_over()<CR>', desc = "Over" },
    { "<leader>dsx", '<cmd>lua require("dap").step_out()<CR>', desc = "Out" },

    { "<leader>f", group = " FILES" },
    { "<leader>fe", "<cmd>Neotree toggle<CR>", desc = "Neo-Tree" },
    { "<leader>fj", "<cmd>lua require('jot').toggle()<CR>", desc = "Jot" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent" },

    { "<leader>g", group = "󰊢 GIT" },
    { "<leader>gB", "<cmd>Gitsigns blame_line{full=true}<cr>", desc = "Blame Line Full" },
    { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
    { "<leader>gS", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
    { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame Line" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
    { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
    { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
    { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
    { "<leader>gm", "<cmd>Telescope git_commits<cr>", desc = "Checkout Commit" },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open Changed File" },
    { "<leader>gc", "<cmd>Telescope git_branches<cr>", desc = "Checkout Branch" },
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazygit" },
    { "<leader>gG", "<cmd>LazyGitConfig<cr>", desc = "Lazygit Config" },

    { "<leader>l", group = " LSP" },
    { "<leader>lA", "<cmd>AerialToggle", desc = "Aerial" },
    { "<leader>lN", "<cmd>AerialNavToggle", desc = "Aerial Nav" },
    { "<leader>ln", "<cmd>Navbuddy", desc = "Navbuddy" },
    { "<leader>lI", "<cmd>LspInfo<cr>", desc = "Info" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
    { "<leader>lu", "<cmd>TSUpdate<cr>", desc = "Treesitter Update" },
    { "<leader>li", "<cmd>TSInstallInfo<cr>", desc = "Treesitter Info" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", desc = "Next Diagnostic" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "Prev Diagnostic" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },

    { "<leader>m", group = " MISC" },
    { "<leader>mm", "<cmd>lua MiniMap.toggle()<CR>", desc = "Minimap" },
    { "<leader>mR", "<cmd>lua MiniMap.refresh()<CR>", desc = "Refresh Minimap" },
    { "<leader>mt", "<cmd>lua MiniTrailspace.trim()<CR>", desc = "Trim Trailspace" },

    { "<leader>n", group = " NEOGEN" },
    { "<leader>nc", "<cmd>Neogen class<CR>", desc = "Class" },
    { "<leader>nt", "<cmd>Neogen type<CR>", desc = "Type" },
    { "<leader>nf", "<cmd>Neogen func<CR>", desc = "Function" },
    { "<leader>nl", "<cmd>Neogen file<CR>", desc = "File" },
    { "<leader>nn", "<cmd>Neogen<CR>", desc = "Any" },

    { "<leader>o", group = " OPTIONS" },
    { "<leader>on", "<cmd>lua require('shadovim.config.utils').toggle_option('number')<cr>", desc = "Number" },
    { "<leader>oo", "<cmd>Ranger<cr>", desc = "Ranger" },
    { "<leader>or", "<cmd>lua require('shadovim.config.utils').toggle_option('relativenumber')<cr>", desc = "Relative Number" },
    { "<leader>os", "<cmd>lua require('shadovim.config.utils').toggle_option('spell')<cr>", desc = "Spell" },
    { "<leader>ow", "<cmd>lua require('shadovim.config.utils').toggle_option('wrap')<cr>", desc = "Wrap" },

    { "<leader>p", group = "󰏖 LAZY" },
    { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install" },
    { "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync" },
    { "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update" },
    { "<leader>pC", "<cmd>Lazy clean<cr>", desc = "Clean" },
    { "<leader>pS", "<cmd>Lazy show<cr>", desc = "Status" },
    { "<leader>pc", "<cmd>Lazy log<cr>", desc = "Log" },

    { "<leader>s", group = " SESSION" },
    { "<leader>ss", function() require("resession").save() end, desc = "Save" },
    { "<leader>sl", function() require("resession").load() end, desc = "Load" },
    { "<leader>sd", function() require("resession").delete() end, desc = "Delete" },

    { "<leader>t", group = " TELESCOPE" },
    { "<leader>tH", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
    { "<leader>tM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>tR", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>tc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    { "<leader>tj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
    { "<leader>tk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>tm", "<cmd>Telescope macroscope<cr>", desc = "Macros" },
    { "<leader>tn", "<cmd>Telescope noice<cr>", desc = "Noice Messages" },
    { "<leader>to", "<cmd>Telescope harpoon marks<cr>", desc = "Harpoon" },
    { "<leader>tp", "<cmd>Telescope projects<cr>", desc = "Projects" },
    { "<leader>tr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    { "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>tu", "<cmd>Telescope undo<cr>", desc = "Undo" },
    { "<leader>tw", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
    { "<leader>ty", "<cmd>Telescope neoclip<cr>", desc = "Clipboard" },

    { "<leader>w", group = " WINDOWS" },
    { "<leader>wh", "<C-w>s", desc = "Horizontal Split" },
    { "<leader>wv", "<C-w>v", desc = "Vertical Split" },
    { "<leader>we", "<C-w>=", desc = "Make Splits Equal" },
    { "<leader>wq", "<cmd>close<CR>", desc = "Close Split" },
  }

  local wk = require("which-key")
  wk.add(m_mappings, { silent = true, noremap = true, nowait = true, mode = "n" })
  wk.add(n_mappings, { silent = true, noremap = true, nowait = true, mode = "n" })
  wk.add(g_mappings, { silent = true, noremap = true, nowait = true, mode = "n" })
  wk.add(v_mappings, { silent = true, noremap = true, nowait = true, mode = "v" })
  wk.add(t_mappings, { silent = true, noremap = true, nowait = true, mode = "t" })
end

--------------------------------------------------------------------------------

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Selection
map("n", "<C-a>", "ggVG", opts, { desc = "Select All" })

-- Save/Quit
map("n", "<C-s>", ":silent w<CR>", opts, { desc = "Save" })
map("i", "<C-s>", "<ESC>:silent w<CR>", opts, { desc = "Save (Insert)" })
map("n", "<Leader>q", ":qa!<CR>", opts, { desc = "Quit" })

-- Moving Text
map({ "n", "i" }, "<C-Up>", "<Esc>:m-2<CR>", opts, { desc = "Move Line Up" })
map({ "n", "i" }, "<C-Down>", "<Esc>:m+<CR>", opts, { desc = "Move Line Down" })
map("x", "<C-Up>", ":m '<-2<CR>gv-gv", opts, { desc = "Move Selection Up" })
map("x", "<C-Down>", ":m '>+1<CR>gv-gv", opts, { desc = "Move Selection Down" })
map("v", "<F3>", "y<c-w>wp<c-w>gv", opts, { desc = "Copy text from current split to next" })
map("v", "<F4>", "d<c-w>wp<c-w>gv", opts, { desc = "Move text from current split to next" })

-- Resizing
map("n", "<Up>", ":resize +2<CR>", opts, { desc = "Resize Window Up" })
map("n", "<Down>", ":resize -2<CR>", opts, { desc = "Resize Window Down" })
map("n", "<Left>", ":vertical resize +2<CR>", opts, { desc = "Resize Window Left" })
map("n", "<Right>", ":vertical resize -2<CR>", opts, { desc = "Resize Window Right" })

-- General Movement
-- map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true }, { desc = "Move Cursor Down (Allow Wrapped)" })
-- map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true }, { desc = "Move Cursor Up (Allow Wrapped)" })
map("n", "<C-h>", "<C-w>h", opts, { desc = "Move Cursor Left Buffer" })
map("n", "<C-j>", "<C-w>j", opts, { desc = "Move Cursor Down Buffer" })
map("n", "<C-k>", "<C-w>k", opts, { desc = "Move Cursor Up Buffer" })
map("n", "<C-l>", "<C-w>l", opts, { desc = "Move Cursor Right Buffer" })
map("i", "<C-j>", "<Down>", opts, { desc = "Move Cursor Down in Insert Mode" })
map("i", "<C-k>", "<Up>", opts, { desc = "Move Cursor Up in Insert Mode" })
map("i", "<C-h>", "<Left>", opts, { desc = "Move Cursor Left in Insert Mode" })
map("i", "<C-l>", "<Right>", opts, { desc = "Move Cursor Right in Insert Mode" })

map("n", "s", ":HopChar1<cr>", opts)
map("n", "S", ":HopPattern<cr>", opts)

map({ "n", "o" }, "f",
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>",
  opts)
map({ "n", "o" }, "F",
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>",
  opts)
map({ "n", "o" }, "t",
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>",
  opts)
map({ "n", "o" }, "T",
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>",
  opts)

-- Split Management
map("t", "<C-S-h>", "<C-\\><C-N><C-w>h", opts, { desc = "Move out of terminal to split left" })
map("t", "<C-S-j>", "<C-\\><C-N><C-w>j", opts, { desc = "Move out of terminal to split up" })
map("t", "<C-S-k>", "<C-\\><C-N><C-w>k", opts, { desc = "Move out of terminal to split down" })
map("t", "<C-S-l>", "<C-\\><C-N><C-w>l", opts, { desc = "Move out of terminal to split right" })
map("n", "<leader>h", "<C-w>h", opts, { desc = "Move to split left" })
map("n", "<leader>l", "<C-w>l", opts, { desc = "Move to split up" })
map("n", "<leader>j", "<C-w>j", opts, { desc = "Move to split down" })
map("n", "<leader>k", "<C-w>k", opts, { desc = "Move to split right" })
map("n", "Ww", "<C-w>c", opts, { desc = "Close split" })
map("n", "Wb", "<C-w>=", opts, { desc = "Balance splits" })

-- Buffers
map("n", "<C-S-j>", ":CybuLastusedNext<cr>", opts, { desc = "Cybu goto last next buffer" })
map("n", "<C-S-k>", ":CybuLastusedPrev<cr>", opts, { desc = "Cybu goto last prev buffer" })
map("n", "<TAB>", ":CybuLastusedNext<cr>", opts, { desc = "Cybu goto last next buffer" })
map("n", "<S-TAB>", ":CybuLastusedPrev<cr>", opts, { desc = "Cybu goto last prev buffer" })
map("n", "<c-i>", "<c-i>", opts)
map("n", "<leader><cr>", "<cmd>Bufala split<cr>", opts, { desc = "Stack split" })
map("n", "<leader>J", ":JABSOpen<CR>", opts, { desc = "Open JABS" })

-- Tabs
--- Switch Tab
for i, sym in ipairs({ "!", "@", "#", "$", "%", "^", "&", "*", "(" }) do
  map("n", "<leader>" .. sym, "<cmd>Tabbot send " .. i .. "<cr>", opts, { desc = "Send to Tab " .. i })
end
for i = 1, 9 do
  map("n", "<leader>" .. i, "<cmd>Tabbot go " .. i .. "<cr>", opts, { desc = "Goto Tab " .. i })
end

-- Searching
map("n", "<Enter>", "<cmd>nohlsearch<CR>", opts, { desc = "Clear Highlight" })
map("n", "n", "nzzzv", opts, { desc = "Center screen on search" })
map("n", "N", "Nzzzv", opts, { desc = "Center screen on search back" })
map("n", "<leader>R", "<esc><esc>:%s///gcI<left><left><left><left><left>", opts, { desc = "Search and Replace" })

-- Telescope
map("n", "<C-f>", "<esc><cmd>Telescope find_files<cr>", opts, { desc = "Telescope find files" })
map("i", "<C-f>", "<esc><cmd>Telescope live_grep<cr>", opts, { desc = "Telescope live grep" })
map("n", "<C-A-f>", "<esc><esc><C-w>v<cmd>Telescope find_files<CR>", opts, { desc = "Telescope find files in new split" })

-- Debugging
map("n", "<F11>", '<cmd>lua require("dap").step_into()<CR>', opts, { desc = "Debugger step into" })
map("n", "<F10>", '<cmd>lua require("dap").step_over()<CR>', opts, { desc = "Debugger step over" })
map("n", "<F9>", '<cmd>lua require("dap").step_out()<CR>', opts, { desc = "Debugger step out" })

-- Miscellaneous
map("n", "<F3>", ":set invnumber invrelativenumber<CR>", opts, { desc = "Toggle Line Numbers" })
map("n", "<leader>A", ":Alpha<CR>", opts, { desc = "Open Alpha" })
map("n", "<leader>V", ":ToggleVenn<CR>", opts, { desc = "Toggle Venn Mode" })

map("n", "<Leader><TAB>",
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false, no_ignore=true, follow=true, hidden=true})<cr>",
  opts)
vim.cmd([[imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")]])

-- Renaming
vim.api.nvim_set_keymap("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

return M
