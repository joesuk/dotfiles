highlight clear
if exists("syntax_on")
  syntax reset
endif

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE ctermfg=72 guibg=NONE
" color tex commands (e.g., begin/end)
autocmd filetype tex highlight texCmd ctermfg=141
autocmd filetype tex highlight texCmdEnv ctermfg=5
autocmd filetype tex highlight texMathSuperSub ctermfg=141
autocmd filetype tex highlight texMathOper ctermfg=141
autocmd filetype tex highlight texComment ctermfg=238
" color matchings (e.g., begin/end while under cursor)
autocmd filetype * highlight MatchParen ctermfg=16 ctermbg=214
" color .vim file syntaxes
autocmd filetype vim highlight vimCommand ctermfg=141
autocmd filetype vim highlight vimHighlight ctermfg=141
" color muttrc syntax
autocmd filetype * highlight muttrcCommand ctermfg=141
" color search terms
hi Search cterm=NONE ctermfg=16 ctermbg=214
" color visual/highlighting
hi Visual cterm=bold ctermbg=13 ctermfg=15
" change comment colors
highlight Comment ctermfg=238
set background=light
let s:mybg = "light"
