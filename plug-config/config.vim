" =============================================================$
"  _________                _____.__               .__         
"  \_   ___ \  ____   _____/ ____\__| ____   ___  _|__| _____  
"  /    \  \/ /  _ \ /    \   __\|  |/ ___\  \  \/ /  |/     \ 
"  \     \___(  <_> )   |  \  |  |  / /_/  >  \   /|  |  Y Y  \
"   \______  /\____/|___|  /__|  |__\___  / /\ \_/ |__|__|_|  /
"          \/            \/        /_____/  \/              \/ 
" ================================================================$
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
    \ { 'nv': '~/.config/nvim/init.vim'                                                                   },
    \ { 'np': '~/.config/nvim/plug-config/shadoplug.vim'                                                  },
    \ { 'nc': '~/.config/nvim/plug-config/config.vim'                                                     },
    \ { 'nk': '~/.config/nvim/shadobinds.vim'                                                             },
    \ { 'ns': '~/.config/nvim/colors/shado.vim'                                                           },
    \ { 'nw': '~/.config/nvim/snippets/vimwiki.snippets'                                                  },
    \ { 'nl': '~/.local/share/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/deus.vim'         },
    \ { 's' : '~/.config/sxhkd/sxhkdrc'                                                                   },
    \ { 'b' : '~/.config/bspwm/bspwmrc'                                                                   },
    \ { 'k' : '~/.config/kitty/kitty.conf'                                                                },
    \ { 'p' : '~/.config/polybar/config'                                                                  },
    \ { 'c' : '~/.config/picom.conf'                                                                      },
    \ { 'S' : '~/Documents/PY-Projects/Shadochan/shadochan.py'                                            },
    \ { 'w' : '~/vimwiki/index.md'                                                                        },
    \ { 'm' : '~/.config/miscellaneous'                                                                   },
    \ { 'r' : '~/.config/rofi/themes/onedark.rasi'                                                        },
    \ { 'za': '~/.config/zsh/zsh_aliases'                                                                 },
    \ { 'zc': '~/.config/zsh/.zshrc'                                                                      },
    \ { 'ze': '~/.zshenv'                                                                                 },
    \ { 'd' : '~/Documents/'                                                                              },
    \ { 'ds': '~/Documents/SchoolWork/'                                                                   },
    \ { 'dh': '~/Documents/HTB/'                                                                          },
    \ { 'dc': '~/Documents/Shadochan/'                                                                    },
    \ { 'D' : '~/Downloads/'                                                                              },
    \ { 'pc': '~/Pictures/'                                                                               },
    \ { 'ps': '~/Pictures/Screenshots/'                                                                   },
    \ { 'M' : '~/Music/'                                                                                  },
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
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md', 'auto_diary_index': 1}]

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
" ----------------------------------------------------------------$
