if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'https://github.com/dylnmc/synstack.vim.git' " ctrl-p under word to see syntax
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'JuliaEditorSupport/julia-vim'
" vim latex
Plug 'lervag/vimtex'
" markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'dkarter/bullets.vim' "bullets in markdown
" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown'
    \]
"Remove the + bullet so * always indents as *
let g:bullets_outline_levels = ['ROM', 'ABC', 'num', 'abc', 'rom', 'std-', 'std*']
" latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:Tex_CompileRule_pdf='pdflatex --output-directory=/tmp -aux-directory=/tmp -interaction=nonstopmode $*'
"set conceallevel=1
"let g:tex_conceal='abdmg'

" lightline
Plug 'itchyny/lightline.vim'
" source ~/.config/nvim/colors/dark_purple.vim (causes problems)
let g:lightline = {
\ 'colorscheme': 'dark_purple',
\ 'mode_map': {
\ 'n' : '普通的',
\ 'i' : '插入',
\ 'R' : 'R',
\ 'v' : '視覺的',
\ 'V' : 'VL',
\ "\<C-v>": 'VB',
\ 'c' : '命令',
\ 's' : 'S',
\ 'S' : 'SL',
\ "\<C-s>": 'SB',
\ 't': 'T',
\},
\   'active': {
\    'left' :[[ 'mode'],
\             [ 'readonly', 'filename', 'modified' ]],
\    'right':[[ 'filetype', 'percent', 'lineinfo' ], [ 'cocstatus' ]]
\   },
\}
call plug#end()

" for lightline
set runtimepath+=~/.config/nvim/plugged/lightline
" colorscheme
colorscheme dark_purple
colorscheme vim

set title
set go=a "gui options=a, needed for visual mode copy/paste to other apps
set mouse=a " mouse enabled
set hlsearch
set clipboard+=unnamedplus
set noshowmode "showing visual/insert mode
set noruler "don't show the cursor position all the time
set laststatus=2
set noshowcmd
set ignorecase
set incsearch  " do incremental searching
set history=50 " keep 50 lines of command line history
set backup     " keep a backup file
" tell vim where to put its backup files
set backupdir=~/dox/vim_temp
" tell vim where to put swap files
set dir=~/dox/vim_temp
"set spell
set smartcase " ignore ignorecase if search contains uppercase
set wrap
set wrapmargin=0
set ma


" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright
" source vimrc keybind
	map <leader>sc :source $MYVIMRC<CR>

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

" vimling:
	"nm <leader>d :call ToggleDeadKeys()<CR>
	"imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	"nm <leader>i :call ToggleIPA()<CR>
	"imap <leader>i <esc>:call ToggleIPA()<CR>a
	"nm <leader>q :call ToggleProse()<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	"map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "%:p"<CR>

" autocompile groff on save
au BufWritePost,BufFilePost *.ms !groff -ms % -T pdf > %:r.pdf
au BufWritePost,BufFilePost *.mom !groff -mom % -T pdf > %:r.pdf

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout "%:p"<CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'wiki': 'markdown','.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex<CR>
	let g:vimwiki_list = [{'path': '~/dox/wiki', 'syntax': 'markdown', 'ext': '.md'}]
	let g:vimwiki_global_ext = 0 " don't set all .md files as vimwiki type
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex
	autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
	au BufRead,BufWinEnter,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn} setlocal syntax=markdown
	" open folds by default in vim
	au BufRead * normal zR


" vim-latex commands
	onoremap <silent> i$ :<c-u>normal! T$vt$<cr>
	vnoremap i$ T$ot$

" vimwiki commands
	map <leader>. :lnext<CR>
	map <leader>, :lprev<CR>

" Save file as sudo on files that require root permission
	cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=120
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
  	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xresources_alt,xdefaults set filetype=xdefaults
	"autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }
	autocmd BufWritePost ~/.config/headers/dwmblocks_config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }
	autocmd BufWritePost ~/.config/nvim/init.vim !cd ~/; git add ~/.config/nvim/init.vim && git commit -m "nvim update"
	autocmd BufWritePost ~/acheat.mom !cd ~/; git add acheat.mom && git commit -m "acheat"
	autocmd BufWritePost ~/bootstrap/progs.csv !cd ~/; git add ~/bootstrap/progs.csv && git commit -m "progs.csv"
	autocmd BufWritePost ~/texmf/tex/latex/joe/joe_notes_preamble.tex !cd ~/texmf; git add ~/texmf/tex/latex/joe/joe_notes_preamble.tex && git commit -m "texmf joe_notes"
	autocmd BufWritePost ~/texmf/tex/latex/joe/joe_macros.sty !cd ~/texmf; git add ~/texmf/tex/latex/joe/joe_macros.sty && git commit -m "texmf joe macros"
	autocmd BufWritePost ~/texmf/tex/latex/joe/bandit_macros.sty !cd ~/texmf; git add ~/texmf/tex/latex/joe/bandit_macros.sty && git commit -m "texmf bandit macros"
	autocmd BufWritePost ~/texmf/tex/latex/joe/joe_article_preamble.tex !cd ~/texmf; git add ~/texmf/tex/latex/joe/joe_article_preamble.tex && git commit -m "texmf article macros"

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" toggle wrap
" Make \w toggle through the three wrapping modes.
function ToggleWrap()
 if (&wrap == 1)
   if (&linebreak == 0)
     set linebreak
   else
     set nowrap
   endif
 else
   set wrap
   set nolinebreak
 endif
endfunction

map <leader>w :call ToggleWrap()<CR>

" ensure vim opens links with firefox
let g:netrw_browsex_viewer= "firefox"
" Load command shortcuts generated from bm-dirs and bm-files via shortcuts script.
" Here leader is ";".
" So ":vs ;cfz" will expand into ":vs /home/<user>/.config/zsh/.zshrc"
" if typed fast without the timeout.
silent! source ~/.config/nvim/shortcuts.vim

" disable \ww to open vimwiki
 map <leader>ww <Nop>

 " Automatically change the current working directory
 set autochdir

 " split up line by sentences
map <leader>ss :s/\.\ /\.\ \r/g<CR>

" for overleafs, rsync and then git push
map <leader>gp :! rsync -av --progress ~/dox/res/bibs/ bibs && rsync -av --progress  ~/texmf/tex/latex/joe/ joe && git add . && git commit -a --allow-empty-message -m '' && git push origin<CR>
map <leader>gs :! rsync -av --progress ~/dox/res/bibs/ bibs && rsync -av --progress ~/texmf/tex/latex/joe/ joe<CR>
