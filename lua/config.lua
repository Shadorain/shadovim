--[[ ========================================================================
"   _________                _____.__           .__                
"   _   ___ \  ____   _____/ ____\__| ____     |  |  __ _______   
"  /    \  \/ /  _ \ /    \   __\|  |/ ___\    |  | |  |  \__  \  
"  \     \___(  <_> )   |  \  |  |  / /_/  >   |  |_|  |  // __ \_
"   \______  /\____/|___|  /__|  |__\___  / /\ |____/____/(____  /
"          \/            \/        /_____/  \/                 \/
" =========================================================================== ]]
local cmd = vim.cmd
-- [[ General Settings ]] --------------------------------------------------- ]]
-- {{{
--- Leader key {{{
vim.g.mapleader = " "
vim.g.maplocalleader = ','
--- }}}
--- Tab Configuration {{{
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.preserveindent = true
--- }}}
--- Numbering {{{
vim.opt.number = true
vim.opt.relativenumber = true
--- }}}
--- Misc {{{
vim.opt.path = '$PWD/**'
vim.opt.cmdheight = 2
vim.opt.showmode = false
vim.opt.conceallevel = 0
vim.opt.listchars = 'space:·'
vim.opt.virtualedit = "block"
vim.opt.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.mousefocus = true
vim.opt.ruler = true
vim.opt.inccommand = "split"

-- Folds
vim.opt.foldenable = true
vim.opt.foldmethod = 'marker'

-- Scroll margin
--vim.opt.scrolloff = 4

-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Status line
vim.opt.laststatus = 2

-- Undo
vim.opt.undofile = true
vim.opt.undodir = "/home/shadow/.local/cache/nvim/undo/"
vim.opt.backupdir= "/home/shadow/.local/cache/nvim/backups/"

cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')
--- }}}
-- }}}
-- [[ Plugin Settings ]] ---------------------------------------------------- ]]
-- {{{
-- --- Neorg {{{
-- require('neorg').setup {
--   load = {
--     ["core.defaults"] = {}, -- Enable all the default functionality
--     ["core.norg.concealer"] = {} -- Load the module responsible for converting text into icons
--   }
-- }
-- --- }}}
-- --- Ack {{{
-- vim.g.ackprg = 'rg --vimgrep --type-not sql --smart-case'
-- vim.g.ack_autoclose = 1
-- vim.g.ack_use_cword_for_empty_search = 1
-- 
-- cmd('cnoreabbrev Ack Ack!')
-- 
-- -- Navigate quickfix list
-- vim.api.nvim_set_keymap('n', "<C-_>", "<esc>:Ack!<Space>", { noremap = true })
-- vim.api.nvim_set_keymap('n', "[q", ":cprevious<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', "]q", ":cnext<CR>", { noremap = true, silent = true })
-- --- }}}
-- --- Floaterm {{{
-- vim.g.floaterm_autoinsert = 1
-- vim.g.floaterm_width = 0.5
-- vim.g.floaterm_height = 0.4
-- vim.g.floaterm_wintitle = 0
-- vim.g.floaterm_autoclose = 1
-- vim.g.floaterm_title = 0
-- --- }}}
-- --- Telescope {{{
-- require('telescope').setup{
--   defaults = {
--     vimgrep_arguments = {
--       'rg',
--       '--color=always',
--       '--no-heading',
--       '--with-filename',
--       '--line-number',
--       '--column',
--       '--smart-case'
--     },
--     -- prompt_position = "bottom",
--     prompt_prefix = "❱ ",
--     selection_caret = "❱ ",
--     entry_prefix = "  ",
--     initial_mode = "insert",
--     selection_strategy = "reset",
--     sorting_strategy = "descending",
--     layout_strategy = "horizontal",
--     file_sorter =  require'telescope.sorters'.get_fuzzy_file,
--     file_ignore_patterns = {},
--     generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
--     border = {},
--     borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
--     color_devicons = true,
--     use_less = false,
--     set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
--     file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
--     grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
--     qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
-- 
--     -- Developer configurations: Not meant for general override
--     buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
--   }
-- }
-- --- }}}
-- --- Startify {{{
-- vim.g.startify_session_dir = '/home/shadow/.local/cache/nvim/session/'
-- vim.g.startify_enable_special = 0
-- 
-- vim.cmd [[
--     "let g:startify_lists = [
--         \ { 'type': 'sessions',    'header': ['    Sessions']                    },
--         \ { 'type': 'bookmarks',   'header': ['    Bookmarks']                   },
--         \ { 'type': 'files',       'header': ['    Files']                       },
--         \ { 'type': 'dir',         'header': ['    Current Directory '.getcwd()] },
--         \ ]"
-- ]]
-- vim.cmd [[
--     let g:startify_bookmarks = [
--         \ { 'nv': '~/.config/nvim/init.lua'          },
--         \ { 'np': '~/.config/nvim/lua/plugins.lua'   },
--         \ { 'nc': '~/.config/nvim/lua/config.lua'    },
--         \ { 'nk': '~/.config/nvim/lua/binds.vim'     },
--         \ { 'ns': '~/.config/nvim/colors/shado.vim'  },
--         \ { 'nx': '~/.config/nvim/colors/xshado.vim' },
--         \ { 'x' : '~/.xmonad/xmonad.hs'              },
--         \ { 'p' : '~/.config/shadobar/config-xmonad' },
--         \ { 'c' : '~/.config/picom.conf'             },
--         \ { 'za': '~/.zsh_aliases'                   },
--         \ { 'zc': '~/.zshrc'                         },
--         \ { 'ze': '~/.zshenv'                        },
--         \ ]
-- ]]
-- vim.cmd [[
--     let g:startify_custom_header = [
--         \ '    _________  __                  ___                        __            ',       
--         \ '   /   _____/ |  |__  _____     __| _/ _____ _______ _____   |__|  ____     ',
--         \ '   \_____  \  |  |  \ \__  \   / __ | /  _  \\_  __ \\__  \  |  | /    \    ',
--         \ '   /        \ |   Y  \ / __ \_/ /_/ |(  <_>  )|  | \/ / __ \_|  ||   |  \   ',
--         \ '  /_______  / |___|  /(____  /\____ | \_____/ |__|   (____  /|__||___|  /   ',
--         \ '          \/       \/      \/      \/                    \/          \/     ',
--         \ ]
-- ]]
-- --- }}}
-- --- Git Gutter {{{
-- vim.g.gitgutter_enabled = 1
-- 
-- -- Icons
-- vim.g.gitgutter_sign_added              = '+'
-- vim.g.gitgutter_sign_modified           = '~'
-- vim.g.gitgutter_sign_removed            = '-'
-- vim.g.gitgutter_sign_removed_first_line = '-_'
-- vim.g.gitgutter_sign_modified_removed   = '-~'
-- 
-- -- Colors
-- cmd('highlight GitGutterAdd    guifg=#37d4a7 ctermfg=2')
-- cmd('highlight GitGutterChange guifg=#2f77a1 ctermfg=3')
-- --- }}}
-- --- Vim Bookmarks {{{
-- -- Colors
-- vim.cmd [[
--     highlight BookmarkSign guibg=NONE guifg=#2f77a1
--     highlight BookmarkLine guibg=NONE guifg=NONE
--     highlight BookmarkAnnotationSign guibg=NONE guifg=#5d5daf
--     highlight BookmarkAnnotationLine guibg=NONE guifg=NONE
-- ]]
-- -- Icons
-- vim.cmd [[
--     let g:bookmark_sign = ''
--     let g:bookmark_highlight_lines = 1
--     let g:bookmark_save_per_working_dir = 1
-- ]]
-- vim.api.nvim_set_keymap('n', '<Leader>a', '<Plug>BookmarkShowAll', { noremap = true })
-- --- }}}
-- --- Lightline {{{
-- -- Bar
-- vim.cmd [[
--     let g:lightline = { 
--         \ 'colorscheme': 'deus',
--         \ 'active': {
--         \   'left':   [ [ 'mode' ], [ 'filename' ] ],
--         \   'right':  [ [ 'lineinfo' ], [ 'percent' ] ]
--         \ },
--         \ 'component_function': {
--         \   'gitbranch': 'FugitiveHead'
--         \ },
--         \ }
-- ]]
-- -- Tabs
-- vim.cmd [[
--     let g:lightline.tabline = { 
--                 \ 'left': [ [ 'tabs' ] ],
--                 \ 'right': [ [  ] ] }
-- ]]
-- -- Mode mappings
-- vim.cmd [[
--     let g:lightline.mode_map = {
--         \ 'n' : 'ノーマル',
--         \ 'i' : 'インサート',
--         \ 'R' : '代わる',
--         \ 'v' : 'ビジュアル',
--         \ 'V' : 'V-ライン',
--         \ "\<C-v>": 'V-ブロック',
--         \ 'c' : 'コマンド',
--         \ 's' : 'セレクト',
--         \ 'S' : 'S-ライン',
--         \ "\<C-s>": 'S-ブロック',
--         \ 't': 'ターミナル',
--         \ }
-- ]]
-- --- }}}
-- --- Quick Scope {{{
-- vim.cmd("let g:qs_highlight_on_keys = ['f', 'F', 't' , 'T']")
-- vim.cmd [[
--   highlight QuickScopePrimary guifg='#ff00ff' gui=underline
--   highlight QuickScopeSecondary guifg='#5fffff' gui=underline
-- ]]
-- --- }}}
-- --- Termdebug {{{
-- vim.cmd('packadd! termdebug')
-- vim.g.termdebug_wide = 1
-- --- }}}
-- }}}
-- [[ ----------------------------------------------------------------------- ]]
