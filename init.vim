" ============================================================================== "
"   _________.__                .___     .__       .__  __         .__           "
"  /   _____/|  |__ _____     __| _/____ |__| ____ |__|/  |_ ___  _|__| _____    "
"  \_____  \ |  |  \\__  \   / __ |/  _ \|  |/    \|  \   __\\  \/ /  |/     \   "
"  /        \|   Y  \/ __ \_/ /_/ (  <_> )  |   |  \  ||  |   \   /|  |  Y Y  \  "
" /_______  /|___|  (____  /\____ |\____/|__|___|  /__||__| /\ \_/ |__|__|_|  /  "
"         \/      \/     \/      \/              \/         \/              \/   "
" ============================================================================== "
" ----- Plugs ----- " {{{
call plug#begin('~/.local/share/nvim/plugged')
    "<--General-----------------------------------------------------------------------------------$
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "To have the plug right under this one
    Plug 'junegunn/fzf.vim' "Allows for some sweet fuzzy finding within vim without having to exit
    Plug 'vimwiki/vimwiki' "Probably my fav plug, use it daily for all my notes, its quite amazing
    "<--Ease of use-------------------------------------------------------------------------------$
    Plug 'unblevable/quick-scope' "Saves SO MUCH TIME when using the f/F keys, just use it!
    Plug 'easymotion/vim-easymotion' "Highly advanced real time more efficient search! haha
    Plug 'tpope/vim-surround' "Surrounds your braces, parens, quotes etc to save you a keypress
    Plug 'tpope/vim-commentary' "Makes commenting 100x easier and better. Just use it ull see
    "<--That Rice Stuff---------------------------------------------------------------------------$
    Plug 'itchyny/lightline.vim' "Adds that sexy bar your seeing at bottom of ur vim window
    Plug 'godlygeek/tabular' "Makes having sexy code so much easier: organized your tabbed stuff
    Plug 'junegunn/goyo.vim' "Adds like a focus mode to vim, its quite nice tbh
    Plug 'mhinz/vim-startify' "I find this to be one of the coolest, sexiest, and most useful plugs
        "it allows for a start screen in vim with whatever the hell u want, and its amazing
    "<--Git Integration---------------------------------------------------------------------------$
    Plug 'mhinz/vim-signify' "Extremely useful, handles git changes/deletes/additions in a sidebar
    Plug 'tpope/vim-fugitive' "`:Git`&`:G...` functionality, can do alot with this bad boy
    Plug 'tpope/vim-rhubarb' "Adds on to fugitives functionality
    Plug 'junegunn/gv.vim' "View your git commits in a nice vim window
    "<--Syntax------------------------------------------------------------------------------------$
    Plug 'plasticboy/vim-markdown' "Def keep if u use md. Comes quite in handy for alot of md stuff
    Plug 'sheerun/vim-polyglot' "Adds some better syntax for quite a few languages
    "<--Snippets----------------------------------------------------------------------------------$
    Plug 'honza/vim-snippets' "Paired with coc-snippets; adds quite a few premade snippets
    "<--Coc Suite (Most of it is handled by coc itself)-------------------------------------------$
    Plug 'neoclide/coc.nvim', {'branch': 'release'} "Massive suite with alotta good stuff!
    "coc-clangd, coc-highlight, coc-lists, coc-python, coc-snippets, coc-todolists, coc-vimlsp, coc-yank
    "<--Unused Plugins------------------------------------------------------------------$ {{{
    " Plug 'justinmk/vim-sneak' "Tbh not yet sold on this guy, i kinda liked default s/S key
    " Plug 'ChristianChiarulli/codi.vim' "Nice lil REPL for some langs, I dont use it much tho
    " Plug 'justinmk/vim-syntax-extra' "Better syntax highlighting for some langs
    " Plug 'vim-pandoc/vim-pandoc-syntax' "If you are to use latex or similar in vim (ofc you are!)
    " Plug 'liuchengxu/vim-which-key' "Very goood for beginners to get used to using leader keys
	" Plug 'terryma/vim-multiple-cursors' "Allows for multiple cursors, can just be done by default tho
    " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' } "Eh dont use much
    "<--Nerd tree---(Currently do not use anymore so have commented out)--------------------------$ {{{
    " Plug 'mattn/calendar-vim' "niftly little plug that can interract with vimwiki diary!
    " Plug 'preservim/nerdtree' "Base plugin: Opens a directory structure split for you to browse files
    " Plug 'Xuyuanp/nerdtree-git-plugin' "Git integration into NerdTree
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "Syntax highlighting for that NerdTree
    " Plug 'ryanoasis/vim-devicons' "Some icons to make NerdTree a lil prettier (all bout that rice) "}}}
    " }}}
call plug#end()
"<---Vim Plug Installer-------------------------------------------------------------$ {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}
"}}}
" ----- General ----- " {{{
"<--Colors----------------------------------------------------------------------$
syntax enable "Allows for syntax highlighting
set termguicolors "Allows for hex coloring
set t_ut= "No idea lols
colorscheme shado "Set your colorscheme here (mine not too bad)
"<--Tab Settings----------------------------------------------------------------$
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
"<--Numbering-------------------------------------------------------------------$
set number
set relativenumber
filetype plugin on
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
set nocompatible
set foldmethod=marker
"set clipboard+=unnamedplus
" --- Custom Key Commands! --- {{{
" Copies selected text from split window and paste in other 
vnoremap <F3> y<c-w>wp<c-w>gv
" Turns off all line numbers
nnoremap <F3> :set invnumber invrelativenumber<CR>

"<---Fzf Commands--->
map <C-f> <esc><esc>:Files!<CR>
map <C-A-f> <esc><esc><C-w>v:Files!<CR>
inoremap <C-f> <esc><esc>:BLines!<CR>
nnoremap g<C-c> <esc><esc>:BCommits!<CR>

" Remap arrow keys to resize splits
nnoremap <silent><Up>    :resize +2<CR>
nnoremap <silent><Down>  :resize -2<CR>
nnoremap <silent><Left>  :vertical resize +2<CR>
nnoremap <silent><Right> :vertical resize -2<CR>

nmap <leader>bl :ls<CR>
nmap <silent><leader>bn :bnext<CR>
nmap <silent><leader>bp :bprevious<CR>
nmap <silent><leader>bd :bdelete<CR>

nmap <leader>ga :Gwrite<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gl :Glog<CR>

inoremap <A-,> <Esc>A;<Esc>
nnoremap <A-,> A;<Esc>

tnoremap <C-A-h> <C-\><C-N><C-w>h
tnoremap <C-A-j> <C-\><C-N><C-w>j
tnoremap <C-A-k> <C-\><C-N><C-w>k
tnoremap <C-A-l> <C-\><C-N><C-w>l
inoremap <C-A-h> <C-\><C-N><C-w>h
inoremap <C-A-j> <C-\><C-N><C-w>j
inoremap <C-A-k> <C-\><C-N><C-w>k
inoremap <C-A-l> <C-\><C-N><C-w>l
nnoremap <C-A-h> <C-w>h
nnoremap <C-A-j> <C-w>j
nnoremap <C-A-k> <C-w>k
nnoremap <C-A-l> <C-w>l

map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" Will create a commented line the size of the line below/above
let @l='4lr#'
noremap <C-\>k <esc><esc>kyypxVr=A #<esc>:Commentary<CR>
noremap <C-\>j <esc><esc>jyyPxVr=A #<esc>:Commentary<CR>
" }}}
"}}}
" ----- Plug Config ----- " {{{
" Plug >-- CoC " {{{
" Sets <Tab> as autocomplete menu down
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
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

let g:coc_snippet_next = '<tab>'
" }}}
"}}}
" Plug >-- Sneak " {{{
let g:sneak#prompt = '❱'
"}}}
" Plug >-- Startify " {{{
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_enable_special = 0
" let g:startify_session_autoload = 1
" Lists
let g:startify_lists = [
    \ { 'type': 'sessions',    'header': ['    Sessions']                    },
    \ { 'type': 'bookmarks',   'header': ['    Bookmarks']                   },
    \ { 'type': 'files',       'header': ['    Files']                       },
    \ { 'type': 'dir',         'header': ['    Current Directory '.getcwd()] },
    \ ]

" Bookmarks
let g:startify_bookmarks = [
    \ { 'nv' : '~/.config/nvim/init.vim'                                                         },
    \ { 's' : '~/.config/sxhkd/sxhkdrc'                                                          },
    \ { 'b' : '~/.config/bspwm/bspwmrc'                                                          },
    \ { 'k' : '~/.config/kitty/kitty.conf'                                                       },
    \ { 'p' : '~/.config/polybar/config'                                                         },
    \ { 'c' : '~/.config/picom.conf'                                                             },
    \ { 'S' : '~/Documents/PY-Projects/Shadochan/shadochan.py'                                   },
    \ { 'nc': '~/.config/nvim/colors/shado.vim'                                                  },
    \ { 'nl': '.local/share/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/deus.vim'  },
    \ { 'w' : '~/vimwiki/index.md'                                                               },
    \ { 'm' : '~/.config/miscellaneous'                                                          },
    \ { 'r' : '~/.config/rofi/themes/onedark.rasi'                                               },
    \ { 'za': '~/.config/zsh/zsh_aliases'                                                        },
    \ { 'zc': '~/.config/zsh/.zshrc'                                                             },
    \ { 'ze': '~/.zshenv'                                                                        },
    \ { 'd' : '~/Documents/'                                                                     },
    \ { 'ds': '~/Documents/SchoolWork/'                                                          },
    \ { 'dh': '~/Documents/HTB/'                                                                 },
    \ { 'dc': '~/Documents/Shadochan/'                                                           },
    \ { 'D' : '~/Downloads/'                                                                     },
    \ { 'pc' : '~/Pictures/'                                                                     },
    \ { 'ps':  '~/Pictures/Screenshots/'                                                         },
    \ { 'M' : '~/Music/'                                                                         },
    \ ]
" Ascii Art
let g:startify_custom_header = [
    \ '    _________  __                  ___                        __            ',       
    \ '   /   _____/ |  |__  _____     __| _/ _____ _______ _____   |__|  ____     ',
    \ '   \_____  \  |  |  \ \__  \   / __ | /  _  \\_  __ \\__  \  |  | /    \    ',
    \ '   /        \ |   Y  \ / __ \_/ /_/ |(  <_>  )|  | \/ / __ \_|  ||   |  \   ',
    \ '  /_______  / |___|  /(____  /\____ | \_____/ |__|   (____  /|__||___|  /   ',
    \ '          \/       \/      \/      \/                    \/          \/     ',
    \ ]
" Autostart nerdtree with Startify
"autocmd VimEnter *                                                                 
"    \   if !argc()                                                         
"    \ |   Startify                                                         
"    \ |   NERDTree                                                         
"    \ |   wincmd w                                                         
"    \ | endif
" }}}
" Plug >-- Signify " {{{
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 0 "-\
let g:signify_sign_show_text = 1  "-+--- Gets rid of extra numbers
" Jump through Hunks
"nmap <leader>gj <plug>(signify-next-hunk)
"nmap <leader>gk <plug>(signify-prev-hunk)
"nmap <leader>gJ 9999<leader>gJ
"nmap <leader>gK 9999<leader>gK
" }}}
" Plug >-- Fugitive/Rhubarb " {{{
" }}}
" Plug >-- FZF " {{{
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
" }}}
" Plug >-- NERDTree " {{{
"autocmd vimenter * NERDTree  " will auto open nerdtree
map <C-t> :NERDTreeToggle<CR> 
" maps ctrl+t to open nerdtree
" }}}
" Plug >-- Lightline " {{{
set laststatus=2

if !has('gui_running')
  set t_Co=256
endif
set noshowmode

let g:lightline = { 
    \ 'colorscheme': 'deus',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \       [ 'filename', 'helloworld' ] ],
    \   'right': [ [ 'lineinfo' ],
    \               [ 'percent' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

let g:lightline.tabline = { 
            \ 'left': [ [ 'tabs' ] ],
            \ 'right': [ [  ] ] }

" }}}
" Plug >-- Vifm " {{{
"map <Leader>vf :Vifm<CR>
"map <Leader>vs :VsplitVifm<CR>
"map <Leader>vh :SplitVifm<CR>
"map <Leader>dv :DiffVifm<CR>
"map <Leader>tv :TabVifm<CR>
"let g:vifm_replace_netrw = 1                                                                  
"let g:vifm_replace_netrw_cmd = '/home/shadow/.config/vifm/scripts/vifmrun'                    
"let g:NERDTreeHijackNetrw = 1                                                                 
"let g:loaded_netrw       = 1                                                                  
"let g:loaded_netrwPlugin = 1
" }}}
" Plug >-- Codi " {{{
" Change the color
highlight CodiVirtualText guifg=cyan
let g:codi#virtual_text_prefix = "❯ "

let g:codi#aliases = {
                   \ 'javascript.jsx': 'javascript',
                   \ }
" }}}
" Plug >-- VimWiki " {{{
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"command! Diary VimwikiDiaryIndex
"augroup vimwikigroup
    "autocmd!
    "" automatically update links on read diary
    "autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
"augroup end

set foldenable
"let g:markdown_folding=2
let g:vim_markdown_folding_level=6
"let g:vimwiki_folding='syntax'

"let g:vimwiki_listsyms = '✗○◐●✓'
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
" }}}
" Plug >-- Quick Scope " {{{
let g:qs_highlight_on_keys = ['f', 'F', 't' , 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
"}}}
" Plug >-- Markdown Preview " {{{
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = 'qutebrowser'
set updatetime=100

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

let g:mkdp_page_title = '「${name}」'
nmap <F5> <Plug>MarkdownPreview
"nmap <M-s> <Plug>MarkdownPreviewStop
"nmap <C-p> <Plug>MarkdownPreviewToggle
" }}}
" Plug >-- Vim Which-Key " {{{
" Hides statusbar while which-key is open
call which_key#register('<Space>', "g:which_key_map")

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

nnoremap <silent> <leader> :silent WhichKey '<leader>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<leader>'<CR>

" Define a separator
let g:which_key_sep = '→'

let g:which_key_map = {}

" Search and Replace
nnoremap <leader>R <esc><esc>:%s///gcI<left><left><left><left><left>
let g:which_key_map['R'] = [ ':%s///gcI<left><left><left><left><left>' , 'Search & Replace' ]
let g:which_key_map['S'] = [ ':Startify' , 'Startify' ]
let g:which_key_map['V'] = [ ':Vifm' , 'Vifm' ]
let g:which_key_map['Z'] = [ ':au ColorScheme * hi Normal ctermbg=none guibg=none<CR>' , 'BG Toggle' ]
let g:which_key_map['T'] = [ ':tabnew', 'New Tab']
" --- Setup Section --- " {{{
" +Calendar {{{
let g:which_key_map.c = {
    \ 'name' : '+Calendar',
    \ 'al' : [':Calendar'   , 'Calendar Left']      ,
    \ 'ar' : [':CalendarVR' , 'Calendar Right']     ,
    \ 'ab' : [':CalendarH'  , 'Calendar Bottom']    ,
    \ 'af' : [':CalendarT'  , 'Calendar Full']      ,
    \ }
" }}}
" +Startify {{{
let g:which_key_map.s = {
    \ 'name' : '+Startify',
    \ 'n' :  [':n ~/.config/nvim/init.vim' , 'Init.vim'                          ],
    \ 's' :  [':n ~/.config/sxhkd/sxhkdrc' , 'sxhkdrc'                           ],
    \ 'b' :  [':n ~/.config/bspwm/bspwmrc' , 'bspwmrc'                           ],
    \ 'k' :  [':n ~/.config/kitty/kitty.conf' , 'Kitty Conf'                     ],
    \ 'p' :  [':n ~/.config/polybar/config' , 'Polybar Conf'                     ],
    \ 'c' :  [':n ~/.config/picom.conf' , 'Picom Conf'                           ],
    \ 'S' :  [':n ~/Documents/PY-Projects/Shadochan/shadochan.py' , 'Shadochan'  ],
    \ 'w' :  [':n ~/vimwiki/index.md' , 'Vimwiki Index'                          ],
    \ 'm' :  [':n ~/.config/miscellaneous' , 'Misc File'                         ],
    \ 'r' :  [':n ~/.config/rofi/themes/onedark.rasi' , 'Rofi Theme'             ],
    \ 'Z' :  [':n ~/.config/zsh/.zshrc' , 'zshrc'                                ],
    \ 'z' :  [':n ~/.zshenv' , 'zshenv'                                          ],
    \ 'd' :  [':n ~/Documents/' , '~/Documents/'                                 ],
    \ 'ds':  [':n ~/Documents/SchoolWork/' , '~/Documents/SchoolWork/'           ],
    \ 'dh':  [':n ~/Documents/HTB/' , '~/Documents/HTB/'                         ],
    \ 'dc':  [':n ~/Documents/CTF/' , '~/Documents/CTF/'                         ],
    \ 'D' :  [':n ~/Downloads/' , '~/Downloads/'                                 ],
    \ 'ps':  [':n ~/Pictures/Screenshots/' , '~/Pictures/Screenshots/'           ],
    \ 'P' :  [':n ~/Pictures/' , '~/Pictures/'                                   ],
    \ 'M' :  [':n ~/Music/' , '~/Music/'                                         ],
    \ 'sc':  [':n ~/Documents/Shadochan/' , '~/Documents/Shadochan/'             ],
    \ }

" }}}
" +Commentary {{{
let g:which_key_map['/'] = {
    \ 'name' : '+Commenter' ,
    \ '/' : ['Commentary'    , 'Toggles Comment']    ,
    \ '$' : ['<Plug>NERDCommenterToEOL'     , 'Comment to EOL']     ,
    \ 'A' : ['<Plug>NERDCommenterAppend'    , 'Append to EOL']      ,
    \ 's' : ['<Plug>NERDCommenterSexy'      , 'Sexy']               ,
    \ 'u' : ['<Plug>NERDCommenterUncomment' , 'Uncomment']          ,
    \ 'y' : ['<Plug>NERDCommenterYank'      , 'Comment and Yank']   ,
    \ }
" }}}
" +Windows {{{
let g:which_key_map.W = {
    \ 'name' : '+Windows' ,
    \ 'w' : ['<C-W>w'     , 'Swap']                 ,
    \ 'd' : ['<C-W>c'     , 'Delete split']         ,
    \ 'h' : ['<C-W>h'     , 'Swap left']            ,
    \ 'j' : ['<C-W>j'     , 'Swap below']           ,
    \ 'l' : ['<C-W>l'     , 'Swap right']           ,
    \ 'k' : ['<C-W>k'     , 'Swap up']              ,
    \ 'H' : ['<C-W>5<'    , 'Expand left']          ,
    \ 'J' : [':resize +5'  , 'Expand below']         ,
    \ 'L' : ['<C-W>5>'    , 'Expand right']         ,
    \ 'K' : [':resize -5'  , 'Expand up']            ,
    \ '=' : ['<C-W>='     , 'Balance']              ,
    \ 's' : ['<C-W>s'     , 'Split Horizontally']   ,
    \ 'v' : ['<C-W>v'     , 'Split Vertically']     ,
    \ }
" }}}
" +wiki {{{
nmap <Leader>wb <Plug>VimwikiTabIndex
let g:which_key_map.w = {
    \ 'name' : '+Wiki' ,
    \ 'd' : ['<Plug>VimwikiDeleteLink'  , 'Delete']        ,
    \ 'h' : ['<Plug>Vimwiki2HTML'       , 'Convert to html']    ,
    \ 'hh': ['<Plug>Vimwiki2HTMLBrowse' , 'Convert and browse'] ,
    \ 'i' : ['<Plug>VimwikiDiaryIndex'  , 'Opens Diary']        ,
    \ 'r' : ['<Plug>VimwikiRenameLink'  , 'Renames Link']       ,
    \ 's' : ['<Plug>VimwikiUISelect'    , 'Select wiki']        ,
    \ 'b' : ['<Plug>VimwikiTabIndex'    , 'Opens tab of index'] ,
    \ 'w' : ['<Plug>VimwikiIndex'       , 'Opens index']        ,
    \ 'g' : ['<Plug>VimwikiDiaryGenerateLinks', 'Generate Diary'],
    \ 't' : {
        \ 'name' : '+todo',
        \ 'c' : ["<Plug>VimwikiToggleListItem^ddmaGo\<Esc>pI\<right>\<right>~~\<Esc>A~~\<Esc>^db'a" , 'Complete TODO']      ,
        \ 't' : [':n ~/vimwiki/Life/TODO.md' , 'Open TODO']                 ,  
        \ }
    \ }
" }}}
" +lsp {{{
let g:which_key_map.l = {
      \ 'name' : '+lsp',
      \ 'A' : [':<Plug>(coc-codeaction-selected)'     , 'Selection']        ,
      \ 'f' : ['spacevim#lang#util#Format()'          , 'formatting']       ,
      \ 'r' : ['spacevim#lang#util#FindReferences()'  , 'references']       ,
      \ 'R' : ['spacevim#lang#util#Rename()'          , 'rename']           ,
      \ 's' : ['spacevim#lang#util#DocumentSymbol()'  , 'document-symbol']  ,
      \ 'S' : ['spacevim#lang#util#WorkspaceSymbol()' , 'workspace-symbol'] ,
      \ 'g' : {
        \ 'name': '+goto',
        \ 'd' : ['spacevim#lang#util#Definition()'     , 'definition']      ,
        \ 't' : ['spacevim#lang#util#TypeDefinition()' , 'type-definition'] ,
        \ 'i' : ['spacevim#lang#util#Implementation()' , 'implementation']  ,
        \ },
      \ }
" }}}
"  }}}
" }}}
"}}}
" ---------------------------------------------------- "
