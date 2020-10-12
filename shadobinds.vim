" ============================================================================================$
"    _________.__                .___    ___.   .__            .___              .__         
"   /   _____/|  |__ _____     __| _/____\_ |__ |__| ____    __| _/______  ___  _|__| _____  
"   \_____  \ |  |  \\__  \   / __ |/  _ \| __ \|  |/    \  / __ |/  ___/  \  \/ /  |/     \ 
"   /        \|   Y  \/ __ \_/ /_/ (  <_> ) \_\ \  |   |  \/ /_/ |\___ \    \   /|  |  Y Y  \
"  /_______  /|___|  (____  /\____ |\____/|___  /__|___|  /\____ /____  > /\ \_/ |__|__|_|  /
"          \/      \/     \/      \/          \/        \/      \/    \/  \/              \/ 
" ==================================================================================================$
"<--General Bindings--------------------------------------------------------------------------------$
"<---General Keys---> {{{
" Copies selected text from split window and paste in other 
vnoremap <F3> y<c-w>wp<c-w>gv
" Turns off all line numbers
nnoremap <F3> :set invnumber invrelativenumber<CR>
"}}}
"<---Fzf Commands---> {{{
map <C-f> <esc><esc>:Files!<CR>
map <C-A-f> <esc><esc><C-w>v:Files!<CR>
inoremap <C-f> <esc><esc>:BLines!<CR>
nnoremap g<C-c> <esc><esc>:BCommits!<CR>
"}}}
"<---Arrow keys to resize splits---> {{{
nnoremap <silent><Up>    :resize +2<CR>
nnoremap <silent><Down>  :resize -2<CR>
nnoremap <silent><Left>  :vertical resize +2<CR>
nnoremap <silent><Right> :vertical resize -2<CR>
"}}}
"<---Split Management---> {{{
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
"}}}
"<---Create lines to split up files---> {{{
noremap <C-\>k <esc><esc>kyypxVr=A #<esc>:Commentary<CR>
noremap <C-\>j <esc><esc>jyyPxVr=A #<esc>:Commentary<CR>
"}}}
"<--Leader Keybinds---------------------------------------------------------------------------------$
"<---Misc---> {{{
"Search and Replace
nnoremap <leader>R <esc><esc>:%s///gcI<left><left><left><left><left>
nnoremap <leader>r :nohl<CR>:redraw!<CR>
"Open (Startify,NewTab)
noremap <leader>S :Startify<CR>
noremap <leader>T :tabnew<CR>
"}}}
"<---Adds semi colon to EOL---> {{{
nnoremap <leader>; <esc>A;<esc>
"}}}
"<---Buffer Commands---> {{{
nmap <leader>bl :ls<CR>
nmap <silent><leader>bb :bnext<CR>
nmap <silent><leader>bp :bprevious<CR>
nmap <silent><leader>bk :bdelete<CR>
"}}}
"<---Git Commands---> {{{
nmap <leader>ga :Gwrite<CR>
nmap <leader>gst :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gB :Gbrowse<CR>
nmap <leader>glo :Git log<CR>
nmap <leader>gl :Git pull<CR>
nmap <leader>gr :GRemove<CR>
nmap <leader>gt :GitGutterSignsToggle<CR>
nmap <leader>gs <Plug>(GitGutterStageHunk)<CR>
nmap <leader>gu <Plug>(GitGutterUndoHunk)<CR>
nmap <leader>gv :GV<CR>
nmap <leader>gV :GV!<CR>
"}}}
"<---Goyo---> {{{
nnoremap <leader>G :Goyo<CR>
"}}}
"<---Calendar(Left, Right, Bottom, Fullscreen)---> {{{
noremap <leader>car :CalendarVR<CR>
noremap <leader>cab :CalendarH<CR>
noremap <leader>caf :CalendarT<CR>
"}}}
"<---Commentary---> {{{
noremap <leader>// :Commentary<CR>
"}}}
"<---Split Extra(delete, balance)---> {{{
noremap Ww <C-W>c
noremap Wb <C-W>=
"}}}
"<---VimWiki---> {{{
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
noremap <leader>wtc :VimwikiToggleListItem^ddmaGo\<Esc>pI\<right>\<right>~~\<Esc>A~~\<Esc>^db'a<CR>
"}}}
" --------------------------------------------------------------------------------------------------$
