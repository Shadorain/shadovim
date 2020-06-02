" ------------------------------------------------------------- "
"   _________.__                .___             .__            "
"  /   _____/|  |__ _____     __| _/____   ___  _|__| _____     "
"  \_____  \ |  |  \\__  \   / __ |/  _ \  \  \/ /  |/     \    "
"  /        \|   Y  \/ __ \_/ /_/ (  <_> )  \   /|  |  Y Y  \   "
" /_______  /|___|  (____  /\____ |\____/ /\ \_/ |__|__|_|  /  "
"         \/      \/     \/      \/       \/              \/   "
" ------------------------------------------------------------- "
" Vim color file - shado.vim
" Author: Shadorain

set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "shado"

" Transparent background
au ColorScheme * hi Normal ctermbg=none guibg=none
highlight SignColumn guibg=none

" Foreground
hi Normal guifg=#dfb7e8 guibg=none
" Cursor Color
hi Cursor guifg=#dfb7e8 guibg=#6161b3 guisp=#6161b3


" Visual Mode
hi Visual guifg=#eed6ee guibg=#40408f guisp=#40408f
" Line Number
hi LineNr guifg=#a1a1dd guibg=NONE
hi CursorLineNr guifg=#de286e guibg=none
" Search
hi Search guifg=#302b30 guibg=#dfb7e8
" Search and Replace
hi IncSearch guifg=#dfb7e8 guibg=#de286e guisp=#8897F4 gui=underline,bold
" Title Text
hi Title guifg=#8897F4 guibg=NONE gui=bold
" Folds
hi Folded guifg=#42128f guibg=none guisp=#42128f gui=italic
hi FoldColumn guifg=#7676cd guibg=#2e292e guisp=#2e292e
" Wild Menu
hi WildMenu guifg=#eed6ee guibg=#5d5daf
" Status Line
hi StatusLine guifg=#1B1B29 guibg=#35355e guisp=#35355e gui=bold
hi StatusLineNC guifg=#1B1B29 guibg=#35355e guisp=#35355e
" Non Text extra characters
hi NonText guifg=#73daff guibg=NONE
" Diff (Text, Delete, Add, Change)
hi DiffText guifg=#e3d3eb guibg=#4d254d guisp=#4d254d
hi DiffDelete guifg=#de286e guibg=none guisp=#c9083f
hi DiffAdd guifg=#37d4a7 guibg=none guisp=#2c9465
hi DiffChange guifg=#2f77a1 guibg=none guisp=#2f77a1

" Comments
hi Comment guifg=#37d4a7 guibg=NONE
hi Todo guifg=#302b30 guibg=#eba4e9 guisp=#eba4e9

" Special
hi Special guifg=#8d4ecc guibg=NONE
hi SpecialComment guifg=#bc6bd0 guibg=NONE
hi SpecialKey guifg=#a048ed guibg=NONE
hi SpecialChar guifg=#bc6bd0 guibg=none
hi Tag guifg=#bc6bd0 guibg=NONE
hi Delimiter guifg=#bc6bd0 guibg=NONE

" Identifiers
hi Identifier guifg=#cd9ad9 guibg=NONE
hi Function guifg=#e086e0 guibg=NONE

" Constant
hi Constant guifg=#de286e guibg=NONE
hi String guifg=#73daff guibg=NONE
hi Character guifg=#eba4e9 guibg=NONE
hi Float guifg=#de286e guibg=NONE
hi Number guifg=#de286e guibg=NONE
hi Boolean guifg=#6875ed guibg=NONE

" Statements
hi Statement guifg=#505ede guibg=NONE
hi Conditional guifg=#6876de guibg=NONE
hi Repeat guifg=#ff71ff guibg=NONE
hi Label guifg=#c081fa guibg=NONE
hi Operator guifg=#73daff guibg=NONE
hi Exception guifg=#ff71ff guibg=NONE
hi Keyword guifg=#c081fa guibg=NONE

" PreProc
hi PreProc guifg=#849be0 guibg=NONE
hi Define guifg=#329090 guibg=NONE
hi Include guifg=#329090 guibg=NONE
hi PreCondit guifg=#29e3e3 guibg=NONE
hi Macro guifg=#329090 guibg=NONE

" Types
hi Type guifg=#8677d9 guibg=NONE
hi Typedef guifg=#8677d9 guibg=NONE
hi StorageClass guifg=#c081fa guibg=NONE
hi Structure guifg=#329090 guibg=NONE

" Debugging
hi Debug guifg=#bc6bd0 guibg=NONE
hi WarningMsg guifg=#ffe5ff guibg=#a83e32 guisp=#a83e32
hi Error guifg=#ffe5ff guibg=#6e2323 guisp=#6e2323
hi ErrorMsg guifg=#ffe5ff guibg=#d12245 guisp=#d12245

" PMenu
hi PMenu guifg=#eed6ee guibg=#3d3d6b guisp=#3d3d6b
hi PMenuSbar guifg=#a883a8 guibg=#5b5b8a guisp=#5b5b8a
hi PMenuSel guifg=#9ce0ba guibg=#25253b guisp=#25253b gui=bold,underline
hi PMenuThumb guifg=#eed6ee guibg=#2e2e40 guisp=#2e2e40
" File Structure
hi Directory guifg=#00bbff guibg=NONE
" Splits
hi VertSplit guifg=#1B1B29 guibg=#35355E guisp=#35355e
" Prompt
hi Question guifg=#90ebba guibg=NONE
hi MoreMsg guifg=#6c6cae guibg=NONE
hi ModeMsg guifg=#fca1e7 guibg=NONE
" Parens
hi MatchParen guifg=#ffe5ff guibg=#2f77a1 guisp=#76ff71
" Links
hi Underlined guifg=#458FAA guibg=NONE
" ------------------------------------------------------------------------- "
" Miscellaneous (Extra stuff) {{{
hi perlspecialmatch guifg=#bc6bd0 guibg=#403940 guisp=#403940
hi perlspecialstring guifg=#bc6bd0 guibg=#403940 guisp=#403940
hi cspecialcharacter guifg=#bc6bd0 guibg=#403940 guisp=#403940
hi taglisttagname guifg=#6875ed guibg=NONE
hi user2 guifg=#6060a0 guibg=#35355e guisp=#35355e
hi user1 guifg=#e5fff3 guibg=#35355e guisp=#35355e

"hi CursorColumn guifg=none guibg=#2F2F4A
"
"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi CTagsClass -- no settings --

"hi TabLineSel -- no settings --
"hi TabLineFill -- no settings --
"hi TabLine -- no settings --
"hi EnumerationValue -- no settings --
"hi Union -- no settings --
"hi VisualNOS -- no settings --
"hi SpellCap -- no settings --
"hi SpellLocal -- no settings --
"hi SpellRare -- no settings --
"hi SpellBad -- no settings --
"hi EnumerationName -- no settings --
"hi DefinedName -- no settings --
"hi LocalVariable -- no settings --
"hi clear -- no settings --
" }}}
