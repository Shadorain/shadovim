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
vim.cmd('set expandtab')
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
vim.opt.mouse = 'a'
vim.opt.mousefocus = true
vim.opt.ruler = true
vim.opt.inccommand = "split"

-- Folds
vim.opt.foldenable = true
vim.opt.foldmethod = 'marker'

-- Scroll margin
-- vim.opt.scrolloff = 4

-- Encoding
-- vim.opt.encoding = 'utf-8'
-- vim.opt.fileencoding = 'utf-8'

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Status line
vim.opt.laststatus = 2

-- Undo
vim.opt.undofile = true
vim.opt.undodir = "/home/shadow/.local/cache/nvim/undo/"
vim.opt.backupdir= "/home/shadow/.local/cache/nvim/backups/"

-- Completion
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.pumwidth = 15
vim.opt.pumheight = 7
vim.opt.pumblend = 20

-- Update times
vim.opt.updatetime = 150

-- Cursor Line Nr
cmd('set cursorline')
cmd('set cursorlineopt=number')

cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')
--- }}}
-- }}}
-- [[ Plugin Settings ]] ---------------------------------------------------- ]]
-- {{{
--- Ack {{{
vim.g.ackprg = 'rg --vimgrep --type-not sql --smart-case'
vim.g.ack_autoclose = 1
vim.g.ack_use_cword_for_empty_search = 1

cmd('cnoreabbrev Ack Ack!')

-- Navigate quickfix list
vim.api.nvim_set_keymap('n', "<C-_>", "<esc>:Ack!<Space>", { noremap = true })
vim.api.nvim_set_keymap('n', "[q", ":cprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "]q", ":cnext<CR>", { noremap = true, silent = true })
--- }}}
--- Floaterm {{{
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.5
vim.g.floaterm_height = 0.4
vim.g.floaterm_wintitle = 0
vim.g.floaterm_autoclose = 1
vim.g.floaterm_title = 0
--- }}}
--- Telescope {{{
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=always',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    -- prompt_position = "bottom",
    prompt_prefix = "❱ ",
    selection_caret = "❱ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = false,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
--- }}}
--- Vim Bookmarks {{{
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1
vim.g.bookmark_save_per_working_dir = 1
vim.api.nvim_set_keymap('n', '<Leader>a', '<Plug>BookmarkShowAll', { noremap = true })
--- }}}
--- Lightline {{{
-- Bar
vim.g.lightline = {
    colorscheme = "deus",
    active = {
        left = { { "mode" }, { "filename" } },
        right = { { "lineinfo" }, { "percent" } },
    },
    component_function = {
        gitbranch = "FugitiveHead"
    },
}

-- Tabs
vim.g.lightline.tabline = {
    left = { { "tabs" } },
    left = { { } }
}
-- Mode mappings
vim.g.lightline.mode_map = {
    n = "ノーマル",
    i = "インサート",
    R = "代わる",
    v = "ビジュアル",
    V = "V-ライン",
    ["<C-v>"] = "V-ブロック",
    c = "コマンド",
    s = "セレクト",
    S = "S-ライン",
    ["<C-s>"] = "S-ブロック",
    t = "ターミナル",
}
--- }}}
--- Startify {{{
vim.g.startify_session_dir = '/home/shadow/.local/cache/nvim/session/'
vim.g.startify_enable_special = 0

vim.g.startify_lists = {
    { type = 'sessions',  header = {'    Sessions'}                              },
    { type = 'bookmarks', header = {'    Bookmarks'}                             },
    { type = 'files',     header = {'    Files'}                                 },
    { type = 'dir',       header = {'    Current Directory ' .. vim.fn.getcwd()} },
}

vim.g.startify_bookmarks = {
    { nv = '~/.config/nvim/init.lua'           },
    { np = '~/.config/nvim/lua/plugins.lua'    },
    { nc = '~/.config/nvim/lua/config.lua'     },
    { nk = '~/.config/nvim/lua/binds.lua'      },
    { nl = '~/.config/nvim/lua/lsp_config.lua' },
    { ns = '~/.config/nvim/colors/shado.vim'   },
    { nx = '~/.config/nvim/colors/xshado.vim'  },
    { x  = '~/.xmonad/xmonad.hs'               },
    { p  = '~/.config/shadobar/config-xmonad'  },
    { c  = '~/.config/picom.conf'              },
    { za = '~/.zsh_aliases'                    },
    { zc = '~/.zshrc'                          },
    { ze = '~/.zshenv'                         },
}

vim.g.startify_custom_header = vim.split([[ 
#||>================---------------------------------------------================<||#
 \"      _________  __                  ___                        __             "/       
  "     /   _____/ |  |__  _____     __| _/ _____ _______ _____   |__|  ____      " 
  "     \_____  \  |  |  \ \__  \   / __ | /  _  \\_  __ \\__  \  |  | /    \     " 
  "     /        \ |   Y  \ / __ \_/ /_/ |(  <_>  )|  | \/ / __ \_|  ||   |  \    " 
  "    /_______  / |___|  /(____  /\____ | \_____/ |__|   (____  /|__||___|  /    " 
 /"            \/       \/      \/      \/                    \/          \/      "\
#||>================---------------------------------------------================<||#
    ]], "\n", true)
--- }}}
--- Quick Scope {{{
cmd("let g:qs_highlight_on_keys = ['f', 'F', 't' , 'T']")
--- }}}
--- Termdebug {{{
cmd('packadd! termdebug')
vim.g.termdebug_wide = 1
--- }}}
--- Beacon {{{
vim.g.beacon_minimal_jump = 2
vim.g.beacon_size = 30
vim.g.beacon_shrink = 1
vim.g.beacon_timeout = 1000
--- }}}
--- Rust-tools {{{
local opts = {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        parent_module = true,
        join_lines = true,
        runnables = { use_telescope = true },
        debuggables = { use_telescope = true },
        inlay_hints = {
            only_current_line = false,
            only_current_line_autocmd = "CursorHold",
            show_parameter_hints = true,
            parameter_hints_prefix = "❰ ",
            other_hints_prefix = "≣ ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
        },
        hover_actions = {
            auto_focus = false,
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            }
        },
    },
}
require('rust-tools').setup(opts)
--- }}}
-- --- Neorg {{{
-- require('neorg').setup {
--   load = {
--     ["core.defaults"] = {}, -- Enable all the default functionality
--     ["core.norg.concealer"] = {} -- Load the module responsible for converting text into icons
--   }
-- }
-- --- }}}
-- }}}
-- [[ ----------------------------------------------------------------------- ]]
