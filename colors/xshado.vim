" Name:         Xshado
" Description:  A Vim port of the default dark Xcode 11 colourscheme
" Author:       Shadorain <shadorain.elite@gmail.com>
" Maintainer:   Shadorain <shadorain.elite@gmail.com>
" License:      Vim License (see `:help license`)
" Last Updated: Sat 9 Jan 22:45:10 2021

" Generated by Shadorain

set background=dark
hi clear
" set t_Co=256
let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let g:colors_name = 'xshado'

" 16 Bit colors
let g:terminal_color_0 = '#140a1d'
let g:terminal_color_1 = '#B52A5B'
let g:terminal_color_2 = '#FF4971'
let g:terminal_color_3 = '#8897F4'
let g:terminal_color_4 = '#bd93f9'
let g:terminal_color_5 = '#E9729D'
let g:terminal_color_6 = '#F18FB0'
let g:terminal_color_7 = '#f1c4e0'
" Bright
let g:terminal_color_8 = '#a8899c'
let g:terminal_color_9 = '#B52A5B'
let g:terminal_color_10 = '#FF4971'
let g:terminal_color_11 = '#8897F4'
let g:terminal_color_12 = '#bd93f9'
let g:terminal_color_13 = '#E9729D'
let g:terminal_color_14 = '#F18FB0'
let g:terminal_color_15 = '#f1c4e0'

" Transparent background
au ColorScheme * hi Normal ctermbg=none guibg=none
highlight SignColumn guibg=none

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#140a1d', '#B52A5B', '#FF4971', '#8897F4',
        \ '#bd93f9', '#E9729D', '#F18FB0', '#f1c4e0', '#a8899c', '#B52A5B',
        \ '#FF4971', '#8897F4', '#bd93f9', '#E9729D', '#F18FB0', '#f1c4e0']
  hi Normal guifg=#dfb7e8 guibg=none
  " hi None guifg=#dfdfe0 guibg=NONE

  hi Cursor guifg=#dfb7e8 guibg=#6161b3 guisp=#6161b3
  hi CursorLine guibg=#1B1B29 guisp=#6161b3
  hi CursorColumn guibg=#1B1B29 guisp=#6161b3
  hi CursorLineNr guifg=#de286e guibg=none
  hi LineNr guifg=#a1a1dd guibg=NONE

  hi Search guifg=#302b30 guibg=#dfb7e8
  hi IncSearch guifg=#dfb7e8 guibg=#de286e guisp=#8897F4 gui=underline,bold
  " hi Visual guifg=NONE guibg=#40408f guisp=#40408f
  hi Visual guifg=NONE guibg=#414453
  hi EndOfBuffer guifg=#E9729D guibg=NONE
  hi Folded guifg=#53606e guibg=NONE
  hi FoldColumn guifg=#53606e guibg=NONE
  hi MatchWord guifg=#0f5bca guibg=NONE
  hi MatchParen guifg=#8be9fd guibg=NONE
  hi Signify guifg=#4484d1 guibg=NONE
  hi Ignore guifg=#53606e guibg=NONE

  hi Pmenu guifg=#eed6ee guibg=#1B1B29 guisp=#3d3d6b
  hi PmenuSbar guifg=#a883a8 guibg=#2F2F4A guisp=#5b5b8a
  hi PmenuSel guifg=#6876de guibg=#2F2F4A guisp=#2F2F4A gui=bold,underline
  hi PmenuThumb guifg=#eed6ee guibg=#5b5b8a guisp=#2F2F4A

  hi FloatermNC guifg=#6161b3
  hi FloatermBorder guifg=#ff79c6

  " hi Error guifg=#292a30 guibg=#6e2323
  hi Error guifg=#ac2958 guibg=NONE
  hi ErrorMsg guifg=#ff8170 guibg=NONE
  hi ModeMsg guifg=#fca1e7 guibg=NONE
  hi MoreMsg guifg=#ff7ab2 guibg=NONE
  hi Question guifg=#ff7ab2 guibg=NONE
  hi WarningMsg guifg=#F18FB0 guibg=NONE

  hi ColorColumn guifg=NONE guibg=#2f3037
  hi QuickFixLine guifg=#dfdfe0 guibg=#0f5bca
  hi StatusLine guifg=#1B1B29 guibg=#35355e guisp=#35355e gui=bold
  hi StatusLineNC guifg=#1B1B29 guibg=#35355e guisp=#35355e
  hi VertSplit guifg=#1B1B29 guibg=#35355E guisp=#35355e
  hi WildMenu guifg=#eed6ee guibg=#5d5daf

  hi DiffAdd guifg=#37d4a7 guibg=none guisp=#2c9465
  hi DiffChange guifg=#2f77a1 guibg=none guisp=#2f77a1
  hi DiffDelete guifg=#de286e guibg=none guisp=#c9083f
  hi DiffText guifg=#e3d3eb guibg=#4d254d guisp=#4d254d

  hi Comment guifg=#6272a4 guibg=NONE

  hi Special guifg=#5d5daf guibg=NONE
  hi SpecialComment guifg=#bc6bd0 guibg=NONE
  hi SpecialKey guifg=#a048ed guibg=NONE
  hi SpecialChar guifg=#bc6bd0 guibg=none
  hi Tag guifg=#bc6bd0 guibg=NONE
  hi Delimiter guifg=#bc6bd0 guibg=NONE

  " Function "
  hi Identifier guifg=#cd9ad9 guibg=NONE
  hi Function guifg=#e086e0 guibg=NONE

  " Statements "
  hi Statement guifg=#ff7ab2 guibg=NONE
  hi Conditional guifg=#6876de guibg=NONE
  hi Repeat guifg=#6876de guibg=NONE
  hi Label guifg=#bc6bd0 guibg=NONE
  hi Operator guifg=#6272a4 guibg=bold
  hi Exception guifg=#943d84 guibg=NONE
  hi Keyword guifg=#ff7ab2 guibg=NONE gui=bold
  
  " Constant "
  hi Constant guifg=#de286e guibg=NONE
  hi Character guifg=#eba4e9 guibg=NONE
  hi Float guifg=#f72d7c guibg=NONE
  hi Number guifg=#de286e guibg=NONE
  " hi String guifg=#bd93f9 guibg=NONE
  hi String guifg=#6050dc guibg=NONE
  hi StringDelimiter guifg=#bd93f9 guibg=NONE
  hi Boolean guifg=#6875ed guibg=NONE

  " PreProc "
  hi PreProc guifg=#849be0 guibg=NONE
  hi Define guifg=#6a5acd guibg=NONE
  hi Include guifg=#6a5acd guibg=NONE
  hi PreCondit guifg=#ab506e guibg=NONE
  hi Macro guifg=#6a5acd guibg=NONE

  " Types "
  hi Type guifg=#8677d9 guibg=NONE
  hi Typedef guifg=#8677d9 guibg=NONE
  hi StorageClass guifg=#c081fa guibg=NONE
  hi Structure guifg=#ff7ab2 guibg=NONE

  hi Title guifg=#8897F4 guibg=NONE gui=bold
  hi Todo guifg=#302b30 guibg=#eba4e9 guisp=#eba4e9
  hi Quote guifg=#6272a4 guibg=NONE

  hi Directory guifg=#ff7ab2 guibg=NONE
  hi Debug guifg=#bc6bd0 guibg=NONE
  hi NonText guifg=#E9729D guibg=NONE

  hi Underlined guifg=#458FAA guibg=NONE gui=underline
  hi SpellBad guifg=NONE guibg=NONE gui=undercurl
  hi SpellCap guifg=NONE guibg=NONE gui=undercurl
  hi SpellLocal guifg=NONE guibg=NONE gui=undercurl
  hi SpellRare guifg=NONE guibg=NONE gui=undercurl

  " Rust {{{
  hi! link rsForeignConst Constant
  hi! link rsForeignFunc Function
  hi! link rsForeignType Type
  hi! link rsForeignMacro Macro
  hi! link rsFuncDef Typedef
  hi! link rsIdentDef Identifier
  hi! link rsLibraryConst Constant
  hi! link rsLibraryFunc Function
  hi! link rsLibraryType Type
  hi! link rsLifetimeDef Typedef
  hi! link rsSpecialLifetime Special
  hi! link rsUserConst Constant
  hi! link rsUserFunc Function
  hi! link rsUserLifetime Typedef
  hi! link rsUserMethod Function
  hi! link rsUserType Type
  hi! link rsAttribute Macro
  hi! link rsLet Exception
  " }}}
  " Vim {{{
  hi! link vimAutoCmdSfxList LibraryType
  hi! link vimAutoEventList LocalIdent
  hi! link vimCmdSep Special
  hi! link vimCommentTitle SpecialComment
  hi! link vimContinue Delimiter
  hi! link vimFuncName LibraryFunc
  hi! link vimFunction FunctionDef
  hi! link vimHighlight Statement
  hi! link vimMapModKey vimNotation
  hi! link vimNotation LibraryType
  hi! link vimOption LibraryIdent
  hi! link vimUserFunc LocalFunc
  " }}}
  " Markdown {{{
  hi! link markdownBoldDelimiter markdownDelimiter
  hi! link markdownBoldItalicDelimiter markdownDelimiter
  hi! link markdownCodeBlock markdownCode
  hi! link markdownCodeDelimiter markdownDelimiter
  hi! link markdownHeadingDelimiter markdownDelimiter
  hi! link markdownItalicDelimiter markdownDelimiter
  hi! link markdownLinkDelimiter markdownDelimiter
  hi! link markdownLinkText None
  hi! link markdownLinkTextDelimiter markdownDelimiter
  hi! link markdownListMarker markdownDelimiter
  hi! link markdownRule markdownDelimiter
  hi! link markdownUrl Underlined
  hi markdownDelimiter guifg=#78c2b3 guibg=NONE gui=NONE cterm=NONE
  hi markdownCode guifg=#dabaff guibg=#393b44 gui=NONE cterm=NONE
  " }}}
  " Misc {{{
  hi! link Terminal Normal
  hi! link TabLine StatusLineNC
  hi! link TabLineFill StatusLineNC
  hi! link TabLineSel StatusLine
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi! link VisualNOS Visual
  hi! link MsgArea Title
  hi! link diffAdded DiffAdd
  hi! link diffBDiffer WarningMsg
  hi! link diffChanged DiffChange
  hi! link diffCommon WarningMsg
  hi! link diffDiffer WarningMsg
  hi! link diffFile Directory
  hi! link diffIdentical WarningMsg
  hi! link diffIndexLine Number
  hi! link diffIsA WarningMsg
  hi! link diffNoEOL WarningMsg
  hi! link diffOnly WarningMsg
  hi! link diffRemoved DiffDelete
  hi! link ALEVirtualTextError ErrorMsg
  hi! link ALEVirtualTextWarning WarningMsg
  hi! link Searchlight IncSearch
  " }}}
  " Signify {{{
  hi! link SignifySignAdd Signify
  hi! link SignifySignChange Signify
  hi! link SignifySignDelete Signify
  " }}}
  " Bib {{{
  hi! link bibEntryKw LibraryIdent
  hi! link bibKey IdentifierDef
  hi! link bibType LibraryType
  " }}}
  " CSS {{{
  hi! link cssAtRule Keyword
  hi! link cssAttr Keyword
  hi! link cssBraces cssNoise
  hi! link cssClassName LocalIdent
  hi! link cssColor cssAttr
  hi! link cssFunction None
  hi! link cssIdentifier LocalIdent
  hi! link cssProp LibraryType
  hi! link cssPseudoClassId LibraryIdent
  hi! link cssSelectorOp Operator
  " }}}
  " Git {{{
  hi! link gitcommitHeader Todo
  hi! link gitcommitOverflow Error
  hi! link gitcommitSummary Title
  " }}}
  " Go {{{
  hi! link goField LocalIdent
  hi! link goFunction FunctionDef
  hi! link goFunctionCall LibraryFunc
  hi! link goVarAssign LocalIdent
  hi! link goVarDefs IdentifierDef
  " }}}
  " Help command {{{
  hi! link helpCommand helpExample
  hi! link helpExample markdownCode
  hi! link helpHeadline Title
  hi! link helpHyperTextEntry Comment
  hi! link helpHyperTextJump Underlined
  hi! link helpSectionDelim Ignore
  hi! link helpURL helpHyperTextJump
  hi! link helpVim Title
  " }}}
  " HTML {{{
  hi! link htmlArg Special
  hi! link htmlEndTag Delimiter
  hi! link htmlLink Underlined
  hi! link htmlSpecialTagName htmlTagName
  hi! link htmlTag Delimiter
  hi! link htmlTagName Statement
  " }}}
  " Jinja {{{
  hi! link jinjaBlockName Typedef
  hi! link jinjaFilter LibraryFunc
  hi! link jinjaNumber Number
  hi! link jinjaOperator Operator
  hi! link jinjaRawDelim PreProc
  hi! link jinjaSpecial Keyword
  hi! link jinjaString String
  hi! link jinjaTagDelim Delimiter
  hi! link jinjaVarDelim Delimiter
  " }}}
  " JS {{{
  hi! link jsBuiltins LibraryFunc
  hi! link jsClassDefinition Typedef
  hi! link jsDomErrNo LibraryIdent
  hi! link jsDomNodeConsts LibraryIdent
  hi! link jsExceptions LibraryType
  hi! link jsFuncArgCommas jsNoise
  hi! link jsFuncName FunctionDef
  hi! link jsFunction jsStatement
  hi! link jsGlobalNodeObjects jsGlobalObjects
  hi! link jsGlobalObjects LibraryType
  hi! link jsObjectProp LocalIdent
  hi! link jsOperatorKeyword jsStatement
  hi! link jsThis jsStatement
  hi! link jsVariableDef IdentifierDef
  hi! link jsonKeyword jsonString
  hi! link jsonKeywordMatch Operator
  hi! link jsonQuote StringDelimiter
  " }}}
  " SCSS {{{
  hi! link scssAttribute cssNoise
  hi! link scssInclude Keyword
  hi! link scssMixin Keyword
  hi! link scssMixinName LocalFunc
  hi! link scssMixinParams cssNoise
  hi! link scssSelectorName cssClassName
  hi! link scssVariableAssignment Operator
  hi! link scssVariableValue Operator
  " }}}
  " Swift {{{
  hi! link swiftFuncDef FunctionDef
  hi! link swiftIdentDef IdentifierDef
  hi! link swiftLibraryFunc LibraryFunc
  hi! link swiftLibraryProp LibraryIdent
  hi! link swiftLibraryType LibraryType
  hi! link swiftUserFunc LocalFunc
  hi! link swiftUserProp LocalIdent
  hi! link swiftUserType LocalType
  " }}}
  " Typescript {{{
  hi! link typescriptArrayMethod LibraryFunc
  hi! link typescriptArrowFunc Operator
  hi! link typescriptAssign Operator
  hi! link typescriptBOM LibraryType
  hi! link typescriptBOMWindowCons LibraryType
  hi! link typescriptBOMWindowMethod LibraryFunc
  hi! link typescriptBOMWindowProp LibraryType
  hi! link typescriptBinaryOp Operator
  hi! link typescriptBraces Delimiter
  hi! link typescriptCall None
  hi! link typescriptClassHeritage Type
  hi! link typescriptClassName TypeDef
  hi! link typescriptDOMDocMethod LibraryFunc
  hi! link typescriptDOMDocProp LibraryIdent
  hi! link typescriptDOMEventCons LibraryType
  hi! link typescriptDOMEventMethod LibraryFunc
  hi! link typescriptDOMEventMethod LibraryFunc
  hi! link typescriptDOMEventProp LibraryIdent
  hi! link typescriptDOMEventTargetMethod LibraryFunc
  hi! link typescriptDOMNodeMethod LibraryFunc
  hi! link typescriptDOMStorageMethod LibraryIdent
  hi! link typescriptEndColons Delimiter
  hi! link typescriptExport Keyword
  hi! link typescriptFuncName FunctionDef
  hi! link typescriptFuncTypeArrow typescriptArrowFunc
  hi! link typescriptGlobal typescriptPredefinedType
  hi! link typescriptIdentifier Keyword
  hi! link typescriptInterfaceName Typedef
  hi! link typescriptMember LocalFunc
  hi! link typescriptObjectLabel LocalIdent
  hi! link typescriptOperator Keyword
  hi! link typescriptParens Delimiter
  hi! link typescriptPredefinedType LibraryType
  hi! link typescriptTypeAnnotation Delimiter
  hi! link typescriptTypeReference typescriptUserDefinedType
  hi! link typescriptUserDefinedType LocalType
  hi! link typescriptVariable Keyword
  hi! link typescriptVariableDeclaration IdentifierDef
  " }}}
  unlet s:t_Co
  finish
endif

" Non 256 {{{
" if s:t_Co >= 256
"   hi Normal ctermfg=254 ctermbg=none cterm=NONE
"   hi Cursor ctermfg=235 ctermbg=254 cterm=NONE
"   hi None ctermfg=254 ctermbg=NONE cterm=NONE
"   hi CursorLineNr ctermfg=254 ctermbg=236 cterm=NONE
"   hi EndOfBuffer ctermfg=235 ctermbg=235 cterm=NONE
"   hi FoldColumn ctermfg=59 ctermbg=NONE cterm=NONE
"   hi Folded ctermfg=59 ctermbg=237 cterm=NONE
"   hi LineNr ctermfg=59 ctermbg=NONE cterm=NONE
"   hi MatchWord ctermfg=254 ctermbg=26 cterm=NONE
"   hi SignColumn ctermfg=59 ctermbg=NONE cterm=NONE
"   hi Signify ctermfg=32 ctermbg=NONE cterm=NONE
"   hi Ignore ctermfg=59 ctermbg=NONE cterm=NONE
"   hi Pmenu ctermfg=254 ctermbg=237 cterm=NONE
"   hi PmenuSbar ctermfg=237 ctermbg=237 cterm=NONE
"   hi PmenuSel ctermfg=254 ctermbg=26 cterm=NONE
"   hi PmenuThumb ctermfg=238 ctermbg=238 cterm=NONE
"   hi ErrorMsg ctermfg=210 ctermbg=NONE cterm=NONE
"   hi ModeMsg ctermfg=245 ctermbg=NONE cterm=NONE
"   hi MoreMsg ctermfg=211 ctermbg=NONE cterm=NONE
"   hi Question ctermfg=211 ctermbg=NONE cterm=NONE
"   hi WarningMsg ctermfg=215 ctermbg=NONE cterm=NONE
"   hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE
"   hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE
"   hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE
"   hi QuickFixLine ctermfg=254 ctermbg=26 cterm=NONE
"   hi StatusLine ctermfg=254 ctermbg=238 cterm=NONE
"   hi StatusLineNC ctermfg=245 ctermbg=237 cterm=NONE
"   hi VertSplit ctermfg=237 ctermbg=237 cterm=NONE
"   hi WildMenu ctermfg=254 ctermbg=26 cterm=NONE
"   hi IncSearch ctermfg=235 ctermbg=226 cterm=NONE
"   hi Search ctermfg=254 ctermbg=238 cterm=NONE
"   hi Visual ctermfg=NONE ctermbg=238 cterm=NONE
"   hi DiffAdd ctermfg=159 ctermbg=236 cterm=NONE
"   hi DiffChange ctermfg=215 ctermbg=NONE cterm=NONE
"   hi DiffDelete ctermfg=210 ctermbg=236 cterm=NONE
"   hi DiffText ctermfg=215 ctermbg=236 cterm=NONE
"   hi Comment ctermfg=245 ctermbg=NONE cterm=NONE
"   hi Error ctermfg=235 ctermbg=210 cterm=NONE
"   hi PreProc ctermfg=215 ctermbg=NONE cterm=NONE
"   hi Special ctermfg=73 ctermbg=NONE cterm=NONE
"   hi Statement ctermfg=211 ctermbg=NONE cterm=bold
"   hi Character ctermfg=186 ctermbg=NONE cterm=NONE
"   hi Directory ctermfg=81 ctermbg=NONE cterm=NONE
"   hi Number ctermfg=186 ctermbg=NONE cterm=NONE
"   hi SpecialComment ctermfg=145 ctermbg=NONE cterm=NONE
"   hi String ctermfg=210 ctermbg=NONE cterm=NONE
"   hi Title ctermfg=254 ctermbg=NONE cterm=bold
"   hi Todo ctermfg=145 ctermbg=NONE cterm=bold
"   hi Underlined ctermfg=81 ctermbg=NONE cterm=underline
"   hi SpellBad ctermfg=NONE ctermbg=NONE cterm=undercurl
"   hi SpellCap ctermfg=NONE ctermbg=NONE cterm=undercurl
"   hi SpellLocal ctermfg=NONE ctermbg=NONE cterm=undercurl
"   hi SpellRare ctermfg=NONE ctermbg=NONE cterm=undercurl
"   let g:indentLine_color_gui  = '#53606e'
"   let g:indentLine_color_term = 59
"   let g:limelight_conceal_guifg = '#7f8c98'
"   let g:limelight_conceal_ctermfg = 245
"   hi! link Terminal Normal
"   hi! link TabLine StatusLineNC
"   hi! link TabLineFill StatusLineNC
"   hi! link TabLineSel StatusLine
"   hi! link StatusLineTerm StatusLine
"   hi! link StatusLineTermNC StatusLineNC
"   hi! link VisualNOS Visual
"   hi! link MsgArea Title
"   hi! link diffAdded DiffAdd
"   hi! link diffBDiffer WarningMsg
"   hi! link diffChanged DiffChange
"   hi! link diffCommon WarningMsg
"   hi! link diffDiffer WarningMsg
"   hi! link diffFile Directory
"   hi! link diffIdentical WarningMsg
"   hi! link diffIndexLine Number
"   hi! link diffIsA WarningMsg
"   hi! link diffNoEOL WarningMsg
"   hi! link diffOnly WarningMsg
"   hi! link diffRemoved DiffDelete
"   hi! link Constant LibraryIdent
"   hi! link Float Number
"   hi! link StringDelimiter String
"   hi! link Identifier LocalIdent
"   hi! link Function LibraryFunc
"   hi! link Boolean Statement
"   hi! link Conditional Statement
"   hi! link Exception Statement
"   hi! link Include Statement
"   hi! link Keyword Statement
"   hi! link Label Statement
"   hi! link Repeat Statement
"   hi! link StorageClass Statement
"   hi! link Structure Statement
"   hi! link Define PreProc
"   hi! link Macro PreProc
"   hi! link PreCondit PreProc
"   hi! link Type LibraryType
"   hi! link Debug Special
"   hi! link SpecialChar Special
"   hi! link Tag Special
"   hi! link Noise Delimiter
"   hi! link Quote StringDelimiter
"   hi! link Conceal Ignore
"   hi! link NonText Ignore
"   hi! link SpecialKey Ignore
"   hi! link Whitespace Ignore
"   hi! link ALEVirtualTextError ErrorMsg
"   hi! link ALEVirtualTextWarning WarningMsg
"   hi! link Searchlight IncSearch
"   hi! link SignifySignAdd Signify
"   hi! link SignifySignChange Signify
"   hi! link SignifySignDelete Signify
"   hi! link bibEntryKw LibraryIdent
"   hi! link bibKey IdentifierDef
"   hi! link bibType LibraryType
"   hi! link cssAtRule Keyword
"   hi! link cssAttr Keyword
"   hi! link cssBraces cssNoise
"   hi! link cssClassName LocalIdent
"   hi! link cssColor cssAttr
"   hi! link cssFunction None
"   hi! link cssIdentifier LocalIdent
"   hi! link cssProp LibraryType
"   hi! link cssPseudoClassId LibraryIdent
"   hi! link cssSelectorOp Operator
"   hi! link gitcommitHeader Todo
"   hi! link gitcommitOverflow Error
"   hi! link gitcommitSummary Title
"   hi! link goField LocalIdent
"   hi! link goFunction FunctionDef
"   hi! link goFunctionCall LibraryFunc
"   hi! link goVarAssign LocalIdent
"   hi! link goVarDefs IdentifierDef
"   hi! link helpCommand helpExample
"   hi! link helpExample markdownCode
"   hi! link helpHeadline Title
"   hi! link helpHyperTextEntry Comment
"   hi! link helpHyperTextJump Underlined
"   hi! link helpSectionDelim Ignore
"   hi! link helpURL helpHyperTextJump
"   hi! link helpVim Title
"   hi! link htmlArg Special
"   hi! link htmlEndTag Delimiter
"   hi! link htmlLink Underlined
"   hi! link htmlSpecialTagName htmlTagName
"   hi! link htmlTag Delimiter
"   hi! link htmlTagName Statement
"   hi! link jinjaBlockName Typedef
"   hi! link jinjaFilter LibraryFunc
"   hi! link jinjaNumber Number
"   hi! link jinjaOperator Operator
"   hi! link jinjaRawDelim PreProc
"   hi! link jinjaSpecial Keyword
"   hi! link jinjaString String
"   hi! link jinjaTagDelim Delimiter
"   hi! link jinjaVarDelim Delimiter
"   hi! link jsBuiltins LibraryFunc
"   hi! link jsClassDefinition Typedef
"   hi! link jsDomErrNo LibraryIdent
"   hi! link jsDomNodeConsts LibraryIdent
"   hi! link jsExceptions LibraryType
"   hi! link jsFuncArgCommas jsNoise
"   hi! link jsFuncName FunctionDef
"   hi! link jsFunction jsStatement
"   hi! link jsGlobalNodeObjects jsGlobalObjects
"   hi! link jsGlobalObjects LibraryType
"   hi! link jsObjectProp LocalIdent
"   hi! link jsOperatorKeyword jsStatement
"   hi! link jsThis jsStatement
"   hi! link jsVariableDef IdentifierDef
"   hi! link jsonKeyword jsonString
"   hi! link jsonKeywordMatch Operator
"   hi! link jsonQuote StringDelimiter
"   hi! link rsForeignConst LibraryIdent
"   hi! link rsForeignFunc LibraryFunc
"   hi! link rsForeignType LibraryType
"   hi! link rsFuncDef FunctionDef
"   hi! link rsIdentDef IdentifierDef
"   hi! link rsLibraryConst LibraryIdent
"   hi! link rsLibraryFunc LibraryFunc
"   hi! link rsLibraryType LibraryType
"   hi! link rsLifetimeDef IdentifierDef
"   hi! link rsSpecialLifetime LibraryIdent
"   hi! link rsUserConst LocalIdent
"   hi! link rsUserFunc LocalFunc
"   hi! link rsUserLifetime LocalIdent
"   hi! link rsUserMethod LibraryFunc
"   hi! link rsUserType LocalType
"   hi! link scssAttribute cssNoise
"   hi! link scssInclude Keyword
"   hi! link scssMixin Keyword
"   hi! link scssMixinName LocalFunc
"   hi! link scssMixinParams cssNoise
"   hi! link scssSelectorName cssClassName
"   hi! link scssVariableAssignment Operator
"   hi! link scssVariableValue Operator
"   hi! link swiftFuncDef FunctionDef
"   hi! link swiftIdentDef IdentifierDef
"   hi! link swiftLibraryFunc LibraryFunc
"   hi! link swiftLibraryProp LibraryIdent
"   hi! link swiftLibraryType LibraryType
"   hi! link swiftUserFunc LocalFunc
"   hi! link swiftUserProp LocalIdent
"   hi! link swiftUserType LocalType
"   hi! link typescriptArrayMethod LibraryFunc
"   hi! link typescriptArrowFunc Operator
"   hi! link typescriptAssign Operator
"   hi! link typescriptBOM LibraryType
"   hi! link typescriptBOMWindowCons LibraryType
"   hi! link typescriptBOMWindowMethod LibraryFunc
"   hi! link typescriptBOMWindowProp LibraryType
"   hi! link typescriptBinaryOp Operator
"   hi! link typescriptBraces Delimiter
"   hi! link typescriptCall None
"   hi! link typescriptClassHeritage Type
"   hi! link typescriptClassName TypeDef
"   hi! link typescriptDOMDocMethod LibraryFunc
"   hi! link typescriptDOMDocProp LibraryIdent
"   hi! link typescriptDOMEventCons LibraryType
"   hi! link typescriptDOMEventMethod LibraryFunc
"   hi! link typescriptDOMEventMethod LibraryFunc
"   hi! link typescriptDOMEventProp LibraryIdent
"   hi! link typescriptDOMEventTargetMethod LibraryFunc
"   hi! link typescriptDOMNodeMethod LibraryFunc
"   hi! link typescriptDOMStorageMethod LibraryIdent
"   hi! link typescriptEndColons Delimiter
"   hi! link typescriptExport Keyword
"   hi! link typescriptFuncName FunctionDef
"   hi! link typescriptFuncTypeArrow typescriptArrowFunc
"   hi! link typescriptGlobal typescriptPredefinedType
"   hi! link typescriptIdentifier Keyword
"   hi! link typescriptInterfaceName Typedef
"   hi! link typescriptMember LocalFunc
"   hi! link typescriptObjectLabel LocalIdent
"   hi! link typescriptOperator Keyword
"   hi! link typescriptParens Delimiter
"   hi! link typescriptPredefinedType LibraryType
"   hi! link typescriptTypeAnnotation Delimiter
"   hi! link typescriptTypeReference typescriptUserDefinedType
"   hi! link typescriptUserDefinedType LocalType
"   hi! link typescriptVariable Keyword
"   hi! link typescriptVariableDeclaration IdentifierDef
"   hi! link vimAutoCmdSfxList LibraryType
"   hi! link vimAutoEventList LocalIdent
"   hi! link vimCmdSep Special
"   hi! link vimCommentTitle SpecialComment
"   hi! link vimContinue Delimiter
"   hi! link vimFuncName LibraryFunc
"   hi! link vimFunction FunctionDef
"   hi! link vimHighlight Statement
"   hi! link vimMapModKey vimNotation
"   hi! link vimNotation LibraryType
"   hi! link vimOption LibraryIdent
"   hi! link vimUserFunc LocalFunc
"   hi! link markdownBoldDelimiter markdownDelimiter
"   hi! link markdownBoldItalicDelimiter markdownDelimiter
"   hi! link markdownCodeBlock markdownCode
"   hi! link markdownCodeDelimiter markdownDelimiter
"   hi! link markdownHeadingDelimiter markdownDelimiter
"   hi! link markdownItalicDelimiter markdownDelimiter
"   hi! link markdownLinkDelimiter markdownDelimiter
"   hi! link markdownLinkText None
"   hi! link markdownLinkTextDelimiter markdownDelimiter
"   hi! link markdownListMarker markdownDelimiter
"   hi! link markdownRule markdownDelimiter
"   hi! link markdownUrl Underlined
"   hi markdownDelimiter ctermfg=73 ctermbg=NONE cterm=NONE
"   hi markdownCode ctermfg=183 ctermbg=237 cterm=NONE
"   unlet s:t_Co
"   finish
" endif
" }}}

" Color: base0        #292a30 ~
" Color: base1        #2f3037 ~
" Color: base2        #393b44 ~
" Color: base3        #414453 ~
" Color: base4        #53606e ~
" Color: base5        #7f8c98 ~
" Color: base6        #a3b1bf ~
" Color: base7        #dfdfe0 ~
" Color: deep_blue0   #0f5bca ~
" Color: deep_blue1   #4484d1 ~
" Color: deep_yellow  #fef937 ~
" Color: green_wash   #243330 ~
" Color: orange_wash  #382e27 ~
" Color: red_wash     #3b2d2b ~
" Color: blue         #4eb0cc ~
" Color: light_blue   #6bdfff ~
" Color: orange       #ffa14f ~
" Color: pink         #ff7ab2 ~
" Color: red          #ff8170 ~
" Color: yellow       #d9c97c ~
" Color: purple       #b281eb ~
" Color: light_purple #dabaff ~
" Color: teal         #78c2b3 ~
" Color: light_teal   #acf2e4 ~
" Color: green        #84b360 ~
" Color: light_green  #b0e687 ~
" Background: dark
" Term colors: base3      red  teal         yellow
" Term colors: blue       pink purple       base7
" Term colors: base5      red  light_teal   orange
" Term colors: light_blue pink light_purple base7
" vim: et ts=2 sw=2
