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
cmd('au FileType norg set shiftwidth=2')
cmd('au FileType norg set tabstop=2')
cmd('au FileType norg set softtabstop=2')
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
vim.opt.conceallevel = 2
vim.opt.listchars = 'space:·'
vim.opt.virtualedit = "block"
vim.opt.mouse = 'a'
vim.opt.mousefocus = true
vim.opt.ruler = true
vim.opt.inccommand = "split"

-- Vim Spell
cmd('au FileType markdown setlocal spell spelllang=en_us')
cmd('au FileType norg setlocal spell spelllang=en_us')

-- Folds
vim.opt.foldenable = true
vim.opt.foldmethod = 'marker'

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Status line
vim.opt.laststatus = 2

-- Undo
vim.opt.undofile = true
vim.opt.undodir = "/home/shadow/.local/cache/nvim/undo/"
vim.opt.backupdir= "/home/shadow/.local/cache/nvim/backups/"

-- Pumemu
vim.opt.pumwidth = 15
vim.opt.pumheight = 7
vim.opt.pumblend = 20
vim.opt.winblend = 20

-- Update times
vim.opt.updatetime = 150

-- Cursor Line Nr
cmd('set cursorline')
cmd('set cursorlineopt=number')

cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

cmd('set autoread')

-- Ctags
vim.cmd [[ autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi ]]
vim.cmd [[ autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw! ]]
--- }}}
-- }}}
-- [[ Plugin Settings ]] ---------------------------------------------------- ]]
-- {{{
--- Floaterm {{{
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.5
vim.g.floaterm_height = 0.4
vim.g.floaterm_wintitle = 0
vim.g.floaterm_autoclose = 1
vim.g.floaterm_title = 0
--- }}}
--- Telescope {{{
---- Dont preview binary files
local previewers = require('telescope.previewers')
local Job = require('plenary.job')
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = 'file',
    args = { '--mime-type', '-b', filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], '/')[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
        end)
      end
    end
  }):sync()
end

local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        buffer_previewer_maker = new_maker,
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
            },
        },
        vimgrep_arguments = {
          'rg', '--color=never', '--no-heading',
          '--with-filename', '--line-number',
          '--column', '--smart-case'
        },
        results_title = false,
        preview_title = false,
        prompt_prefix = "❱ ",
        selection_caret = "❱ ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.8, height = 0.5,
            prompt_position = "bottom",
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        border = {},
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }, 
        winblend = 20,
        previewer = true,
        color_devicons = true,
        use_less = false,
        set_env = { ['COLORTERM'] = 'truecolor' },
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    }
}
--- }}}
--- Vim Bookmarks {{{
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1
vim.g.bookmark_save_per_working_dir = 1
vim.api.nvim_set_keymap('n', '<Leader>a', '<Plug>BookmarkShowAll', { noremap = true })
--- }}}
--- Lualine {{{
require'lualine'.setup {
    options = {
        theme = 'shado',
        icons_enabled = true,
        disabled_filetypes = {},
        section_separators   = { '', '' },
        component_separators = { '', '' },
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'}, --, {'diff', color_added='#37d4a7', color_modified='#2f77a1',
            -- color_removed='#de286e', symbols = {added = '', modified = '', removed = ''} }},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {'location'},
        lualine_z = {},
    },
    tabline = {},
    extensions = {'quickfix'},
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
    { nm = '~/.config/nvim/lua/mod.lua'        },
    { nl = '~/.config/nvim/lua/lsp_config.lua' },
    { ns = '~/.config/nvim/colors/shado.vim'   },
    { nx = '~/.config/nvim/colors/shado.vim'   },
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
--- Specs {{{
require('specs').setup{ 
    show_jumps  = true,
    min_jump = 30,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 15, -- time increments used for fade/resize effects 
        blend = 40, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 30,
        winhl = "Beacon",
        fader = require('specs').pulse_fader,
        resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = { nofile = true, },
}
--- }}}
--- Transparent {{{
require("transparent").setup({
    enable = true,
    extra_groups = {},
    exclude = {},
})
--- }}}
--- DAP {{{
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.defaults.fallback.force_external_terminal = true
dap.defaults.fallback.external_terminal = {
  command = '/usr/local/bin/st';
  args = {''};
}
--- }}}
--- DAP UI {{{
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  layouts = {
    {
    -- You can change the order of elements in the sidebar
      elements = {
        -- Provide as ID strings or tables with "id" and "size" keys
        { id = "breakpoints", size = 0.15 },
        { id = "scopes", size = 0.65, }, -- Can be float or integer > 1
        { id = "stacks", size = 0.25 },
        -- { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "left", -- Can be "left", "right", "top", "bottom"
    },
    {
      elements = { },
      size = 10,
      position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    mappings = { close = { "q", "<Esc>" }, },
  },
  windows = { indent = 1 },
})
-- }}}
-- SplitOrNew VimL Plugin {{{
-- " List to contain file paths of existing buffers
cmd('let g:SplitOrNew_names = []')

-- " Populate g:SplitOrNew_names with the full paths of files in open buffers
cmd([[
  function! s:list_names()
    for l:k in getbufinfo()
        for l:j in keys(l:k)
            if l:j == 'name'
                call add( g:SplitOrNew_names, l:k[l:j])
            endif
        endfor
    endfor
  endfunction
]])

-- " Determine if a list has an item
cmd(
  [[function! s:list_contains(needle, haystack)
    for l:hay in a:haystack
        echom l:hay .. ' ' .. a:needle
        if l:hay == a:needle
            return 1
        endif
    endfor
    return 0
  endfunction
]])

-- " Open a split or edit existing split based on if the file has an existing buffer
cmd([[
  function! SplitOrNew(file)
    " repopulate the name list
    let g:SplitOrNew_names = []
    call s:list_names()
    " Get the entire path of a file. This is what Vims internal representation
    " of a buffer, or at least the one that's most useful in this scenario
    " buffer exists
    let l:full_path = fnamemodify(a:file, ':p')
    if  s:list_contains(l:full_path, g:SplitOrNew_names) == 1
        " Bring file into current active buffer
        execute ':e ' a:file
    else
        " Create Split with new file
        execute ':vsp ' a:file
    endif
  endfunction
]])

-- " Define a command that takes one argument and accepts file paths as completions
cmd([[ command! -nargs=1 -complete=file SplitOrNew call SplitOrNew('<args>') ]])
-- }}}
cmd([[
  func! GodotSettings() abort
      setlocal foldmethod=expr
      setlocal tabstop=4
      nnoremap <buffer> <F4> :GodotRunLast<CR>
      nnoremap <buffer> <F5> :GodotRun<CR>
      nnoremap <buffer> <F6> :GodotRunCurrent<CR>
      nnoremap <buffer> <F7> :GodotRunFZF<CR>
  endfunc
  augroup godot | au!
      au FileType gdscript call GodotSettings()
  augroup end
]])

cmd([[
  let g:tagbar_type_gdscript = {
			  \'ctagstype' :'gdscript',
			  \'kinds':[
			  \'v:variables',
			  \'f:functions',
			  \]
			  \}
]])

cmd([[
let g:godot_executable = '/usr/bin/godot'
]])
-- }}}
-- [[ ----------------------------------------------------------------------- ]]
