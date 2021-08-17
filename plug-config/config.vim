" =============================================================$
"  _________                _____.__               .__         
"  \_   ___ \  ____   _____/ ____\__| ____   ___  _|__| _____  
"  /    \  \/ /  _ \ /    \   __\|  |/ ___\  \  \/ /  |/     \ 
"  \     \___(  <_> )   |  \  |  |  / /_/  >  \   /|  |  Y Y  \
"   \______  /\____/|___|  /__|  |__\___  / /\ \_/ |__|__|_|  /
"          \/            \/        /_____/  \/              \/ 
" ================================================================$
" NEORG " {{{
lua << EOF
require('neorg').setup {
  load = {
    ["core.defaults"] = {}, -- Enable all the default functionality
    ["core.norg.concealer"] = {} -- Load the module responsible for converting text into icons
  }
}
EOF
" }}}
" Config >-- IndentLine " {{{
"let g:indentLine_color_gui = '#E9729D'
""let g:indentLine_char_list = ['|'] ", '¦', '┆', '┊']
"let g:indentLine_char = '|'
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 2
" }}}
" Config >-- Cscope " {{{
if filereadable("cscope.out")
  cs add cscope.out
endif
" }}}
" Config >-- Ack " {{{
" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <C-/> so we're ready to type the search keyword
nnoremap <C-_> <esc>:Ack!<Space>
" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
" }}}
" Plug >-- Undofile " {{{
set undofile
set backupdir=~/.config/nvim/backups/
set undodir=~/.config/nvim/backups/undo/
" }}}
" Plug >-- Floaterm " {{{
let g:floaterm_autoinsert=1
let g:floaterm_width=0.5
let g:floaterm_height=0.4
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
let g:floaterm_title=0
" }}}
" Plug >-- Telescope " {{{
lua << EOF
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
    -- layout_defaults = {
    --   horizontal = {
    --     mirror = false,
    --   },
    --   vertical = {
    --     mirror = false,
    --   },
    -- },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    -- shorten_path = true,
    -- winblend = 0,
    -- width = 0.75,
    -- preview_cutoff = 120,
    -- results_height = 1,
    -- results_width = 0.3,
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
EOF
" }}}
" Plug >-- FZF " {{{
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" Hide status bar while using fzf commands                                                                          
if has('nvim') || has('gui_running')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 | autocmd WinLeave <buffer> set laststatus=2
endif
" }}}
" Plug >-- CoC " {{{
" Sets <Tab> as autocomplete menu down
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Sub-Plug >-- coc-pairs " {{{
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"}}}
" Sub-Plug >-- coc-snippets " {{{
let g:UltiSnipsExpandTrigger = "<NUL>"
inoremap <silent><expr> <C-l>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<C-l>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<C-l>'
let g:coc_snippet_prev = '<C-h>'
" }}}
"}}}
" Plug >-- Startify " {{{
let g:startify_session_dir = '~/.config/nvim/session' "Directory for sessions
let g:startify_enable_special = 0
"<---Lists--->
let g:startify_lists = [
    \ { 'type': 'sessions',    'header': ['    Sessions']                    },
    \ { 'type': 'bookmarks',   'header': ['    Bookmarks']                   },
    \ { 'type': 'files',       'header': ['    Files']                       },
    \ { 'type': 'dir',         'header': ['    Current Directory '.getcwd()] },
    \ ]

"<---Bookmarks(Tap key to enter)--->
let g:startify_bookmarks = [
    \ { 'nv': '~/.config/nvim/init.vim'                                                                   },
    \ { 'np': '~/.config/nvim/plug-config/shadoplug.vim'                                                  },
    \ { 'nc': '~/.config/nvim/plug-config/config.vim'                                                     },
    \ { 'nk': '~/.config/nvim/shadobinds.vim'                                                             },
    \ { 'ns': '~/.config/nvim/colors/shado.vim'                                                           },
    \ { 'nx': '~/.config/nvim/colors/xshado.vim'                                                          },
    \ { 'nw': '~/.config/nvim/snippets/vimwiki.snippets'                                                  },
    \ { 'nl': '~/.local/share/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/deus.vim'         },
    \ { 's' : '~/.config/sxhkd/sxhkdrc'                                                                   },
    \ { 'x' : '~/.xmonad/xmonad.hs'                                                                       },
    \ { 'b' : '~/.config/bspwm/bspwmrc'                                                                   },
    \ { 'p' : '~/.config/shadobar/config-xmonad'                                                          },
    \ { 'c' : '~/.config/picom.conf'                                                                      },
    \ { 'za': '~/.config/zsh/zsh_aliases'                                                                 },
    \ { 'zc': '~/.config/zsh/.zshrc'                                                                      },
    \ { 'ze': '~/.zshenv'                                                                                 },
    \ { 'dh': '~/Documents/HTB/'                                                                          },
    \ { 'D' : '~/Downloads/'                                                                              },
    \ ]
    
"<---Ascii Art(Displayed as title)--->
let g:startify_custom_header = [
    \ '    _________  __                  ___                        __            ',       
    \ '   /   _____/ |  |__  _____     __| _/ _____ _______ _____   |__|  ____     ',
    \ '   \_____  \  |  |  \ \__  \   / __ | /  _  \\_  __ \\__  \  |  | /    \    ',
    \ '   /        \ |   Y  \ / __ \_/ /_/ |(  <_>  )|  | \/ / __ \_|  ||   |  \   ',
    \ '  /_______  / |___|  /(____  /\____ | \_____/ |__|   (____  /|__||___|  /   ',
    \ '          \/       \/      \/      \/                    \/          \/     ',
    \ ]

" Grouped bookmark lists 
" function! s:bookmarks1()
"   return [
"         \ { 'line': 'file1', 'cmd': 'edit file1' },
"         \ { 'line': 'file2', 'cmd': 'edit file2' },
"         \ ]
" endfunction

" function! s:bookmarks2()
"   return [
"         \ { 'line': 'file3', 'cmd': 'edit file3' },
"         \ { 'line': 'file4', 'cmd': 'edit file4' },
"         \ ]
" endfunction

" let g:startify_lists = [
"       \ { 'header': ['   MRU'],            'type': 'files' },
"       \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
"       \ { 'header': ['   Sessions'],       'type': 'sessions' },
"       \ { 'header': ['   Bookmarks 1'],    'type': function('s:bookmarks1') },
"       \ { 'header': ['   Bookmarks 2'],    'type': function('s:bookmarks2') },
"       \ ]
" }}}
" Plug >-- Git Gutter " {{{
let g:gitgutter_sign_added              = '+'  "'⏽'
let g:gitgutter_sign_modified           = '~'  "'⏽'
let g:gitgutter_sign_removed            = '-'  "'契'
let g:gitgutter_sign_removed_first_line = '-_'  "'契'
let g:gitgutter_sign_modified_removed   = '-~'  "'⏽'

let g:gitgutter_enabled = 1
"Colors
highlight GitGutterAdd    guifg=#37d4a7 ctermfg=2
highlight GitGutterChange guifg=#2f77a1 ctermfg=3
"}}}
" Plug >-- Signify " {{{
""<---Signs(Are displayed on a side bar to show status)--->
"let g:signify_sign_add               = '+'
"let g:signify_sign_delete            = '_'
"let g:signify_sign_delete_first_line = '‾'
"let g:signify_sign_change            = '~'
"let g:signify_sign_show_count = 0 "\
"let g:signify_sign_show_text = 1  " Gets rid of extra numbers
""<---Jump through Hunks--->
"nmap <leader>gj <plug>(signify-next-hunk)
"nmap <leader>gk <plug>(signify-prev-hunk)
"nmap <leader>gJ 9999<leader>gJ
"nmap <leader>gK 9999<leader>gK
"" }}}
" Plug >-- Vim-Bookmarks " {{{
"Highlighting and icon customization
highlight BookmarkSign guibg=NONE guifg=#2f77a1
highlight BookmarkLine guibg=NONE guifg=NONE
highlight BookmarkAnnotationSign guibg=NONE guifg=#5d5daf
highlight BookmarkAnnotationLine guibg=NONE guifg=NONE
let g:bookmark_sign = ''
let g:bookmark_highlight_lines = 1
let g:bookmark_save_per_working_dir = 1
"rebind some overlaps with my marks setup (a,s,d,f)
nmap <Leader>a <Plug>BookmarkShowAll
"}}}
" Plug >-- Lightline " {{{
set laststatus=2
set noshowmode

"<---Main Bar Configuration--->
let g:lightline = { 
    \ 'colorscheme': 'deus',
    \ 'active': {
    \   'left':   [ [ 'mode' ], [ 'filename' ] ],
    \   'right':  [ [ 'lineinfo' ], [ 'percent' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }
" \   'middle': [ [ 'mode' ] ],  doesn't work :facepalm:

"<---Config for tabs--->
let g:lightline.tabline = { 
            \ 'left': [ [ 'tabs' ] ],
            \ 'right': [ [  ] ] }

let g:lightline.mode_map = {
    \ 'n' : 'ノーマル',
    \ 'i' : 'インサート',
    \ 'R' : '代わる',
    \ 'v' : 'ビジュアル',
    \ 'V' : 'V-ライン',
    \ "\<C-v>": 'V-ブロック',
    \ 'c' : 'コマンド',
    \ 's' : 'セレクト',
    \ 'S' : 'S-ライン',
    \ "\<C-s>": 'S-ブロック',
    \ 't': 'ターミナル',
    \ }
" }}}
" Plug >-- VimWiki " {{{
"<---Sets to markdown instead of vimwiki syntax--->
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md', 'auto_diary_index': 1}]

"<---Fixes diary on enter--->
command! Diary VimwikiDiaryIndex
" augroup vimwikigroup
"     autocmd!
"     autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
" augroup end

"<---Allows folding on specific header lvl--->
set foldenable
let g:vim_markdown_folding_level=6
" }}}
" Plug >-- Quick Scope " {{{
let g:qs_highlight_on_keys = ['f', 'F', 't' , 'T'] "Will scope for find and until keys
"<---Set color for qs--->
highlight QuickScopePrimary guifg='#ff00ff' gui=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline
"}}}
" Package >-- Termdebug " {{{
packadd! termdebug
let g:termdebug_wide = 1
" }}}
" ----------------------------------------------------------------$
