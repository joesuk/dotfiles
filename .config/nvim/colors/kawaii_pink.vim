highlight clear
if exists("syntax_on")
  syntax reset
endif

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE ctermfg=79 guibg=NONE
" color tex commands (e.g., begin/end)
autocmd filetype tex highlight texCmd ctermfg=180
autocmd filetype tex highlight texMathSuperSub ctermfg=180
autocmd filetype tex highlight texMathOper ctermfg=180
autocmd filetype tex highlight texComment ctermfg=238
" color matchings (e.g., begin/end while under cursor)
autocmd filetype * highlight MatchParen ctermfg=16 ctermbg=214
" color .vim file syntaxes
autocmd filetype vim highlight vimCommand ctermfg=180
autocmd filetype vim highlight vimHighlight ctermfg=180
" color muttrc syntax
autocmd filetype * highlight muttrcCommand ctermfg=180
" color search terms
hi Search cterm=NONE ctermfg=16 ctermbg=214
" color visual/highlighting
hi Visual cterm=bold ctermbg=13 ctermfg=15
" change comment colors
highlight Comment ctermfg=238
set background=dark
let s:mybg = "light"

" lightline
let s:base3 = '#ffffff'
let s:base23 = '#ffffff'
let s:base2 = '#ffffff'
let s:base1 = '#ffffff'
let s:base0 = '#ffffff'
let s:base00 = '#862ca0'
let s:base01 = '#862ca0'
let s:base02 = '#906a9b'
let s:base023 = '#862ca0'
let s:base03 = '#002451'
let s:red = '#ff9da4'
let s:orange = '#ffc58f'
let s:yellow = '#ffeead'
let s:green = '#d1f1a9'
let s:cyan = '#99ffff'
let s:blue = '#ebbbff'
let s:magenta = '#87ffff'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base023, s:blue ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:base1 ], [ s:base2, s:base01 ] ]
let s:p.inactive.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.left =  [ [ s:base02, s:base0 ], [ s:base00, s:base03 ] ]
let s:p.insert.left = [ [ s:base023, s:green ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:orange ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base023, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base1, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base0, s:base02 ] ]
let s:p.tabline.left = [ [ s:base2, s:base01 ] ]
let s:p.tabline.tabsel = [ [ s:base2, s:base03 ] ]
let s:p.tabline.middle = [ [ s:base01, s:base1 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:base023, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#kawaii_pink#palette = lightline#colorscheme#fill(s:p)
