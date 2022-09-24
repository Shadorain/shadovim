--[[ ========================================================================
"    _________.__                .___    ___.   .__            .___      
"   /   _____/|  |__ _____     __| _/____\_ |__ |__| ____    __| _/______
"   \_____  \ |  |  \\__  \   / __ |/  _ \| __ \|  |/    \  / __ |/  ___/
"   /        \|   Y  \/ __ \_/ /_/ (  <_> ) \_\ \  |   |  \/ /_/ |\___ \ 
"  /_______  /|___|  (____  /\____ |\____/|___  /__|___|  /\____ /____  >
"          \/      \/     \/      \/          \/        \/      \/    \/ 
" =========================================================================== ]]
--- Setup {{{
function keymap(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local map = keymap
local cmd = vim.cmd
--- }}}
-- [[ General Bindings ]] --------------------------------------------------- ]]
--- Utility {{{
-- Keep screen centered
map('n', 'n', 'nzzzv:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
map('n', 'N', 'Nzzzv:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
-- map('n', 'J', 'mzJ\'z')

-- Show cursor
map('n', 'Q', ':lua require("specs").show_specs()<CR>', { noremap = true, silent = true })

-- Moving text
map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')
-- map('i', '<C-j>', '<esc>:m .+1<CR>==')
-- map('i', '<C-k>', '<esc>:m .-2<CR>==')
-- map('n', '<leader>j', ':m .+1<CR>==')
-- map('n', '<leader>k', ':m .-2<CR>==')

-- Copy to end of line
map('n', 'Y', 'y$')

-- Reverse Join ('J')
-- map('n', '<C-j>', 'ddkPJ')

-- Source Config
map('n', '<C-q>', ':source ~/.config/nvim/init.lua<CR>')

-- Save
map('n', '<C-s>', ':w<CR>')
--- }}}
--- Splits {{{
-- Resizing
map('n', '<Up>',    ':resize +2<CR>', { noremap = true, silent = true })
map('n', '<Down>',  ':resize -2<CR>', { noremap = true, silent = true })
map('n', '<Left>',  ':vertical resize +2<CR>', { noremap = true, silent = true })
map('n', '<Right>', ':vertical resize -2<CR>', { noremap = true, silent = true })

-- Split Management
map('t', '<C-A-h>', '<C-\\><C-N><C-w>h')
map('t', '<C-A-j>', '<C-\\><C-N><C-w>j')
map('t', '<C-A-k>', '<C-\\><C-N><C-w>k')
map('t', '<C-A-l>', '<C-\\><C-N><C-w>l')
map('i', '<C-A-h>', '<esc><C-w>h')
map('i', '<C-A-j>', '<esc><C-w>j')
map('i', '<C-A-k>', '<esc><C-w>k')
map('i', '<C-A-l>', '<esc><C-w>l')
map('n', '<C-A-h>', '<C-w>h')
map('n', '<C-A-j>', '<C-w>j')
map('n', '<C-A-k>', '<C-w>k')
map('n', '<C-A-l>', '<C-w>l')
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>l', '<C-w>l')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')

-- Close + Balance
map('n', 'Ww', '<C-w>c')
map('n', 'Wb', '<C-w>=')
--- }}}
--- Misc {{{
-- Copies/Moves selected text to next split
map('v', '<F3>', 'y<c-w>wp<c-w>gv')
map('v', '<F4>', 'd<c-w>wp<c-w>gv')

-- Turns off line numbers
map('n', '<F3>', ':set invnumber invrelativenumber<CR>')

-- Place semi-colon at EOL
map('i', ';;', '<Esc>A;<Esc>')

-- Moves cursor to next position or further
cmd("inoremap <expr> <C-l> getline('.')[col('.')-1] =~? '[]>)}''\"`]' ? '<Right>' : '<Right>'")

-- Search and Replace
map('n', '<leader>R', '<esc><esc>:%s///gcI<left><left><left><left><left>')

-- Redraw highlights
map('n', '<leader>r', ':nohl<CR>:redraw!<CR>')

-- Open
map('n', '<leader>S',  ':Startify<CR>',   { noremap = true, silent = true }) -- Startify
map('n', '<leader>ss', ':SSave!<CR><CR>', opts) -- Save Session

-- Tabs
map('n', '<leader>T',  ':tabnew %<CR>', { noremap = true, silent = true }) -- New tab
map('n', '<leader>tt', ':tabnew %<CR>', { noremap = true, silent = true }) -- New tab
map('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true }) -- Close tab
map('n', '<leader>to', ':tabonly<CR>',  { noremap = true, silent = true }) -- Close all but open tab

-- Transparent Button
map('n', '<leader>i', ':TransparentToggle<CR>', { noremap = true, silent = true }) 
--- }}}
--- Compilation/Debug/Program Management {{{
map('n', '<Leader>cb', ':Cargo build<CR>')
map('n', '<Leader>cr', ':Cargo run<CR>')
map('n', '<Leader>cc', ':Cargo check<CR>')
--- }}}
-- [[ Leader / Plugin Bindings ]] ------------------------------------------- ]]
--- Buffers {{{
map('n', '<leader>bl', ':ls<CR>',  { noremap = true, silent = true })
map('n', '<leader>bb', ':bn<CR>',  { noremap = true, silent = true })
map('n', '<leader>bn', ':bp<CR>',  { noremap = true, silent = true })
map('n', '<leader>bk', ':BD<CR>',  { noremap = true, silent = true }) -- delete from list
map('n', '<leader>bu', ':BUN<CR>', { noremap = true, silent = true }) -- unload mem
map('n', '<leader>b1', ':b 1<CR>', { noremap = true, silent = true })
map('n', '<leader>b2', ':b 2<CR>', { noremap = true, silent = true })
map('n', '<leader>b3', ':b 3<CR>', { noremap = true, silent = true })
map('n', '<leader>b4', ':b 4<CR>', { noremap = true, silent = true })
map('n', '<leader>b5', ':b 5<CR>', { noremap = true, silent = true })
map('n', '<leader>b6', ':b 6<CR>', { noremap = true, silent = true })
map('n', '<leader>b7', ':b 7<CR>', { noremap = true, silent = true })
map('n', '<leader>b8', ':b 8<CR>', { noremap = true, silent = true })
map('n', '<leader>b9', ':b 9<CR>', { noremap = true, silent = true })

-- Colortils
map('n', '<leader>cp', ':Colortils picker<CR>', { noremap = true, silent = true })
map('n', '<leader>cg', ':Colortils gradient<CR>', { noremap = true, silent = true })
map('n', '<leader>cd', ':Colortils darken<CR>', { noremap = true, silent = true })
map('n', '<leader>cl', ':Colortils lighten<CR>', { noremap = true, silent = true })
--- }}}
-- Buffer menu
cmd('set wildchar=<Tab> wildmenu wildmode=full')
--- }}}
--- Plugins {{{
---- Treesitter Playground {{{
map('n', '<leader>tht', ':TSHighlightCapturesUnderCursor<CR>', { noremap = true, silent = true })
---- }}}
---- Nvim-Tree {{{
map('n', '<leader>fe', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
---- }}}
---- Lir {{{
map('n', '<leader>fr', ':lua require("lir.float").toggle()<CR>', { noremap = true, silent = true }) 
---- }}}
---- Peek {{{
map('n', '<leader>p', ':lua require("peek").Peek("definition")<CR>', { noremap = true, silent = true }) 
---- }}}
---- JABS {{{
map('n', '<leader>J', ':JABSOpen<CR>', { noremap = true, silent = true })
---- }}}
---- Zen-Mode {{{
local status_ok, zen = pcall(require, "zen-mode")
if status_ok then
  map('n', '<leader>Z', ':lua require("zen-mode").toggle()<CR>', { noremap = true, silent = true })
end
---- }}}
-- Browse
map('n', '<leader>Bi', ':BrowseInput<CR>',           { noremap = true })
map('n', '<leader>BB', ':Browse<CR>',                { noremap = true })
map('n', '<leader>Bb', ':BrowseBookmarks<CR>',       { noremap = true })
map('n', '<leader>Bd', ':BrowseDevdocs<CR>',         { noremap = true })
map('n', '<leader>Bf', ':BrowseDevdocsFiletype<CR>', { noremap = true })
map('n', '<leader>Bm', ':BrowseMdn<CR>',             { noremap = true })
--- }}}
---- Nvim-UFO {{{
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
---- }}}
---- GitSigns {{{
map('n', '<leader>gs', ':Gitsigns<CR>', { noremap = true, silent = true })
---- }}}
---- Lazygit {{{
map('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
map('n', '<leader>GG', ':LazyGitConfig<CR>', { noremap = true, silent = true })
---- }}}
---- Neogen {{{
map("n", "<Leader>nf", ":Neogen func<CR>",  { noremap = true, silent = true })
map("n", "<Leader>nt", ":Neogen type<CR>",  { noremap = true, silent = true })
map("n", "<Leader>nc", ":Neogen class<CR>", { noremap = true, silent = true })
map("n", "<Leader>nl", ":Neogen file<CR>",  { noremap = true, silent = true })
map("n", "<Leader>nn", ":Neogen<CR>",       { noremap = true, silent = true })
---- }}}
---- Harpoon {{{
map('n', 'mm', ':lua require("harpoon.mark").add_file()<CR>',        { noremap = true, silent = true })
map('n', 'm.', ':lua require("harpoon.ui").nav_next()<CR>',          { noremap = true, silent = true })
map('n', 'm,', ':lua require("harpoon.ui").nav_prev()<CR>',          { noremap = true, silent = true })
map('n', 'm;', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
---- }}}
---- Bookmarks {{{
map('n', 'mb', '<cmd>BookmarkToggle<CR>',   { noremap = true, silent = true })
map('n', 'mA', '<cmd>BookmarkAnnotate<CR>', { noremap = true, silent = true })
map('n', 'mj', '<cmd>BookmarkNext<CR>',     { noremap = true, silent = true })
map('n', 'mk', '<cmd>BookmarkPrev<CR>',     { noremap = true, silent = true })
map('n', 'mx', '<cmd>BookmarkClearAll<CR>', opts)
map('n', 'mS', '<cmd>BookmarkShowAll<CR>',  { noremap = true, silent = true })
---- }}}
---- Hop {{{
map("n", "s", ":HopChar1<cr>", { silent = true })
map("n", "S", ":HopPattern<cr>", { silent = true })

-- map("n", "f", ":HopWordCurrentLineAC<cr>", opts)
-- map("n", "F", ":HopWordCurrentLineBC<cr>", opts)
map("o", "f", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>", opts)
map("o", "F", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", opts)
map("o", "t", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>", opts)
map("o", "T", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>", opts)

map("n", "f", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>", opts)
map("n", "F", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", opts)
map("n", "t", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>", opts)
map("n", "T", ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>", opts)
---- }}}
---- Cybu {{{
map('n', '<C-j>', '<Plug>(CybuNext)', { noremap = true, silent = true })
map('n', '<C-k>', '<Plug>(CybuPrev)', { noremap = true, silent = true })
map('n', '<C-S-j>', '<Plug>(CybuLastusedNext)', { noremap = true, silent = true })
map('n', '<C-S-k>', '<Plug>(CybuLastusedPrev)', { noremap = true, silent = true })
---- }}}
---- Tabline {{{
-- map('n', '<leader>tt', ':TablineTabNew<CR>', { noremap = true, silent = true })
-- map('n', '<leader>tr', ':TablineTabRename ', { noremap = true })
---- }}}
---- Debugging {{{
map('n', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>', { noremap = true, silent = true })
map('n', '<leader>dB', ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { noremap = true, silent = true })
map('n', '<leader>dL', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { noremap = true, silent = true })
map('n', '<leader>dc', ':lua require("dap").continue()<CR>', { noremap = true, silent = true })
map('n', '<leader>dsi', ':lua require("dap").step_into()<CR>', { noremap = true, silent = true })
map('n', '<leader>dso', ':lua require("dap").step_over()<CR>', { noremap = true, silent = true })
map('n', '<leader>dsx', ':lua require("dap").step_out()<CR>', { noremap = true, silent = true })
map('n', '<leader>dj', ':lua require("dap").down()<CR>', { noremap = true, silent = true })
map('n', '<leader>dk', ':lua require("dap").up()<CR>', { noremap = true, silent = true })
map('n', '<leader>dr', ':lua require("dap").repl_open()<CR>', { noremap = true, silent = true })
map('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { noremap = true, silent = true })
map('n', '<leader>dui', ':lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
map('n', '<leader>dK', ':lua require("dap.ui.variables").hover()<CR>', { noremap = true, silent = true })
map('n', '<leader>d{', ':lua require("dap.ui.variables").scopes()<CR>', { noremap = true, silent = true })
map('n', '<leader>di', ':lua require("dap.ui.widgets").hover()', { noremap = true, silent = true })
map('n', '<leader>d_', ':lua require("dap").disconnect();require("dap").stop();require("dap").run_last()<CR>', { noremap = true, silent = true })
map('n', '<leader>d?', ':lua local widgets=require("dap.ui.widgets");widgets.centered_float(widgets.scopes)<CR>', { noremap = true, silent = true })

map('v', '<leader>dK', ':lua require("dap.ui.variables").visual_hover()<CR>', { noremap = true, silent = true })
---- }}}
---- Floaterm {{{
map('n', '<leader>bm', ':FloatermToggle<CR>', { noremap = true, silent = true })
map('t', '<leader>bm', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true, silent = true })
map('n', '<leader>b,', ':FloatermNew --wintype=normal --height=8<CR>', { noremap = true, silent = true })
map('t', '<leader>b,', '<C-\\><C-n>:FloatermNew --wintype=normal --height=8<CR>', { noremap = true, silent = true })
map('t', '<leader>bn', '<C-\\><C-n>:FloatermPrev<CR>', { noremap = true, silent = true })
map('t', '<leader>bb', '<C-\\><C-n>:FloatermNext<CR>', { noremap = true, silent = true })
map('t', '<leader>bk', '<C-\\><C-n>:FloatermKill<CR>', { noremap = true, silent = true })
---- }}}
---- Telescope {{{
map('n', '<C-f>', '<esc><cmd>Telescope find_files<cr>', { noremap = true, silent = true })
map('n', '<C-A-f>', '<esc><esc><C-w>v<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
map('i', '<C-f>', '<esc><cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
map('n', '<leader>bv', '<esc><cmd>Telescope buffers<cr>', { noremap = true, silent = true })
map('n', '<C-b>', '<esc><cmd>Telescope buffers<cr>', { noremap = true, silent = true })
map('n', '<leader>bc', '<esc><cmd>Telescope git_commits<cr>', { noremap = true, silent = true })

map('n', '<leader>tf',  '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
map('n', '<leader>tp',  '<cmd>Telescope projects<cr>', { noremap = true, silent = true })
map('n', '<leader>tgr', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
map('n', '<leader>tb',  '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
map('n', '<leader>tgc', '<cmd>Telescope git_commits<cr>', { noremap = true, silent = true })
map('n', '<leader>tgd', '<cmd>lua require("mod").git_diff()<cr>', { noremap = true, silent = true })
map('n', '<leader>tgb', '<cmd>Telescope git_bcommits<cr>', { noremap = true, silent = true })
map('n', '<leader>tbt', '<cmd>Telescope current_buffer_tags<cr>', { noremap = true, silent = true })
map('n', '<leader>thl', '<cmd>Telescope highlights<cr>', { noremap = true, silent = true })
map('n', '<leader>tk',  '<cmd>Telescope keymaps<cr>', { noremap = true, silent = true })
map('n', '<leader>tj',  '<cmd>Telescope jumplist<cr>', { noremap = true, silent = true })
map('n', '<leader>tr',  '<cmd>Telescope resume<cr>', { noremap = true, silent = true })
map('n', '<leader>tm',  '<cmd>Telescope man_pages<cr>', { noremap = true, silent = true })
---- }}}
--- }}}
-- [[ ----------------------------------------------------------------------- ]]
