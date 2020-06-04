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
    Plug 'mattn/calendar-vim' "niftly little plug that can interract with vimwiki diary!
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
"<--Map Leader Key--------------------------------------------------------------$
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
"<--Tab Settings----------------------------------------------------------------$
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
"<--Numbering-------------------------------------------------------------------$
set number
set relativenumber
"<--Misc------------------------------------------------------------------------$
set nocompatible
set foldmethod=marker
filetype plugin on
"set clipboard+=unnamedplus
" --- Custom Key Commands! --- {{{
"<---General Keys--->
" Copies selected text from split window and paste in other 
vnoremap <F3> y<c-w>wp<c-w>gv
" Turns off all line numbers
nnoremap <F3> :set invnumber invrelativenumber<CR>

"<---Fzf Commands--->
map <C-f> <esc><esc>:Files!<CR>
map <C-A-f> <esc><esc><C-w>v:Files!<CR>
inoremap <C-f> <esc><esc>:BLines!<CR>
nnoremap g<C-c> <esc><esc>:BCommits!<CR>

"<---Arrow keys to resize splits--->
nnoremap <silent><Up>    :resize +2<CR>
nnoremap <silent><Down>  :resize -2<CR>
nnoremap <silent><Left>  :vertical resize +2<CR>
nnoremap <silent><Right> :vertical resize -2<CR>

"<---Adds semi colon to EOL--->
inoremap <A-,> <Esc>A;<Esc>
nnoremap <A-,> A;<Esc>

"<---Split Management--->
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

"<---Create lines to split up files--->
noremap <C-\>k <esc><esc>kyypxVr=A #<esc>:Commentary<CR>
noremap <C-\>j <esc><esc>jyyPxVr=A #<esc>:Commentary<CR>

"<---Leader Keybinds------------------------------------------------------$ {{{
"Search and Replace
nnoremap <leader>R <esc><esc>:%s///gcI<left><left><left><left><left>
noremap <leader>S :Startify<CR>
noremap <leader>T :tabnew<CR>
"<---Buffer Commands--->
nmap <leader>bl :ls<CR>
nmap <silent><leader>bn :bnext<CR>
nmap <silent><leader>bp :bprevious<CR>
nmap <silent><leader>bd :bdelete<CR>
"<---Git Commands--->
nmap <leader>ga :Gwrite<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gB :Gbrowse<CR>
nmap <leader>gl :Glog<CR>
"<---Calendar(Left, Right, Bottom, Fullscreen)--->
noremap <leader>car :CalendarVR<CR>
noremap <leader>cab :CalendarH<CR>
noremap <leader>caf :CalendarT<CR>
"<---Commentary--->
noremap <leader>// :Commentary<CR>
"<---Split Extra(delete, balance)--->
noremap Ww <C-W>c
noremap Wb <C-W>=
"<---VimWiki--->
nmap <Leader>wb :VimwikiTabIndex<CR>
noremap <leader>wd :VimwikiDeleteLink<CR>
noremap <leader>wh :Vimwiki2HTML<CR>
noremap <leader>whh :Vimwiki2HTMLBrowse<CR>
noremap <leader>wi :VimwikiDiaryIndex<CR>
noremap <leader>wr :VimwikiRenameLink<CR>
noremap <leader>ws :VimwikiUISelect<CR>
noremap <leader>wb :VimwikiTabIndex<CR>
noremap <leader>ww :VimwikiIndex<CR>
noremap <leader>wg :VimwikiDiaryGenerateLinks<CR>
noremap <leader>wtt :n ~/vimwiki/Life/TODO.md<CR>
noremap <leader>wtc :VimwikiToggleListItem^ddmaGo\<Esc>pI\<right>\<right>~~\<Esc>A~~\<Esc>^db'a
" }}}
"}}}
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
    \ { 'nv': '~/.config/nvim/init.vim'                                                          },
    \ { 's' : '~/.config/sxhkd/sxhkdrc'                                                          },
    \ { 'b' : '~/.config/bspwm/bspwmrc'                                                          },
    \ { 'k' : '~/.config/kitty/kitty.conf'                                                       },
    \ { 'p' : '~/.config/polybar/config'                                                         },
    \ { 'c' : '~/.config/picom.conf'                                                             },
    \ { 'S' : '~/Documents/PY-Projects/Shadochan/shadochan.py'                                   },
    \ { 'nc': '~/.config/nvim/colors/shado.vim'                                                  },
    \ { 'nw': '~/.config/nvim/snippets/vimwiki.snippets'                                                  },
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
    
"<---Ascii Art(Displayed as title)--->
let g:startify_custom_header = [
    \ '    _________  __                  ___                        __            ',       
    \ '   /   _____/ |  |__  _____     __| _/ _____ _______ _____   |__|  ____     ',
    \ '   \_____  \  |  |  \ \__  \   / __ | /  _  \\_  __ \\__  \  |  | /    \    ',
    \ '   /        \ |   Y  \ / __ \_/ /_/ |(  <_>  )|  | \/ / __ \_|  ||   |  \   ',
    \ '  /_______  / |___|  /(____  /\____ | \_____/ |__|   (____  /|__||___|  /   ',
    \ '          \/       \/      \/      \/                    \/          \/     ',
    \ ]
" }}}
" Plug >-- Signify " {{{
"<---Signs(Are displayed on a side bar to show status)--->
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 0 "\
let g:signify_sign_show_text = 1  " Gets rid of extra numbers
"<---Jump through Hunks--->
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gK
" }}}
" Plug >-- Lightline " {{{
set laststatus=2
set noshowmode

"<---Main Bar Configuration--->
let g:lightline = { 
    \ 'colorscheme': 'deus',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \       [ 'filename', 'helloworld' ] ],
    \   'right': [ [ 'lineinfo' ],
    \               [ 'percent' ] ]
    \ },
    \ }

"<---Config for tabs--->
let g:lightline.tabline = { 
            \ 'left': [ [ 'tabs' ] ],
            \ 'right': [ [  ] ] }

" }}}
" Plug >-- VimWiki " {{{
"<---Sets to markdown instead of vimwiki syntax--->
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"<---Fixes diary on enter--->
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

"<---Allows folding on specific header lvl--->
set foldenable
let g:vim_markdown_folding_level=6

"<---General Settings--->
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
" }}}
" Plug >-- Quick Scope " {{{
let g:qs_highlight_on_keys = ['f', 'F', 't' , 'T'] "Will scope for find and until keys
"<---Set color for qs--->
highlight QuickScopePrimary guifg='#ff00ff' gui=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline
"}}}
"}}}
" ---------------------------------------------------- "
