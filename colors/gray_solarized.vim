" Name: Gray Solarized colorscheme
" Author: Ethan Schoonover <es@ethanschoonover.com>
"       (Original Solarized " Scheme)
"   Franz Greiling <dev.git@lc3dyr.de>
"       (Modifications for Gray Solarized Scheme)
" License: OSI approved MIT license (see end of this file)
" Created: While being sick
" Modified: 2014 June 28

" Environment Specific Overrides {{{
    " Terminals that support italics
    let s:terms_italic=[
                \"rxvt",
                \"gnome-terminal"
                \]
    " For reference only, terminals are known to be incomptible.
    " Terminals that are in neither list need to be tested.
    let s:terms_noitalic=[
                \"iTerm.app",
                \"Apple_Terminal"
                \]
    if has("gui_running")
        let s:terminal_italic=1 " TODO: could refactor to not require this at all
    else
        let s:terminal_italic=0 " terminals will be guilty until proven compatible
        for term in s:terms_italic
            if $TERM_PROGRAM =~ term
                let s:terminal_italic=1
            endif
        endfor
    endif
" }}}

" Colorscheme initialization {{{
    hi clear
    if exists("syntax_on")
        syntax reset
    endif

    set background=dark
    set linespace=3

    let colors_name = "gray_solarized"
" }}}

" Setting color palett {{{
    if has("gui_running")
        let s:vmode       = "gui"
        let s:base03      = "#1a1a1a" " #222222
        let s:base02      = "#262626" " #262626 #303030
        let s:base01      = "#5a5a5a" 
        let s:base00      = "#8d8d8d"
        let s:base0       = "#9b9b9b" " #909090#9b9b9b
        let s:base1       = "#bebebe" " #CBCBCB 
        let s:base2       = "#f7f7f7" " #d7d7af
        let s:base3       = "#f7f7f7" " #ffffd7
        let s:yellow      = "#b48831" " #b58900
        let s:orange      = "#c15242" " #cb4b16
        let s:red         = "#dd1836" " #dc322f
        let s:magenta     = "#d51f7f" " #d33682
        let s:violet      = "#c99cd2" " #6c71c4
        let s:blue        = "#3a8bca" " #268bd2
        let s:cyan        = "#40a296" " #2aa198
        let s:green       = "#8fb70f" " #859900
    elseif &t_Co >= 16
        let s:vmode       = "cterm"
        let s:base03      = "NONE"
        let s:base02      = "0"
        let s:base01      = "8"
        let s:base00      = "NONE"
        let s:base0       = "NONE"
        let s:base1       = "7"
        let s:base2       = "15"
        let s:base3       = "15"
        let s:yellow      = "3"
        let s:orange      = "9"
        let s:red         = "1"
        let s:magenta     = "5"
        let s:violet      = "13"
        let s:blue        = "4"
        let s:cyan        = "6"
        let s:green       = "2"
    else
        let s:vmode       = "cterm"
        let s:bright      = "* term=bold cterm=bold"
        let s:base03      = "NONE"
        let s:base02      = "0"
        let s:base01      = "0".s:bright
        let s:base00      = "NONE"
        let s:base0       = "NONE"
        let s:base1       = "7"
        let s:base2       = "7".s:bright
        let s:base3       = "7".s:bright
        let s:yellow      = "3"
        let s:orange      = "1".s:bright
        let s:red         = "1"
        let s:magenta     = "5"
        let s:violet      = "5".s:bright
        let s:blue        = "4"
        let s:cyan        = "6"
        let s:green       = "2"
    endif
" }}}

" Formatting options {{{
    let s:none            = "NONE"
    let s:none            = "NONE"
    let s:t_none          = "NONE"
    let s:n               = "NONE"
    let s:c               = ",undercurl"
    let s:r               = ",reverse"
    let s:s               = ",standout"
    let s:ou              = ""
    let s:ob              = ""
    let s:b               = ",bold"
    let s:bb              = ""
    let s:u               = ",underline"
    if s:terminal_italic == 0
        let s:i = ""
    else
        let s:i = ",italic"
    endif
" }}}

" Background value {{{
    if (has("gui_running"))
        let s:back        = s:base03
    else
        let s:back        = "NONE"
    endif
" }}}

" Highlighting primitives {{{
    exe "let s:bg_none      = ' ".s:vmode."bg=".s:none   ."'"
    exe "let s:bg_back      = ' ".s:vmode."bg=".s:back   ."'"
    exe "let s:bg_base03    = ' ".s:vmode."bg=".s:base03 ."'"
    exe "let s:bg_base02    = ' ".s:vmode."bg=".s:base02 ."'"
    exe "let s:bg_base01    = ' ".s:vmode."bg=".s:base01 ."'"
    exe "let s:bg_base00    = ' ".s:vmode."bg=".s:base00 ."'"
    exe "let s:bg_base0     = ' ".s:vmode."bg=".s:base0  ."'"
    exe "let s:bg_base1     = ' ".s:vmode."bg=".s:base1  ."'"
    exe "let s:bg_base2     = ' ".s:vmode."bg=".s:base2  ."'"
    exe "let s:bg_base3     = ' ".s:vmode."bg=".s:base3  ."'"
    exe "let s:bg_green     = ' ".s:vmode."bg=".s:green  ."'"
    exe "let s:bg_yellow    = ' ".s:vmode."bg=".s:yellow ."'"
    exe "let s:bg_orange    = ' ".s:vmode."bg=".s:orange ."'"
    exe "let s:bg_red       = ' ".s:vmode."bg=".s:red    ."'"
    exe "let s:bg_magenta   = ' ".s:vmode."bg=".s:magenta."'"
    exe "let s:bg_violet    = ' ".s:vmode."bg=".s:violet ."'"
    exe "let s:bg_blue      = ' ".s:vmode."bg=".s:blue   ."'"
    exe "let s:bg_cyan      = ' ".s:vmode."bg=".s:cyan   ."'"

    exe "let s:fg_none      = ' ".s:vmode."fg=".s:none   ."'"
    exe "let s:fg_back      = ' ".s:vmode."fg=".s:back   ."'"
    exe "let s:fg_base03    = ' ".s:vmode."fg=".s:base03 ."'"
    exe "let s:fg_base02    = ' ".s:vmode."fg=".s:base02 ."'"
    exe "let s:fg_base01    = ' ".s:vmode."fg=".s:base01 ."'"
    exe "let s:fg_base00    = ' ".s:vmode."fg=".s:base00 ."'"
    exe "let s:fg_base0     = ' ".s:vmode."fg=".s:base0  ."'"
    exe "let s:fg_base1     = ' ".s:vmode."fg=".s:base1  ."'"
    exe "let s:fg_base2     = ' ".s:vmode."fg=".s:base2  ."'"
    exe "let s:fg_base3     = ' ".s:vmode."fg=".s:base3  ."'"
    exe "let s:fg_green     = ' ".s:vmode."fg=".s:green  ."'"
    exe "let s:fg_yellow    = ' ".s:vmode."fg=".s:yellow ."'"
    exe "let s:fg_orange    = ' ".s:vmode."fg=".s:orange ."'"
    exe "let s:fg_red       = ' ".s:vmode."fg=".s:red    ."'"
    exe "let s:fg_magenta   = ' ".s:vmode."fg=".s:magenta."'"
    exe "let s:fg_violet    = ' ".s:vmode."fg=".s:violet ."'"
    exe "let s:fg_blue      = ' ".s:vmode."fg=".s:blue   ."'"
    exe "let s:fg_cyan      = ' ".s:vmode."fg=".s:cyan   ."'"

    exe "let s:fmt_none     = ' ".s:vmode."=NONE".          " term=NONE".    "'"
    exe "let s:fmt_bold     = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b."'"
    exe "let s:fmt_bldi     = ' ".s:vmode."=NONE".s:b.s:i.  " term=NONE".s:b.s:i."'"
    exe "let s:fmt_undr     = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u."'"
    exe "let s:fmt_undb     = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
    exe "let s:fmt_undi     = ' ".s:vmode."=NONE".s:u.s:i.  " term=NONE".s:u.s:i."'"
    exe "let s:fmt_uopt     = ' ".s:vmode."=NONE".s:ou.     " term=NONE".s:ou."'"
    exe "let s:fmt_curl     = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c."'"
    exe "let s:fmt_ital     = ' ".s:vmode."=NONE".s:i.      " term=NONE".s:i."'"
    exe "let s:fmt_stnd     = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s."'"
    exe "let s:fmt_revr     = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r."'"
    exe "let s:fmt_revb     = ' ".s:vmode."=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"
    " revbb (reverse bold for bright colors) is only set to actual bold in low 
    " color terminals (t_co=8, such as OS X Terminal.app) and should only be used 
    " with colors 8-15.
    exe "let s:fmt_revbb    = ' ".s:vmode."=NONE".s:r.s:bb.   " term=NONE".s:r.s:bb."'"
    exe "let s:fmt_revbbu   = ' ".s:vmode."=NONE".s:r.s:bb.s:u." term=NONE".s:r.s:bb.s:u."'"

    if has("gui_running")
        exe "let s:sp_none      = ' guisp=".s:none   ."'"
        exe "let s:sp_back      = ' guisp=".s:back   ."'"
        exe "let s:sp_base03    = ' guisp=".s:base03 ."'"
        exe "let s:sp_base02    = ' guisp=".s:base02 ."'"
        exe "let s:sp_base01    = ' guisp=".s:base01 ."'"
        exe "let s:sp_base00    = ' guisp=".s:base00 ."'"
        exe "let s:sp_base0     = ' guisp=".s:base0  ."'"
        exe "let s:sp_base1     = ' guisp=".s:base1  ."'"
        exe "let s:sp_base2     = ' guisp=".s:base2  ."'"
        exe "let s:sp_base3     = ' guisp=".s:base3  ."'"
        exe "let s:sp_green     = ' guisp=".s:green  ."'"
        exe "let s:sp_yellow    = ' guisp=".s:yellow ."'"
        exe "let s:sp_orange    = ' guisp=".s:orange ."'"
        exe "let s:sp_red       = ' guisp=".s:red    ."'"
        exe "let s:sp_magenta   = ' guisp=".s:magenta."'"
        exe "let s:sp_violet    = ' guisp=".s:violet ."'"
        exe "let s:sp_blue      = ' guisp=".s:blue   ."'"
        exe "let s:sp_cyan      = ' guisp=".s:cyan   ."'"
    else
        let s:sp_none      = ""
        let s:sp_back      = ""
        let s:sp_base03    = ""
        let s:sp_base02    = ""
        let s:sp_base01    = ""
        let s:sp_base00    = ""
        let s:sp_base0     = ""
        let s:sp_base1     = ""
        let s:sp_base2     = ""
        let s:sp_base3     = ""
        let s:sp_green     = ""
        let s:sp_yellow    = ""
        let s:sp_orange    = ""
        let s:sp_red       = ""
        let s:sp_magenta   = ""
        let s:sp_violet    = ""
        let s:sp_blue      = ""
        let s:sp_cyan      = ""
    endif
" }}}

" Basic highlighting"{{{
" ---------------------------------------------------------------------
" note that link syntax to avoid duplicate configuration doesn't work with the
" exe compiled formats

exe "hi! Normal"         .s:fmt_none   .s:fg_base0  .s:bg_back

exe "hi! Comment"        .s:fmt_ital   .s:fg_base01 .s:bg_none
"       *Comment         any comment

exe "hi! Constant"       .s:fmt_none   .s:fg_cyan   .s:bg_none
"       *Constant        any constant
"        String          a string constant: "this is a string"
"        Character       a character constant: 'c', '\n'
"        Number          a number constant: 234, 0xff
"        Boolean         a boolean constant: TRUE, false
"        Float           a floating point constant: 2.3e10

exe "hi! Identifier"     .s:fmt_none   .s:fg_blue   .s:bg_none
"       *Identifier      any variable name
"        Function        function name (also: methods for classes)
"
exe "hi! Statement"      .s:fmt_none   .s:fg_green  .s:bg_none
"       *Statement       any statement
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw

exe "hi! PreProc"        .s:fmt_none   .s:fg_orange .s:bg_none
"       *PreProc         generic Preprocessor
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.

exe "hi! Type"           .s:fmt_none   .s:fg_yellow .s:bg_none
"       *Type            int, long, char, etc.
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef

exe "hi! Special"        .s:fmt_none   .s:fg_red    .s:bg_none
"       *Special         any special symbol
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        SpecialComment  special things inside a comment
"        Debug           debugging statements

exe "hi! Underlined"     .s:fmt_none   .s:fg_violet .s:bg_none
"       *Underlined      text that stands out, HTML links

exe "hi! Ignore"         .s:fmt_none   .s:fg_none   .s:bg_none
"       *Ignore          left blank, hidden  |hl-Ignore|

exe "hi! Error"          .s:fmt_bold   .s:fg_red    .s:bg_none
"       *Error           any erroneous construct

exe "hi! Todo"           .s:fmt_none   .s:fg_magenta.s:bg_none
"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX
"
"}}}
" Extended highlighting "{{{
" ---------------------------------------------------------------------

exe "hi! SpecialKey"     .s:fmt_bold   .s:fg_base00 .s:bg_none
exe "hi! NonText"        .s:fmt_bold   .s:fg_base01 .s:bg_none
exe "hi! StatusLine"     .s:fmt_none   .s:fg_base1  .s:bg_base02 .s:fmt_revbb
exe "hi! StatusLineNC"   .s:fmt_none   .s:fg_base00 .s:bg_base02 .s:fmt_revbb
exe "hi! Visual"         .s:fmt_none   .s:fg_base01 .s:bg_base03 .s:fmt_revbb
exe "hi! Directory"      .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ErrorMsg"       .s:fmt_revr   .s:fg_red    .s:bg_none
exe "hi! IncSearch"      .s:fmt_stnd   .s:fg_orange .s:bg_none
exe "hi! Search"         .s:fmt_revr   .s:fg_yellow .s:bg_none
exe "hi! MoreMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ModeMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! LineNr"         .s:fmt_none   .s:fg_base01 .s:bg_none
exe "hi! CursorLineNr"   .s:fmt_bold   .s:fg_base0  .s:bg_base02
exe "hi! Question"       .s:fmt_bold   .s:fg_cyan   .s:bg_none
if ( has("gui_running") || &t_Co > 8 )
    exe "hi! VertSplit"  .s:fmt_none   .s:fg_base00 .s:bg_base00
else
    exe "hi! VertSplit"  .s:fmt_revbb  .s:fg_base00 .s:bg_base02
endif
exe "hi! Title"          .s:fmt_bold   .s:fg_orange .s:bg_none
exe "hi! VisualNOS"      .s:fmt_stnd   .s:fg_none   .s:bg_base02 .s:fmt_revbb
exe "hi! WarningMsg"     .s:fmt_bold   .s:fg_red    .s:bg_none
exe "hi! WildMenu"       .s:fmt_none   .s:fg_base2  .s:bg_base02 .s:fmt_revbb
exe "hi! Folded"         .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:sp_base03
exe "hi! FoldColumn"     .s:fmt_none   .s:fg_base0  .s:bg_base02

if has("gui_running")
exe "hi! DiffAdd"        .s:fmt_bold   .s:fg_green  .s:bg_base02 .s:sp_green
exe "hi! DiffChange"     .s:fmt_bold   .s:fg_yellow .s:bg_base02 .s:sp_yellow
exe "hi! DiffDelete"     .s:fmt_bold   .s:fg_red    .s:bg_base02
exe "hi! DiffText"       .s:fmt_bold   .s:fg_blue   .s:bg_base02 .s:sp_blue
else
exe "hi! DiffAdd"        .s:fmt_none   .s:fg_green  .s:bg_base02 .s:sp_green
exe "hi! DiffChange"     .s:fmt_none   .s:fg_yellow .s:bg_base02 .s:sp_yellow
exe "hi! DiffDelete"     .s:fmt_none   .s:fg_red    .s:bg_base02
exe "hi! DiffText"       .s:fmt_none   .s:fg_blue   .s:bg_base02 .s:sp_blue
endif
hi! link SignColumn LineNr
exe "hi! ShowMarksHLl"   .s:fmt_none   .s:fg_base0  .s:bg_none
exe "hi! ShowMarksHLu"   .s:fmt_none   .s:fg_base0  .s:bg_none
exe "hi! ShowMarksHLo"   .s:fmt_none   .s:fg_base0  .s:bg_none
exe "hi! ShowMarksHLm"   .s:fmt_none   .s:fg_base0  .s:bg_none
exe "hi! SignifySignAdd" .s:fmt_none   .s:fg_green  .s:bg_none
exe "hi! SignifySignChange" .s:fmt_none   .s:fg_yellow  .s:bg_none
exe "hi! SignifySignDelete" .s:fmt_none   .s:fg_red  .s:bg_none
hi! link SignifyLineAdd SignifySignAdd
hi! link SignifyLineChange SignifySignChange
hi! link SignifyLineDelete SignifySignDelete
exe "hi! Conceal"        .s:fmt_none   .s:fg_blue   .s:bg_none
if has('gui_running')
    exe "hi! SpellBad"   .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_red
    exe "hi! SpellCap"   .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_violet
    exe "hi! SpellRare"  .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
    exe "hi! SpellLocal" .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_yellow
else
    exe "hi! SpellBad"   .s:fmt_curl   .s:fg_none   .s:bg_orange  .s:sp_red
    exe "hi! SpellCap"   .s:fmt_curl   .s:fg_none   .s:bg_violet  .s:sp_violet
    exe "hi! SpellRare"  .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
    exe "hi! SpellLocal" .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_yellow
endif
exe "hi! Pmenu"          .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:fmt_revbb
exe "hi! PmenuSel"       .s:fmt_none   .s:fg_base01 .s:bg_base2   .s:fmt_revbb
exe "hi! PmenuSbar"      .s:fmt_none   .s:fg_base2  .s:bg_base0   .s:fmt_revbb
exe "hi! PmenuThumb"     .s:fmt_none   .s:fg_base0  .s:bg_base03  .s:fmt_revbb
exe "hi! TabLine"        .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:sp_base0
exe "hi! TabLineFill"    .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:sp_base0
exe "hi! TabLineSel"     .s:fmt_none   .s:fg_base01 .s:bg_base2   .s:sp_base0  .s:fmt_revbb
exe "hi! CursorColumn"   .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! CursorLine"     .s:fmt_uopt   .s:fg_none   .s:bg_base02  .s:sp_base1
exe "hi! ColorColumn"    .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! Cursor"         .s:fmt_none   .s:fg_base03 .s:bg_base0
hi! link lCursor Cursor
exe "hi! MatchParen"     .s:fmt_none   .s:fg_base03 .s:bg_base01

"}}}
" vim syntax highlighting "{{{
" ---------------------------------------------------------------------
"exe "hi! vimLineComment" . s:fg_base01 .s:bg_none   .s:fmt_ital
"hi! link vimComment Comment
"hi! link vimLineComment Comment
hi! link vimVar Identifier
hi! link vimFunc Function
hi! link vimUserFunc Function
hi! link helpSpecial Special
hi! link vimSet Normal
hi! link vimSetEqual Normal
exe "hi! vimCommentString"  .s:fmt_none    .s:fg_magenta .s:bg_none
exe "hi! vimCommand"        .s:fmt_none    .s:fg_green .s:bg_none
exe "hi! vimCmdSep"         .s:fmt_bold    .s:fg_blue   .s:bg_none
exe "hi! helpExample"       .s:fmt_none    .s:fg_base1  .s:bg_none
exe "hi! helpOption"        .s:fmt_none    .s:fg_cyan   .s:bg_none
exe "hi! helpNote"          .s:fmt_none    .s:fg_magenta.s:bg_none
exe "hi! helpVim"           .s:fmt_none    .s:fg_magenta.s:bg_none
exe "hi! helpHyperTextJump" .s:fmt_undr    .s:fg_blue   .s:bg_none
exe "hi! helpHyperTextEntry".s:fmt_none    .s:fg_green  .s:bg_none
exe "hi! vimIsCommand"      .s:fmt_none    .s:fg_base00 .s:bg_none
exe "hi! vimSynMtchOpt"     .s:fmt_none    .s:fg_yellow .s:bg_none
exe "hi! vimSynType"        .s:fmt_none    .s:fg_cyan   .s:bg_none
exe "hi! vimHiLink"         .s:fmt_none    .s:fg_blue   .s:bg_none
exe "hi! vimHiGroup"        .s:fmt_none    .s:fg_blue   .s:bg_none
exe "hi! vimGroup"          .s:fmt_undb    .s:fg_blue   .s:bg_none
"}}}
" diff highlighting "{{{
" ---------------------------------------------------------------------
hi! link diffAdded Statement
hi! link diffLine Identifier
"}}}
" git & gitcommit highlighting "{{{
"git
"exe "hi! gitDateHeader"
"exe "hi! gitIdentityHeader"
"exe "hi! gitIdentityKeyword"
"exe "hi! gitNotesHeader"
"exe "hi! gitReflogHeader"
"exe "hi! gitKeyword"
"exe "hi! gitIdentity"
"exe "hi! gitEmailDelimiter"
"exe "hi! gitEmail"
"exe "hi! gitDate"
"exe "hi! gitMode"
"exe "hi! gitHashAbbrev"
"exe "hi! gitHash"
"exe "hi! gitReflogMiddle"
"exe "hi! gitReference"
"exe "hi! gitStage"
"exe "hi! gitType"
"exe "hi! gitDiffAdded"
"exe "hi! gitDiffRemoved"
"gitcommit
"exe "hi! gitcommitSummary"      
exe "hi! gitcommitComment"      .s:fmt_ital     .s:fg_base01    .s:bg_none
hi! link gitcommitUntracked gitcommitComment
hi! link gitcommitDiscarded gitcommitComment
hi! link gitcommitSelected  gitcommitComment
exe "hi! gitcommitUnmerged"     .s:fmt_bold     .s:fg_green     .s:bg_none
exe "hi! gitcommitOnBranch"     .s:fmt_bold     .s:fg_base01    .s:bg_none
exe "hi! gitcommitBranch"       .s:fmt_bold     .s:fg_magenta   .s:bg_none
hi! link gitcommitNoBranch gitcommitBranch
exe "hi! gitcommitDiscardedType".s:fmt_none     .s:fg_red       .s:bg_none
exe "hi! gitcommitSelectedType" .s:fmt_none     .s:fg_green     .s:bg_none
"exe "hi! gitcommitUnmergedType"
"exe "hi! gitcommitType"
"exe "hi! gitcommitNoChanges"
"exe "hi! gitcommitHeader"
exe "hi! gitcommitHeader"       .s:fmt_none     .s:fg_base01    .s:bg_none
exe "hi! gitcommitUntrackedFile".s:fmt_bold     .s:fg_cyan      .s:bg_none
exe "hi! gitcommitDiscardedFile".s:fmt_bold     .s:fg_red       .s:bg_none
exe "hi! gitcommitSelectedFile" .s:fmt_bold     .s:fg_green     .s:bg_none
exe "hi! gitcommitUnmergedFile" .s:fmt_bold     .s:fg_yellow    .s:bg_none
exe "hi! gitcommitFile"         .s:fmt_bold     .s:fg_base0     .s:bg_none
hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
hi! link gitcommitSelectedArrow  gitcommitSelectedFile
hi! link gitcommitUnmergedArrow  gitcommitUnmergedFile
"exe "hi! gitcommitArrow"
"exe "hi! gitcommitOverflow"
"exe "hi! gitcommitBlank"
" }}}
" vim-gitgutter highlighting {{{
exe "hi! lineAdded"         .s:fmt_bold .s:fg_green  .s:bg_base02
exe "hi! lineModified"      .s:fmt_bold .s:fg_yellow .s:bg_base02
exe "hi! lineRemoved"       .s:fmt_bold .s:fg_red    .s:bg_base02
" }}}
" html highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! htmlTag"           .s:fmt_none .s:fg_base01 .s:bg_none
exe "hi! htmlEndTag"        .s:fmt_none .s:fg_base01 .s:bg_none
exe "hi! htmlTagN"          .s:fmt_bold .s:fg_base1  .s:bg_none
exe "hi! htmlTagName"       .s:fmt_bold .s:fg_blue   .s:bg_none
exe "hi! htmlSpecialTagName".s:fmt_ital .s:fg_blue   .s:bg_none
exe "hi! htmlArg"           .s:fmt_none .s:fg_base00 .s:bg_none
exe "hi! javaScript"        .s:fmt_none .s:fg_yellow .s:bg_none
"}}}
" perl highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! perlHereDoc"    . s:fg_base1  .s:bg_back   .s:fmt_none
exe "hi! perlVarPlain"   . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! perlStatementFileDesc". s:fg_cyan.s:bg_back.s:fmt_none

"}}}
" tex highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! texStatement"   . s:fg_cyan   .s:bg_back   .s:fmt_none
exe "hi! texMathZoneX"   . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! texMathMatcher" . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! texMathMatcher" . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! texRefLabel"    . s:fg_yellow .s:bg_back   .s:fmt_none
"}}}
" ruby highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! rubyDefine"     . s:fg_base1  .s:bg_back   .s:fmt_bold
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"hi! link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

"hi! link rubyClass             Keyword
"hi! link rubyModule            Keyword
"hi! link rubyKeyword           Keyword
"hi! link rubyOperator          Operator
"hi! link rubyIdentifier        Identifier
"hi! link rubyInstanceVariable  Identifier
"hi! link rubyGlobalVariable    Identifier
"hi! link rubyClassVariable     Identifier
"hi! link rubyConstant          Type
"}}}
" haskell syntax highlighting"{{{
" ---------------------------------------------------------------------
" For use with syntax/haskell.vim : Haskell Syntax File
" http://www.vim.org/scripts/script.php?script_id=3034
" See also Steffen Siering's github repository:
" http://github.com/urso/dotrc/blob/master/vim/syntax/haskell.vim
" ---------------------------------------------------------------------
"
" Treat True and False specially, see the plugin referenced above
let hs_highlight_boolean=1
" highlight delims, see the plugin referenced above
let hs_highlight_delimiters=1

exe "hi! cPreCondit". s:fg_orange.s:bg_none   .s:fmt_none

exe "hi! VarId"    . s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! ConId"    . s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! hsImport" . s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! hsString" . s:fg_base00 .s:bg_none   .s:fmt_none

exe "hi! hsStructure"        . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hs_hlFunctionName"  . s:fg_blue   .s:bg_none
exe "hi! hsStatement"        . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsImportLabel"      . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hs_OpFunctionName"  . s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! hs_DeclareFunction" . s:fg_orange .s:bg_none   .s:fmt_none
exe "hi! hsVarSym"           . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsType"             . s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! hsTypedef"          . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsModuleName"       . s:fg_green  .s:bg_none   .s:fmt_undr
exe "hi! hsModuleStartLabel" . s:fg_magenta.s:bg_none   .s:fmt_none
hi! link hsImportParams      Delimiter
hi! link hsDelimTypeExport   Delimiter
hi! link hsModuleStartLabel  hsStructure
hi! link hsModuleWhereLabel  hsModuleStartLabel

" following is for the haskell-conceal plugin
" the first two items don't have an impact, but better safe
exe "hi! hsNiceOperator"     . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsniceoperator"     . s:fg_cyan   .s:bg_none   .s:fmt_none

"}}}
" markdown syntax highlighting "{{{
" ---------------------------------------------------------------------
" exe "hi! markdownHeadingRule"           .
exe "hi! markdownHeadingDelimiter"      .s:fg_base01    .s:bg_none      .s:fmt_bold
exe "hi! markdownOrderedListMarker"     .s:fg_green     .s:bg_none      .s:fmt_none
exe "hi! markdownListMarker"            .s:fg_green     .s:bg_none      .s:fmt_none
exe "hi! markdownItemDelimiter"         .s:fg_green     .s:bg_none      .s:fmt_none
exe "hi! markdownItalic"                .s:fg_base1     .s:bg_none      .s:fmt_ital
exe "hi! markdownBold"                  .s:fg_none      .s:bg_none      .s:fmt_bold
exe "hi! markdownH1"                    .s:fg_base2     .s:bg_none      .s:fmt_bold
exe "hi! markdownH2"                    .s:fg_base2     .s:bg_none      .s:fmt_none
exe "hi! markdownH3"                    .s:fg_base2     .s:bg_none      .s:fmt_none
exe "hi! markdownH4"                    .s:fg_base2     .s:bg_none      .s:fmt_none
exe "hi! markdownH5"                    .s:fg_base2     .s:bg_none      .s:fmt_none
exe "hi! markdownH6"                    .s:fg_base2     .s:bg_none      .s:fmt_none
exe "hi! markdownBlockquoteDelimiter"   .s:fg_cyan      .s:bg_none      .s:fmt_none
exe "hi! markdownBlockquote"            .s:fg_base1      .s:bg_none      .s:fmt_ital
exe "hi! markdownCodeDelimiter"         .s:fg_orange    .s:bg_none      .s:fmt_none
exe "hi! markdownCode"                  .s:fg_blue      .s:bg_none      .s:fmt_none
exe "hi! markdownCodeBlock"             .s:fg_cyan      .s:bg_none      .s:fmt_none
" exe "hi! markdownFencedCodeBlock"       .s:fg_cyan      .s:bg_none      .s:fmt_none
exe "hi! markdownFencedCodeBlock"       .s:fg_base0      .s:bg_none      .s:fmt_none
exe "hi! markdownLinkDelimiter"         .s:fg_base01    .s:bg_none      .s:fmt_none
exe "hi! markdownLinkTextDelimiter"     .s:fg_base01    .s:bg_none      .s:fmt_none
exe "hi! markdownLinkTextContainer"     .s:fg_base01    .s:bg_none      .s:fmt_none
exe "hi! markdownLinkUrlContainer"      .s:fg_base01    .s:bg_none      .s:fmt_none
exe "hi! markdownURL"                   .s:fg_cyan      .s:bg_none      .s:fmt_ital
exe "hi! markdownLinkURL"               .s:fg_base01    .s:bg_none      .s:fmt_ital
exe "hi! markdownUrlLinkInText"         .s:fg_blue      .s:bg_none      .s:fmt_undr
exe "hi! markdownLinkText"              .s:fg_blue      .s:bg_none      .s:fmt_none
exe "hi! markdownLinkReference"         .s:fg_blue      .s:bg_none      .s:fmt_none
" }}}
" pandoc markdown syntax highlighting "{{{
" ---------------------------------------------------------------------

"PandocHiLink pandocNormalBlock
exe "hi! pandocTitleBlock"               .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocTitleBlockTitle"          .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocTitleComment"             .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocComment"                  .s:fg_base01 .s:bg_none   .s:fmt_ital
exe "hi! pandocVerbatimBlock"            .s:fg_yellow .s:bg_none   .s:fmt_none
hi! link pandocVerbatimBlockDeep         pandocVerbatimBlock
hi! link pandocCodeBlock                 pandocVerbatimBlock
hi! link pandocCodeBlockDelim            pandocVerbatimBlock
exe "hi! pandocBlockQuote"               .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader1"        .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader2"        .s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader3"        .s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader4"        .s:fg_red    .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader5"        .s:fg_base0  .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader6"        .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocListMarker"               .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocListReference"            .s:fg_magenta.s:bg_none   .s:fmt_undr

" Definitions
" ---------------------------------------------------------------------
let s:fg_pdef = s:fg_violet
exe "hi! pandocDefinitionBlock"              .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocDefinitionTerm"               .s:fg_pdef  .s:bg_none  .s:fmt_stnd
exe "hi! pandocDefinitionIndctr"             .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe "hi! pandocEmphasisDefinition"           .s:fg_pdef  .s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNestedDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNestedDefinition"   .s:fg_pdef.s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisDefinition" .s:fg_pdef.s:bg_none.s:fmt_bldi
exe "hi! pandocStrikeoutDefinition"          .s:fg_pdef  .s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInlineDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocSuperscriptDefinition"        .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocSubscriptDefinition"          .s:fg_pdef  .s:bg_none  .s:fmt_none

" Tables
" ---------------------------------------------------------------------
let s:fg_ptable = s:fg_blue
exe "hi! pandocTable"                        .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocTableStructure"               .s:fg_ptable.s:bg_none  .s:fmt_none
hi! link pandocTableStructureTop             pandocTableStructre
hi! link pandocTableStructureEnd             pandocTableStructre
exe "hi! pandocTableZebraLight"              .s:fg_ptable.s:bg_base03.s:fmt_none
exe "hi! pandocTableZebraDark"               .s:fg_ptable.s:bg_base02.s:fmt_none
exe "hi! pandocEmphasisTable"                .s:fg_ptable.s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNestedTable"          .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisTable"          .s:fg_ptable.s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNestedTable"    .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisTable"  .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrikeoutTable"               .s:fg_ptable.s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInlineTable"          .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocSuperscriptTable"             .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocSubscriptTable"               .s:fg_ptable.s:bg_none  .s:fmt_none

" Headings
" ---------------------------------------------------------------------
let s:fg_phead = s:fg_orange
exe "hi! pandocHeading"                      .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocHeadingMarker"                .s:fg_yellow.s:bg_none.s:fmt_bold
exe "hi! pandocEmphasisHeading"              .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocEmphasisNestedHeading"        .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisHeading"        .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocStrongEmphasisNestedHeading"  .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisHeading".s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrikeoutHeading"             .s:fg_phead .s:bg_none.s:fmt_revr
exe "hi! pandocVerbatimInlineHeading"        .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocSuperscriptHeading"           .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocSubscriptHeading"             .s:fg_phead .s:bg_none.s:fmt_bold

" Links
" ---------------------------------------------------------------------
exe "hi! pandocLinkDelim"                .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocLinkLabel"                .s:fg_blue   .s:bg_none   .s:fmt_undr
exe "hi! pandocLinkText"                 .s:fg_blue   .s:bg_none   .s:fmt_undb
exe "hi! pandocLinkURL"                  .s:fg_base00 .s:bg_none   .s:fmt_undr
exe "hi! pandocLinkTitle"                .s:fg_base00 .s:bg_none   .s:fmt_undi
exe "hi! pandocLinkTitleDelim"           .s:fg_base01 .s:bg_none   .s:fmt_undi   .s:sp_base00
exe "hi! pandocLinkDefinition"           .s:fg_cyan   .s:bg_none   .s:fmt_undr   .s:sp_base00
exe "hi! pandocLinkDefinitionID"         .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocImageCaption"             .s:fg_violet .s:bg_none   .s:fmt_undb
exe "hi! pandocFootnoteLink"             .s:fg_green  .s:bg_none   .s:fmt_undr
exe "hi! pandocFootnoteDefLink"          .s:fg_green  .s:bg_none   .s:fmt_bold
exe "hi! pandocFootnoteInline"           .s:fg_green  .s:bg_none   .s:fmt_undb
exe "hi! pandocFootnote"                 .s:fg_green  .s:bg_none   .s:fmt_none
exe "hi! pandocCitationDelim"            .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocCitation"                 .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocCitationID"               .s:fg_magenta.s:bg_none   .s:fmt_undr
exe "hi! pandocCitationRef"              .s:fg_magenta.s:bg_none   .s:fmt_none

" Main Styles
" ---------------------------------------------------------------------
exe "hi! pandocStyleDelim"               .s:fg_base01 .s:bg_none  .s:fmt_none
exe "hi! pandocEmphasis"                 .s:fg_base0  .s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNested"           .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasis"           .s:fg_base0  .s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNested"     .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasis"   .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrikeout"                .s:fg_base01 .s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInline"           .s:fg_yellow .s:bg_none  .s:fmt_none
exe "hi! pandocSuperscript"              .s:fg_violet .s:bg_none  .s:fmt_none
exe "hi! pandocSubscript"                .s:fg_violet .s:bg_none  .s:fmt_none

exe "hi! pandocRule"                     .s:fg_blue   .s:bg_none  .s:fmt_bold
exe "hi! pandocRuleLine"                 .s:fg_blue   .s:bg_none  .s:fmt_bold
exe "hi! pandocEscapePair"               .s:fg_red    .s:bg_none  .s:fmt_bold
exe "hi! pandocCitationRef"              .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocNonBreakingSpace"         . s:fg_red   .s:bg_none  .s:fmt_revr
hi! link pandocEscapedCharacter          pandocEscapePair
hi! link pandocLineBreak                 pandocEscapePair

" Embedded Code
" ---------------------------------------------------------------------
exe "hi! pandocMetadataDelim"            .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocMetadata"                 .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocMetadataKey"              .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocMetadata"                 .s:fg_blue   .s:bg_none   .s:fmt_bold
hi! link pandocMetadataTitle             pandocMetadata

"}}}
" javascript highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! jsStorageClass" .s:fg_green s:bg_none .s:fmt_none
"}}}
" syntastic syntax highlighting "{{{
" ---------------------------------------------------------------------
" https://github.com/airblade/vim-gitgutter
" ---------------------------------------------------------------------
exe   "hi!   SyntasticErrorSign"   . s:fmt_none . s:fg_red    . s:bg_base02
exe   "hi!   SyntasticWarningSign" . s:fmt_none . s:fg_orange . s:bg_base02

" SyntasticErrorSign - For syntax errors, links to 'error' by default
" SyntasticWarningSign - For syntax warnings, links to 'todo' by default

"}}}
" Utility autocommand "{{{
" ---------------------------------------------------------------------
" In cases where Solarized is initialized inside a terminal vim session and 
" then transferred to a gui session via the command `:gui`, the gui vim process 
" does not re-read the colorscheme (or .vimrc for that matter) so any `has_gui` 
" related code that sets gui specific values isn't executed.
"
" Currently, Solarized sets only the cterm or gui values for the colorscheme 
" depending on gui or terminal mode. It's possible that, if the following 
" autocommand method is deemed excessively poor form, that approach will be 
" used again and the autocommand below will be dropped.
"
" However it seems relatively benign in this case to include the autocommand 
" here. It fires only in cases where vim is transferring from terminal to gui 
" mode (detected with the script scope s:vmode variable). It also allows for 
" other potential terminal customizations that might make gui mode suboptimal.
"
autocmd GUIEnter * if (s:vmode != "gui") | exe "colorscheme " . g:colors_name | endif
" }}}

" License "{{{
" ---------------------------------------------------------------------
"
" Copyright (c) 2011 Ethan Schoonover
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"
" vim:foldmethod=marker:foldlevel=0
"}}}
