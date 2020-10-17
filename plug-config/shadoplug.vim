" =========================================================================================$
"    _________.__                .___            .__                       .__         
"   /   _____/|  |__ _____     __| _/____ ______ |  |  __ __  ____   ___  _|__| _____  
"   \_____  \ |  |  \\__  \   / __ |/  _ \\____ \|  | |  |  \/ ___\  \  \/ /  |/     \ 
"   /        \|   Y  \/ __ \_/ /_/ (  <_> )  |_> >  |_|  |  / /_/  >  \   /|  |  Y Y  \
"  /_______  /|___|  (____  /\____ |\____/|   __/|____/____/\___  / /\ \_/ |__|__|_|  /
"          \/      \/     \/      \/      |__|             /_____/  \/              \/ 
" ================================================================================================$
"<--Shado Plugins---------------------------------------------------------------------------------$ {{{
call plug#begin('~/.local/share/nvim/plugged')
    "<--General-----------------------------------------------------------------------------------$
    Plug 'MattesGroeger/vim-bookmarks', "Plugin to bookmark lines of code
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "To have the plug right under this one
    Plug 'junegunn/fzf.vim' "Allows for some sweet fuzzy finding within vim without having to exit
    Plug 'vimwiki/vimwiki' "Probably my fav plug, use it daily for all my notes, its quite amazing
    "<--Ease of use-------------------------------------------------------------------------------$
    Plug 'makerj/vim-pdf'
    Plug 'unblevable/quick-scope' "Saves SO MUCH TIME when using the f/F keys, just use it!
    Plug 'easymotion/vim-easymotion' "Highly advanced real time more efficient search! haha
    Plug 'tpope/vim-commentary' "Makes commenting 100x easier and better. Just use it ull see
    Plug 'mattn/calendar-vim' "niftly little plug that can interract with vimwiki diary!
    "<--That Rice Stuff---------------------------------------------------------------------------$
    Plug 'itchyny/lightline.vim' "Adds that sexy bar your seeing at bottom of ur vim window
    Plug 'godlygeek/tabular' "Makes having sexy code so much easier: organized your tabbed stuff
    Plug 'junegunn/goyo.vim' "Adds like a focus mode to vim, its quite nice tbh
    Plug 'mhinz/vim-startify' "I find this to be one of the coolest, sexiest, and most useful plugs
        "it allows for a start s2creen in vim with whatever the hell u want, and its amazing
    "<--Git Integration---------------------------------------------------------------------------$
    Plug 'airblade/vim-gitgutter'
    " Plug 'mhinz/vim-signify' "Extremely useful, handles git changes/deletes/additions in a sidebar
    Plug 'tpope/vim-fugitive' "`:Git`&`:G...` functionality, can do alot with this bad boy
    Plug 'tpope/vim-rhubarb' "Adds on to fugitives functionality
    Plug 'junegunn/gv.vim' "View your git commits in a nice vim window
    "<--LSP---------------------------------------------------------------------------------------$
    "<--Syntax------------------------------------------------------------------------------------$
    " Plug 'alx741/vim-hindent' "More Sexy syntax for haskell babyyyy
    " Plug 'alx741/vim-stylishask' "More Sexy syntax for haskell babyyyy x2!!!
    Plug 'neovimhaskell/haskell-vim' "Adds better syntax highlighting for Haskell
    Plug 'plasticboy/vim-markdown' "Def keep if u use md. Comes quite in handy for alot of md stuff
    Plug 'sheerun/vim-polyglot' "Adds some better syntax for quite a few languages
    "<--Snippets----------------------------------------------------------------------------------$
    Plug 'honza/vim-snippets' "Paired with coc-snippets; adds quite a few premade snippets
    "<--Coc Suite (Most of it is handled by coc itself)-------------------------------------------$
    Plug 'neoclide/coc.nvim', {'branch': 'release'} "Massive suite with alotta good stuff!
    "coc-clangd, coc-highlight, coc-lists, coc-python, coc-snippets, coc-todolists, coc-vimlsp, coc-yank
    "<--Unused Plugins------------------------------------------------------------------$ {{{
    " Plug 'tpope/vim-surround' "Surrounds your braces, parens, quotes etc to save you a keypress
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
"}}}
"<---Vim Plug Installer-------------------------------------------------------------$ {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"}}}
" ------------------------------------------------------------------------------------------------$
