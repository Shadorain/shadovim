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

-- Undo breakpoints
-- map('i', ',', ',<c-q>u')
-- map('i', '.', '.<c-q>u')
-- map('i', '!', '!<c-q>u')
-- map('i', '?', '?<c-q>u')

-- Moving text
map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')
map('i', '<C-j>', '<esc>:m .+1<CR>==')
map('i', '<C-k>', '<esc>:m .-2<CR>==')
map('n', '<leader>j', ':m .+1<CR>==')
map('n', '<leader>k', ':m .-2<CR>==')

-- Copy to end of line
map('n', 'Y', 'y$')

-- Reverse Join ('J')
map('n', '<C-j>', 'ddkPJ')
--- }}}
--- Splits {{{
-- Resizing
map('n', '<Up>',    ':resize +2<CR>', { noremap = true, silent = true })
map('n', '<Down>',  ':resize -2<CR>', { noremap = true, silent = true })
map('n', '<Left>',  ':vertical resize +2<CR>', { noremap = true, silent = true })
map('n', '<Right>', ':vertical resize -2<CR>', { noremap = true, silent = true })

-- Split Management
map('t', '<C-A-h>', '<C-\\><C-N><C-w>h')
map('t', '<C-A-h>', '<C-\\><C-N><C-w>j')
map('t', '<C-A-h>', '<C-\\><C-N><C-w>k')
map('t', '<C-A-h>', '<C-\\><C-N><C-w>l')
map('i', '<C-A-h>', '<esc><C-w>h')
map('i', '<C-A-h>', '<esc><C-w>j')
map('i', '<C-A-h>', '<esc><C-w>k')
map('i', '<C-A-h>', '<esc><C-w>l')
map('n', '<C-A-h>', '<C-w>h')
map('n', '<C-A-h>', '<C-w>j')
map('n', '<C-A-h>', '<C-w>k')
map('n', '<C-A-h>', '<C-w>l')
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>l', '<C-w>l')

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
--- }}}
--- Compilation/Debug/Program Management {{{
map('n', '<Leader>cb', ':Cargo build<CR>')
map('n', '<Leader>cr', ':Cargo run<CR>')
map('n', '<Leader>cc', ':Cargo check<CR>')
--- }}}
-- [[ Leader / Plugin Bindings ]] ------------------------------------------- ]]
--- Misc {{{
-- Search and Replace
map('n', '<leader>R', '<esc><esc>:%s///gcI<left><left><left><left><left>')

-- Redraw highlights
map('n', '<leader>r', ':nohl<CR>:redraw!<CR>')

-- Open
map('n', '<leader>S', ':Startify<CR>') -- Startify
map('n', '<leader>T', ':tabnew<CR>')   -- New tab

-- Transparent Button
map('n', '<leader>i', ':TransparentToggle<CR>', { noremap = true, silent = true }) 

-- File Browser
map('n', '<leader>fr', ':lua require("mod").file_browser()<CR>', { noremap = true, silent = true }) 
--- }}}
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

-- Buffer menu
cmd('set wildchar=<Tab> wildmenu wildmode=full')
--- }}}
--- Plugins {{{
map('n', '<leader>G', ':Goyo<CR>')
map('n', '<leader>tht', ':TSHighlightCapturesUnderCursor<CR>')
---- Tabline {{{
map('n', '<leader>tt', ':TablineTabNew<CR>', { noremap = true, silent = true })
map('n', '<leader>tr', ':TablineTabRename ', { noremap = true })
---- }}}
---- Debugging {{{
map('n', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>', { noremap = true, silent = true })
map('n', '<leader>dB', ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { noremap = true, silent = true })
map('n', '<leader>dL', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { noremap = true, silent = true })
map('n', '<leader>dc', ':lua require("dap").continue()<CR>', { noremap = true, silent = true })
map('n', '<leader>dsi', ':lua require("dap").step_into()<CR>', { noremap = true, silent = true })
map('n', '<leader>dso', ':lua require("dap").step_over()<CR>', { noremap = true, silent = true })
map('n', '<leader>dsx', ':lua require("dap").step_out()<CR>', { noremap = true, silent = true })
map('n', '<leader>dr', ':lua require("dap").repl_open()<CR>', { noremap = true, silent = true })
map('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { noremap = true, silent = true })
map('n', '<leader>dui', ':lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
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
map('n', '<C-f>', '<esc><cmd>Telescope find_files<cr>')
map('n', '<C-A-f>', '<esc><esc><C-w>v<cmd>Telescope find_files<CR>')
map('i', '<C-f>', '<esc><cmd>Telescope live_grep<cr>')
map('n', '<leader>bv', '<esc><cmd>Telescope buffers<cr>')
map('n', '<C-b>', '<esc><cmd>Telescope buffers<cr>')
map('n', '<leader>bc', '<esc><cmd>Telescope git_commits<cr>')

map('n', '<leader>tf',  '<cmd>Telescope find_files<cr>')
map('n', '<leader>tp',  '<cmd>Telescope projects<cr>')
map('n', '<leader>tgr', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>tb',  '<cmd>Telescope buffers<cr>')
map('n', '<leader>tgc', '<cmd>Telescope git_commits<cr>')
map('n', '<leader>tgd', '<cmd>lua require("mod").git_diff()<cr>')
map('n', '<leader>tgb', '<cmd>Telescope git_bcommits<cr>')
map('n', '<leader>tbt', '<cmd>Telescope current_buffer_tags<cr>')
map('n', '<leader>thl', '<cmd>Telescope highlights<cr>')
map('n', '<leader>tk',  '<cmd>Telescope keymaps<cr>')
map('n', '<leader>tm',  '<cmd>Telescope man_pages<cr>')
---- }}}
--- }}}
-- [[ ----------------------------------------------------------------------- ]]
