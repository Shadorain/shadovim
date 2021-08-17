" ============================================================================================$
"    _________.__                .___    ___.   .__            .___              .__         
"   /   _____/|  |__ _____     __| _/____\_ |__ |__| ____    __| _/______  ___  _|__| _____  
"   \_____  \ |  |  \\__  \   / __ |/  _ \| __ \|  |/    \  / __ |/  ___/  \  \/ /  |/     \ 
"   /        \|   Y  \/ __ \_/ /_/ (  <_> ) \_\ \  |   |  \/ /_/ |\___ \    \   /|  |  Y Y  \
"  /_______  /|___|  (____  /\____ |\____/|___  /__|___|  /\____ /____  > /\ \_/ |__|__|_|  /
"          \/      \/     \/      \/          \/        \/      \/    \/  \/              \/ 
" ==================================================================================================$
"<--General Bindings--------------------------------------------------------------------------------$
"<---Top 5 Remaps (that I didn't have already...)---> {{{
" keep screen centered...
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Moving text
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
"}}}
"<---General Keys---> {{{
" Copies selected text from split window and paste in other 
vnoremap <F3> y<c-w>wp<c-w>gv
" Turns off all line numbers
nnoremap <F3> :set invnumber invrelativenumber<CR>
" Similar use as with `C`/`D`, copies to end of line instead of full line
nnoremap Y y$
" Refresh vim without restarting (cscope too): doesn't work well at all lol
nnoremap <F5> :source ~/.config/nvim/init.vim<CR>:source ~/.config/nvim/plug-config/config.vim<CR>:source ~/.config/nvim/shadobinds.vim<CR>:source ~/.config/nvim/colors/xshado.vim<CR>
nnoremap <F6> :!cscope -Rbq<CR>:cd reset<CR><CR> 

nnoremap <C-j> ddkPJ
" inoremap jk <Esc>
" inoremap kj <Esc>
" inoremap kk <Esc>
" inoremap jj <Esc>
inoremap ;; <Esc>A;<Esc>
"}}}
"<---Project Management---> {{{
" nnoremap <C-/> <esc>:vimgrep
"}}}
"<---Tabout---> {{{
inoremap <expr> <C-l> getline('.')[col('.')-1] =~? '[]>)}''"`]' ? '<Right>' : '<Right>' 
": '<Tab>'
"}}}
"<---Telescope/Fzf Commands---> {{{
map <C-f> <esc><cmd>Telescope find_files<cr>
map <leader>fr <esc><cmd>Telescope find_files<cr>
map <C-A-f> <esc><esc><C-w>v<cmd>Telescope find_files<CR>
inoremap <C-f> <esc><esc><cmd>Telescope live_grep<CR>
nnoremap <leader>bv <esc><esc><cmd>Telescope buffers<CR>
nnoremap <C-b> <esc><esc><cmd>Telescope buffers<CR>
nnoremap <leader>bc <esc><esc><cmd>Telescope git_commits<CR>
" map <C-f> <esc><esc>:Files<CR>
" map <leader>fr <esc><esc>:Files<CR>
" map <C-A-f> <esc><esc><C-w>v:Files<CR>
" inoremap <C-f> <esc><esc>:BLines<CR>
" nnoremap <leader>bc <esc><esc>:BCommits<CR>
" nnoremap <leader>bv <esc><esc>:Buffers<CR>
" nnoremap <C-b> <esc><esc>:Buffers<CR>
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
" map <leader>th <C-w>t<C-w>H
" map <leader>tk <C-w>t<C-w>K
map <leader>h <C-w>h
" map <leader>k <C-w>k
"}}}
"<---Create lines to split up files---> {{{
noremap <C-\>k <esc><esc>kyypxVr=A #<esc>:Commentary<CR>
noremap <C-\>j <esc><esc>jyyPxVr=A #<esc>:Commentary<CR>
"}}}
"<---Hop---> {{{
" nnoremap <C-c>h :HopChar1<CR>
" lua vim.api.nvim_set_keymap('n', '<C-c>h', "<cmd>lua require'hop'.hint_char1()<cr>", {})
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
"<--- C Lang ---> {{{
"<---- Cscope ----> {{{
noremap <leader>ss <esc>:cs find s <C-R>=expand("<cword>")<CR><CR>
noremap <leader>sc <esc>:cs find c <C-R>=expand("<cword>")<CR><CR>
noremap <leader>sg <esc>:cs find g <C-R>=expand("<cword>")<CR><CR>
noremap <leader>se <esc>:cs find e <C-R>=expand("<cword>")<CR><CR>
noremap <leader>sf <esc>:cs find f <C-R>=expand("<cword>")<CR><CR>
noremap <leader>si <esc>:cs find i ^<C-R>=expand("<cword>")<CR><CR>
noremap <leader>sd <esc>:cs find d <C-R>=expand("<cword>")<CR><CR>

noremap <leader>sss <esc>:scs find s <C-R>=expand("<cword>")<CR><CR>
noremap <leader>ssc <esc>:scs find c <C-R>=expand("<cword>")<CR><CR>
noremap <leader>ssg <esc>:scs find g <C-R>=expand("<cword>")<CR><CR>
noremap <leader>sse <esc>:scs find e <C-R>=expand("<cword>")<CR><CR>
noremap <leader>ssf <esc>:scs find f <C-R>=expand("<cword>")<CR><CR>
noremap <leader>ssi <esc>:scs find i ^<C-R>=expand("<cword>")<CR><CR>
noremap <leader>ssd <esc>:scs find d <C-R>=expand("<cword>")<CR><CR>
"}}}
"}}}
"<--- Floaterm ---> {{{
nnoremap <silent><leader>bm :FloatermToggle<CR>
tnoremap <silent><leader>bm <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent><leader>b, :FloatermNew --wintype=normal --height=8<CR>
tnoremap <silent><leader>b, <C-\><C-n>:FloatermNew --wintype=normal --height=8<CR>
tnoremap <silent><leader>bb <C-\><C-n>:FloatermPrev<CR>
tnoremap <silent><leader>bb <C-\><C-n>:FloatermNext<CR>
tnoremap <silent><leader>bk <C-\><C-n>:FloatermKill <CR>
" }}}
"<---Buffer Commands---> {{{
nmap <leader>bl :ls<CR>
nmap <silent><leader>bb :bnext<CR>
nmap <silent><leader>bn :bprevious<CR>
nmap <silent><leader>bk :bp\|bd # <CR>
nnoremap <leader>b1 :b 1<CR>
nnoremap <leader>b2 :b 2<CR>
nnoremap <leader>b3 :b 3<CR>
nnoremap <leader>b4 :b 4<CR>
nnoremap <leader>b5 :b 5<CR>
nnoremap <leader>b6 :b 6<CR>
nnoremap <leader>b7 :b 7<CR>
nnoremap <leader>b8 :b 8<CR>
nnoremap <leader>b9 :b 9<CR>
" Buff menu
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
" nnoremap <leader>bm :b <C-Z>
"}}}
"<---Git Commands---> {{{
nmap <leader>ga :Gwrite<CR>
nmap <leader>gst :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Telescope git_commits<CR>
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
