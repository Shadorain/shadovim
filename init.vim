" ==============================================================================$ 
"   _________.__                .___     .__       .__  __         .__           
"  /   _____/|  |__ _____     __| _/____ |__| ____ |__|/  |_ ___  _|__| _____    
"  \_____  \ |  |  \\__  \   / __ |/  _ \|  |/    \|  \   __\\  \/ /  |/     \   
"  /        \|   Y  \/ __ \_/ /_/ (  <_> )  |   |  \  ||  |   \   /|  |  Y Y  \  
" /_______  /|___|  (____  /\____ |\____/|__|___|  /__||__| /\ \_/ |__|__|_|  /  
"         \/      \/     \/      \/              \/         \/              \/   
" =====================================================================================$
"<--Colors-----------------------------------------------------------------------------$
syntax enable "Allows for syntax highlighting
set termguicolors "Allows for hex coloring
set t_ut= "No idea lols
colorscheme xshado
set listchars=space:·
"<--Map Leader Key---------------------------------------------------------------------$
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
"<--Tab Settings-----------------------------------------------------------------------$
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
"<--Numbering--------------------------------------------------------------------------$
set number
set relativenumber
"<--Misc-------------------------------------------------------------------------------$
set nocompatible
set splitright
set foldmethod=marker
filetype plugin on

"set clipboard+=unnamedplus
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" -------------------------------------------------------------------------------------$
"<---Sources----> {{{
source $HOME/.config/nvim/plug-config/shadoplug.vim
source $HOME/.config/nvim/plug-config/config.vim
source $HOME/.config/nvim/shadobinds.vim
"}}}
" -------------------------------------------------------------------------------------$
