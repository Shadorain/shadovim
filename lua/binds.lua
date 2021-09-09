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
map('n', 'n', 'nzzzv:Beacon<CR>', { noremap = true, silent = true })
map('n', 'N', 'Nzzzv:Beacon<CR>', { noremap = true, silent = true })
-- map('n', 'J', 'mzJ\'z')

-- Show cursor
map('n', 'Q', ':Beacon<CR>', { noremap = true, silent = true })

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
---- Telescope {{{
map('n', '<C-f>', '<esc><cmd>Telescope find_files<cr>')
map('n', '<leader>fr', '<esc><cmd>Telescope find_files<cr>')
map('n', '<C-A-f>', '<esc><esc><C-w>v<cmd>Telescope find_files<CR>')
map('i', '<C-f>', '<esc><cmd>Telescope live_grep<cr>')
map('n', '<leader>bv', '<esc><cmd>Telescope buffers<cr>')
map('n', '<C-b>', '<esc><cmd>Telescope buffers<cr>')
map('n', '<leader>bc', '<esc><cmd>Telescope git_commits<cr>')
---- }}}
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
-- [[ Leader / Plugin Bindings ]] ------------------------------------------- ]]
--- Misc {{{
-- Search and Replace
map('n', '<leader>R', '<esc><esc>:%s///gcI<left><left><left><left><left>')

-- Redraw highlights
map('n', '<leader>r', ':nohl<CR>:redraw!<CR>')

-- Open
map('n', '<leader>S', ':Startify<CR>') -- Startify
map('n', '<leader>T', ':tabnew<CR>')   -- New tab
--- }}}
--- Buffers {{{
map('n', '<leader>bl', ':ls<CR>', { noremap = true, silent = true })
map('n', '<leader>bb', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<leader>bn', ':bprevious<CR>', { noremap = true, silent = true })
-- map('n', '<leader>bk', ':bp \\|bd # <CR>', { noremap = true, silent = true })
map('n', '<leader>bk', ':bd<CR>', { noremap = true, silent = true })
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
--vim.opt.wcm = '<C-Z>'
--- }}}
--- Plugins {{{
map('n', '<leader>G', ':Goyo<CR>')
map('n', '<leader>th', ':TSHighlightCapturesUnderCursor<CR>')
---- Floaterm {{{
map('n', '<leader>bm', ':FloatermToggle<CR>', { noremap = true, silent = true })
map('t', '<leader>bm', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true, silent = true })
map('n', '<leader>b,', ':FloatermNew --wintype=normal --height=8<CR>', { noremap = true, silent = true })
map('t', '<leader>b,', '<C-\\><C-n>:FloatermNew --wintype=normal --height=8<CR>', { noremap = true, silent = true })
map('t', '<leader>bn', '<C-\\><C-n>:FloatermPrev<CR>', { noremap = true, silent = true })
map('t', '<leader>bb', '<C-\\><C-n>:FloatermNext<CR>', { noremap = true, silent = true })
map('t', '<leader>bk', '<C-\\><C-n>:FloatermKill<CR>', { noremap = true, silent = true })
---- }}}
---- Commentary {{{
map('n', '<leader>//', ':Commentary<CR>')
---- }}}
-- ---- C Lang {{{
-- -- CScope
-- map('n', '<leader>ss', '<esc>:cs find s <C-R>=expand("<cword>")<CR><CR>')
-- map('n', '<leader>sc', '<esc>:cs find c <C-R>=expand("<cword>")<CR><CR>')
-- map('n', '<leader>sg', '<esc>:cs find g <C-R>=expand("<cword>")<CR><CR>')
-- map('n', '<leader>se', '<esc>:cs find e <C-R>=expand("<cword>")<CR><CR>')
-- map('n', '<leader>sf', '<esc>:cs find f <C-R>=expand("<cword>")<CR><CR>')
-- map('n', '<leader>si', '<esc>:cs find i ^<C-R>=expand("<cword>")<CR><CR>')
-- map('n', '<leader>sd', '<esc>:cs find d <C-R>=expand("<cword>")<CR><CR>')

-- map('n', '<leader>sss', '<esc>:scs find s <C-R>=expand("<cword>")<CR><CR>')
-- map('n', '<leader>ssc', '<esc>:scs find c <C-R>=expand("<cword>")<CR><CR>')
-- map('n', '<leader>ssg', '<esc>:scs find g <C-R>=expand("<cword>")<CR><CR>')
-- map('n', '<leader>sse', '<esc>:scs find e <C-R>=expand("<cword>")<CR><CR>')
-- map('n', '<leader>ssf', '<esc>:scs find f <C-R>=expand("<cword>")<CR><CR>')
-- map('n', '<leader>ssi', '<esc>:scs find i ^<C-R>=expand("<cword>")<CR><CR>')
-- map('n', '<leader>ssd', '<esc>:scs find d <C-R>=expand("<cword>")<CR><CR>')
-- ---- }}}
-- ---- Git Commands {{{
-- map('n', '<leader>ga', ':Gwrite<CR>')
-- map('n', '<leader>gst', ':Gstatus<CR>')
-- map('n', '<leader>gd', ':Gdiff<CR>')
-- map('n', '<leader>gc', ':Telescope git_commits<CR>')
-- map('n', '<leader>gp', ':Git push<CR>')
-- map('n', '<leader>gb', ':Gblame<CR>')
-- map('n', '<leader>gB', ':Gbrowse<CR>')
-- map('n', '<leader>glo', ':Git log<CR>')
-- map('n', '<leader>gl', ':Git pull<CR>')
-- map('n', '<leader>gr', ':GRemove<CR>')
-- map('n', '<leader>gt', ':GitGutterSignsToggle<CR>')
-- map('n', '<leader>gs', '<Plug>(GitGutterStageHunk)<CR>')
-- map('n', '<leader>gu', '<Plug>(GitGutterUndoHunk)<CR>')
-- map('n', '<leader>gv', ':GV<CR>')
-- map('n', '<leader>gV', ':GV!<CR>')
-- ---- }}}
-- ---- Calendar {{{
-- map('n', '<leader>car', ':CalendarVR<CR>')
-- map('n', '<leader>cab', ':CalendarH<CR>')
-- map('n', '<leader>caf', ':CalendarT<CR>')
-- ---- }}}
-- ---- VimWiki {{{
-- map('n', '<leader>wb', ':VimWikiTabIndex<CR>')
-- map('n', 'leader>wd', ':VimwikiDeleteLink<CR>')
-- map('n', 'leader>wh', ':Vimwiki2HTML<CR>')
-- map('n', 'leader>whh', ':Vimwiki2HTMLBrowse<CR>')
-- map('n', 'leader>wi', ':VimwikiDiaryIndex<CR>')
-- map('n', 'leader>wr', ':VimwikiRenameLink<CR>')
-- map('n', 'leader>ws', ':VimwikiUISelect<CR>')
-- map('n', 'leader>wb', ':VimwikiTabIndex<CR>')
-- map('n', 'leader>ww', ':VimwikiIndex<CR>')
-- map('n', 'leader>wg', ':VimwikiDiaryGenerateLinks<CR>')
-- map('n', 'leader>wtt', ':n ~/.vimwiki/Life/TODO.md<CR>')
-- map('n', 'leader>wtc', ':VimwikiToggleListItem^ddmaGo\<Esc>pI\<right>\<right>~~\<Esc>A~~\<Esc>^db'a<CR>')
-- "}}}
--- }}}
-- [[ ----------------------------------------------------------------------- ]]
