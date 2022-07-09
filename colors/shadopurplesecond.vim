" Vim color file - shadopurple2
" Author: Shadorain
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "shadopurple2"

" Custom highlights

"hi SignColumn -- no settings --
"hi TabLineSel -- no settings --
"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#dfb7e8 guibg=#1b1b29 guisp=#1b1b29 gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
hi CursorLineNr guifg=#de286e guibg=none guisp=#1b1b29 gui=NONE ctermfg=254 ctermbg=235 cterm=NONE " guibg=#1b1b29
"hi Union -- no settings --
"hi TabLineFill -- no settings --
"hi VisualNOS -- no settings --
"hi CursorColumn -- no settings --
"hi EnumerationName -- no settings --
"hi SpellCap -- no settings --
"hi SpellLocal -- no settings --
"hi DefinedName -- no settings --
"hi LocalVariable -- no settings --
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
"hi TabLine -- no settings --
"hi clear -- no settings --
hi IncSearch guifg=#302b30 guibg=#db9569 guisp=#db9569 gui=NONE ctermfg=236 ctermbg=173 cterm=NONE
hi WildMenu guifg=#eed6ee guibg=#5d5daf guisp=#5d5daf gui=NONE ctermfg=255 ctermbg=61 cterm=NONE
hi SpecialComment guifg=#bc6bd0 guibg=NONE guisp=NONE gui=NONE ctermfg=134 ctermbg=NONE cterm=NONE
hi Typedef guifg=#8677d9 guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Title guifg=#8897F4 guibg=NONE guisp=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE "#00bbff #8897F4
hi Folded guifg=#42128f guibg=none guisp=#42128f gui=NONE ctermfg=187 ctermbg=54 cterm=NONE  " #42128f
hi PreCondit guifg=#29e3e3 guibg=NONE guisp=NONE gui=NONE ctermfg=44 ctermbg=NONE cterm=NONE
hi Include guifg=#329090 guibg=NONE guisp=NONE gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
hi StatusLineNC guifg=#cfc3cf guibg=#35355e guisp=#35355e gui=NONE ctermfg=252 ctermbg=60 cterm=NONE
hi NonText guifg=#73daff guibg=NONE guisp=NONE gui=NONE ctermfg=168 ctermbg=NONE cterm=NONE
hi DiffText guifg=#e3d3eb guibg=#4d254d guisp=#4d254d gui=NONE ctermfg=255 ctermbg=239 cterm=NONE
hi ErrorMsg guifg=#ffe5ff guibg=#d12245 guisp=#d12245 gui=NONE ctermfg=225 ctermbg=160 cterm=NONE
hi Debug guifg=#bc6bd0 guibg=NONE guisp=NONE gui=NONE ctermfg=134 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=#a883a8 guibg=#5b5b8a guisp=#5b5b8a gui=NONE ctermfg=139 ctermbg=60 cterm=NONE
hi Identifier guifg=#cd9ad9 guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#bc6bd0 guibg=#403940 guisp=#403940 gui=NONE ctermfg=134 ctermbg=238 cterm=NONE
hi Conditional guifg=#6876de guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#c081fa guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Todo guifg=#302b30 guibg=#eba4e9 guisp=#eba4e9 gui=NONE ctermfg=236 ctermbg=219 cterm=NONE
hi Special guifg=#8d4ecc guibg=NONE guisp=NONE gui=NONE ctermfg=134 ctermbg=NONE cterm=NONE
hi LineNr guifg=#a1a1dd guibg=NONE guisp=NONE gui=NONE ctermfg=146 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#edc7ed guibg=#35355e guisp=#35355e gui=bold ctermfg=225 ctermbg=60 cterm=bold
hi Label guifg=#c081fa guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi PMenuSel guifg=#9ce0ba guibg=#25253b guisp=#25253b gui=bold,underline ctermfg=115 ctermbg=237 cterm=bold,underline
hi Search guifg=#302b30 guibg=#c2a594 guisp=#c2a594 gui=NONE ctermfg=236 ctermbg=138 cterm=NONE
hi Delimiter guifg=#bc6bd0 guibg=NONE guisp=NONE gui=NONE ctermfg=134 ctermbg=NONE cterm=NONE
hi Statement guifg=#505ede guibg=NONE guisp=NONE gui=NONE ctermfg=62 ctermbg=NONE cterm=NONE
hi Comment guifg=#37d4a7 guibg=NONE guisp=NONE gui=NONE ctermfg=79 ctermbg=NONE cterm=NONE
hi Character guifg=#ffc171 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Float guifg=#de286e guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Number guifg=#de286e guibg=NONE guisp=NONE gui=NONE ctermfg=168 ctermbg=NONE cterm=NONE
hi Boolean guifg=#6875ed guibg=NONE guisp=NONE gui=NONE ctermfg=62 ctermbg=NONE cterm=NONE
hi Operator guifg=#73daff guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
hi Question guifg=#90ebba guibg=NONE guisp=NONE gui=NONE ctermfg=115 ctermbg=NONE cterm=NONE
hi WarningMsg guifg=#ffe5ff guibg=#ce8439 guisp=#ce8439 gui=NONE ctermfg=225 ctermbg=179 cterm=NONE
hi DiffDelete guifg=#de286e guibg=none guisp=#c9083f gui=NONE ctermfg=252 ctermbg=1 cterm=NONE "#c9083f  
hi ModeMsg guifg=#fca1e7 guibg=NONE guisp=NONE gui=NONE ctermfg=219 ctermbg=NONE cterm=NONE
hi Define guifg=#329090 guibg=NONE guisp=NONE gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
hi Function guifg=#e086e0 guibg=NONE guisp=NONE gui=NONE ctermfg=176 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#7676cd guibg=#2e292e guisp=#2e292e gui=NONE ctermfg=104 ctermbg=236 cterm=NONE
hi PreProc guifg=#849be0 guibg=NONE guisp=NONE gui=NONE ctermfg=73 ctermbg=NONE cterm=NONE " guifg=#3ba3a3
hi Visual guifg=#eed6ee guibg=#40408f guisp=#40408f gui=NONE ctermfg=255 ctermbg=60 cterm=NONE
hi MoreMsg guifg=#6c6cae guibg=NONE guisp=NONE gui=NONE ctermfg=61 ctermbg=NONE cterm=NONE
hi VertSplit guifg=#b9a6b9 guibg=#35355e guisp=#35355e gui=NONE ctermfg=250 ctermbg=60 cterm=NONE
hi Exception guifg=#ff71ff guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Keyword guifg=#c081fa guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Type guifg=#8677d9 guibg=NONE guisp=NONE gui=NONE ctermfg=104 ctermbg=NONE cterm=NONE
hi DiffChange guifg=#2f77a1 guibg=none guisp=#2f77a1 gui=NONE ctermfg=253 ctermbg=67 cterm=NONE " #2f77a1
hi Cursor guifg=#8d9be0 guibg=#6161b3 guisp=#6161b3 gui=NONE ctermfg=104 ctermbg=61 cterm=NONE
hi Error guifg=#ffe5ff guibg=#6e2323 guisp=#6e2323 gui=NONE ctermfg=225 ctermbg=52 cterm=NONE
hi PMenu guifg=#eed6ee guibg=#3d3d6b guisp=#3d3d6b gui=NONE ctermfg=255 ctermbg=60 cterm=NONE
hi SpecialKey guifg=#a048ed guibg=NONE guisp=NONE gui=NONE ctermfg=135 ctermbg=NONE cterm=NONE
hi Constant guifg=#de286e guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Tag guifg=#bc6bd0 guibg=NONE guisp=NONE gui=NONE ctermfg=134 ctermbg=NONE cterm=NONE
hi String guifg=#73daff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=#eed6ee guibg=#2e2e40 guisp=#2e2e40 gui=NONE ctermfg=255 ctermbg=238 cterm=NONE
hi MatchParen guifg=#ffe5ff guibg=#2f77a1 guisp=#76ff71 gui=NONE ctermfg=238 ctermbg=83 cterm=NONE
hi Repeat guifg=#ff71ff guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Directory guifg=#00bbff guibg=NONE guisp=NONE gui=NONE ctermfg=195 ctermbg=NONE cterm=NONE
hi Structure guifg=#329090 guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Macro guifg=#329090 guibg=NONE guisp=NONE gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
hi Underlined guifg=#458FAA guibg=NONE guisp=NONE gui=NONE ctermfg=172 ctermbg=NONE cterm=NONE
hi DiffAdd guifg=#37d4a7 guibg=none guisp=#2c9465 gui=NONE ctermfg=235 ctermbg=29 cterm=NONE
hi cursorim guifg=#403940 guibg=#7171ff guisp=#7171ff gui=NONE ctermfg=238 ctermbg=12 cterm=NONE
hi mbenormal guifg=#cfb699 guibg=#28283f guisp=#28283f gui=NONE ctermfg=180 ctermbg=237 cterm=NONE
hi perlspecialstring guifg=#bc6bd0 guibg=#403940 guisp=#403940 gui=NONE ctermfg=134 ctermbg=238 cterm=NONE
hi doxygenspecial guifg=#fdc577 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi mbechanged guifg=#eed6ee guibg=#28283f guisp=#28283f gui=NONE ctermfg=255 ctermbg=237 cterm=NONE
hi mbevisiblechanged guifg=#eed6ee guibg=#40408f guisp=#40408f gui=NONE ctermfg=255 ctermbg=60 cterm=NONE
hi doxygenparam guifg=#fdc577 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi doxygensmallspecial guifg=#fdc577 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi doxygenprev guifg=#fdc577 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi perlspecialmatch guifg=#bc6bd0 guibg=#403940 guisp=#403940 gui=NONE ctermfg=134 ctermbg=238 cterm=NONE
hi cformat guifg=#bc6bd0 guibg=#403940 guisp=#403940 gui=NONE ctermfg=134 ctermbg=238 cterm=NONE
hi lcursor guifg=#403940 guibg=#76ff71 guisp=#76ff71 gui=NONE ctermfg=238 ctermbg=83 cterm=NONE
hi doxygenspecialmultilinedesc guifg=#adaaa7 guibg=NONE guisp=NONE gui=NONE ctermfg=145 ctermbg=NONE cterm=NONE
hi taglisttagname guifg=#6875ed guibg=NONE guisp=NONE gui=NONE ctermfg=62 ctermbg=NONE cterm=NONE
hi doxygenbrief guifg=#fd9f46 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi mbevisiblenormal guifg=#cfcfb8 guibg=#40408f guisp=#40408f gui=NONE ctermfg=187 ctermbg=60 cterm=NONE
hi user2 guifg=#6060a0 guibg=#35355e guisp=#35355e gui=NONE ctermfg=61 ctermbg=60 cterm=NONE
hi user1 guifg=#e5fff3 guibg=#35355e guisp=#35355e gui=NONE ctermfg=195 ctermbg=60 cterm=NONE
hi doxygenspecialonelinedesc guifg=#adaaa7 guibg=NONE guisp=NONE gui=NONE ctermfg=145 ctermbg=NONE cterm=NONE
hi doxygencomment guifg=#ad760f guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
hi cspecialcharacter guifg=#bc6bd0 guibg=#403940 guisp=#403940 gui=NONE ctermfg=134 ctermbg=238 cterm=NONE
