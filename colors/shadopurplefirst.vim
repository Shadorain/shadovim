" Vim color file - shadopurple
" Maintained by Shadorain
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "shadopurple"

"hi SignColumn -- no settings --
"hi TabLineSel -- no settings --
"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#e2b2ed guibg=#1a1a27 guisp=#1a1a27 gui=NONE ctermfg=219 ctermbg=235 cterm=NONE
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
"hi CursorLine -- no settings --
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
hi IncSearch guifg=#302b30 guibg=#cfae99 guisp=#cfae99 gui=NONE ctermfg=236 ctermbg=181 cterm=NONE
hi WildMenu guifg=#eed6ee guibg=#5d5daf guisp=#5d5daf gui=NONE ctermfg=255 ctermbg=61 cterm=NONE
hi SpecialComment guifg=#bc6bd0 guibg=NONE guisp=NONE gui=NONE ctermfg=134 ctermbg=NONE cterm=NONE
hi Typedef guifg=#ff71ff guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Title guifg=#af3e3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
hi Folded guifg=#cfcfb8 guibg=#42128f guisp=#42128f gui=NONE ctermfg=187 ctermbg=54 cterm=NONE
hi PreCondit guifg=#c7a3f0 guibg=NONE guisp=NONE gui=NONE ctermfg=183 ctermbg=NONE cterm=NONE
hi Include guifg=#329090 guibg=NONE guisp=NONE gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
hi StatusLineNC guifg=#b9a6b9 guibg=#35355e guisp=#35355e gui=NONE ctermfg=250 ctermbg=60 cterm=NONE
hi NonText guifg=#7676cd guibg=NONE guisp=NONE gui=NONE ctermfg=104 ctermbg=NONE cterm=NONE
hi DiffText guifg=#ffffb3 guibg=#4a234a guisp=#4a234a gui=NONE ctermfg=229 ctermbg=239 cterm=NONE
hi ErrorMsg guifg=#ffe5ff guibg=#ce3939 guisp=#ce3939 gui=NONE ctermfg=225 ctermbg=167 cterm=NONE
hi Debug guifg=#bc6bd0 guibg=NONE guisp=NONE gui=NONE ctermfg=134 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=#eed6ee guibg=#5d5daf guisp=#5d5daf gui=NONE ctermfg=255 ctermbg=61 cterm=NONE
hi Identifier guifg=#ff71ff guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#bc6bd0 guibg=#403940 guisp=#403940 gui=NONE ctermfg=134 ctermbg=238 cterm=NONE
hi Conditional guifg=#ff71ff guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#ff71ff guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Todo guifg=#2e2b27 guibg=#b09e87 guisp=#b09e87 gui=NONE ctermfg=236 ctermbg=144 cterm=NONE
hi Special guifg=#bc6bd0 guibg=NONE guisp=NONE gui=NONE ctermfg=134 ctermbg=NONE cterm=NONE
hi LineNr guifg=#7676cd guibg=#2e292e guisp=#2e292e gui=NONE ctermfg=104 ctermbg=236 cterm=NONE
hi StatusLine guifg=#b9a6b9 guibg=#35355e guisp=#35355e gui=NONE ctermfg=250 ctermbg=60 cterm=NONE
hi Label guifg=#ff71ff guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi PMenuSel guifg=#eed6ee guibg=#28283f guisp=#28283f gui=NONE ctermfg=255 ctermbg=237 cterm=NONE
hi Search guifg=#302b30 guibg=#cc9a7a guisp=#cc9a7a gui=NONE ctermfg=236 ctermbg=180 cterm=NONE
hi Delimiter guifg=#bc6bd0 guibg=NONE guisp=NONE gui=NONE ctermfg=134 ctermbg=NONE cterm=NONE
hi Statement guifg=#6875ed guibg=NONE guisp=NONE gui=NONE ctermfg=62 ctermbg=NONE cterm=NONE
hi Comment guifg=#41d1b4 guibg=NONE guisp=NONE gui=NONE ctermfg=79 ctermbg=NONE cterm=NONE
hi Character guifg=#ffc171 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Float guifg=#f0a055 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Number guifg=#e6175c guibg=NONE guisp=NONE gui=NONE ctermfg=161 ctermbg=NONE cterm=NONE
hi Boolean guifg=#6875ed guibg=NONE guisp=NONE gui=NONE ctermfg=62 ctermbg=NONE cterm=NONE
hi Operator guifg=#2448b3 guibg=NONE guisp=NONE gui=NONE ctermfg=19 ctermbg=NONE cterm=NONE
hi Question guifg=#fffae5 guibg=NONE guisp=NONE gui=NONE ctermfg=230 ctermbg=NONE cterm=NONE
hi WarningMsg guifg=#ffe5ff guibg=#ce8439 guisp=#ce8439 gui=NONE ctermfg=225 ctermbg=179 cterm=NONE
hi DiffDelete guifg=#ffffb3 guibg=#6d2525 guisp=#6d2525 gui=NONE ctermfg=229 ctermbg=52 cterm=NONE
hi ModeMsg guifg=#6c6cae guibg=NONE guisp=NONE gui=NONE ctermfg=61 ctermbg=NONE cterm=NONE
hi Define guifg=#329090 guibg=NONE guisp=NONE gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
hi Function guifg=#c94c7e guibg=NONE guisp=NONE gui=NONE ctermfg=168 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#7676cd guibg=#2e292e guisp=#2e292e gui=NONE ctermfg=104 ctermbg=236 cterm=NONE
hi PreProc guifg=#14777a guibg=NONE guisp=NONE gui=NONE ctermfg=6 ctermbg=NONE cterm=NONE
hi Visual guifg=#eed6ee guibg=#40408f guisp=#40408f gui=NONE ctermfg=255 ctermbg=60 cterm=NONE
hi MoreMsg guifg=#6c6cae guibg=NONE guisp=NONE gui=NONE ctermfg=61 ctermbg=NONE cterm=NONE
hi VertSplit guifg=#b9a6b9 guibg=#35355e guisp=#35355e gui=NONE ctermfg=250 ctermbg=60 cterm=NONE
hi Exception guifg=#ff71ff guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Keyword guifg=#ff71ff guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Type guifg=#ae4ac2 guibg=NONE guisp=NONE gui=NONE ctermfg=134 ctermbg=NONE cterm=NONE
hi DiffChange guifg=#ffffb3 guibg=#22658f guisp=#22658f gui=NONE ctermfg=229 ctermbg=24 cterm=NONE
hi Cursor guifg=#403940 guibg=#7171ff guisp=#7171ff gui=NONE ctermfg=238 ctermbg=12 cterm=NONE
hi Error guifg=#ffe5ff guibg=#6e2323 guisp=#6e2323 gui=NONE ctermfg=225 ctermbg=52 cterm=NONE
hi PMenu guifg=#eed6ee guibg=#40408f guisp=#40408f gui=NONE ctermfg=255 ctermbg=60 cterm=NONE
hi SpecialKey guifg=#a048ed guibg=NONE guisp=NONE gui=NONE ctermfg=135 ctermbg=NONE cterm=NONE
hi Constant guifg=#40aed6 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
hi Tag guifg=#bc6bd0 guibg=NONE guisp=NONE gui=NONE ctermfg=134 ctermbg=NONE cterm=NONE
hi String guifg=#73beff guibg=#403940 guisp=#403940 gui=NONE ctermfg=75 ctermbg=238 cterm=NONE
hi PMenuThumb guifg=#eed6ee guibg=#5d5daf guisp=#5d5daf gui=NONE ctermfg=255 ctermbg=61 cterm=NONE
hi MatchParen guifg=#403940 guibg=#76ff71 guisp=#76ff71 gui=NONE ctermfg=238 ctermbg=83 cterm=NONE
hi Repeat guifg=#ff71ff guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Directory guifg=#e5fff3 guibg=NONE guisp=NONE gui=NONE ctermfg=195 ctermbg=NONE cterm=NONE
hi Structure guifg=#ff71ff guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi Macro guifg=#329090 guibg=NONE guisp=NONE gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
hi Underlined guifg=#df9617 guibg=NONE guisp=NONE gui=NONE ctermfg=172 ctermbg=NONE cterm=NONE
hi DiffAdd guifg=#b5ffd8 guibg=#256d25 guisp=#256d25 gui=NONE ctermfg=158 ctermbg=22 cterm=NONE
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
