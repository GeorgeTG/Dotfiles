""" .vimrc



""" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

" Required:
    set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.config/nvim/bundle/'))
"Let the plugin manage it self. Required
NeoBundleFetch 'Shougo/neobundle.vim'
""" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleFetch 'Lokaltog/vim-easymotion'
NeoBundleFetch 'ervandew/supertab'
NeoBundleFetch 'scrooloose/nerdcommenter'
NeoBundleFetch 'scrooloose/nerdtree'
NeoBundleFetch 'scrooloose/syntastic'
NeoBundleFetch 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundleFetch 'CSApprox'
" All of your Plugins must be added before the following line
call neobundle#end()
filetype plugin indent on    " required

NeoBundleCheck
""" syntax highlighting
syntax on

set t_Co=256

""" show (partial) command in the last line of the screen
set showcmd

""" display line numbers
set number

""" automatically change working directory to the directory of the current file
autocmd BufEnter * lcd %:p:h

set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
set showtabline=2

""" default indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

""" command-line completion
set wildmode=longest,full
set wildmenu
" case insensitive filename completion
set wildignorecase

""" disable cursor blinking
set guicursor+=a:blinkon0


""" search
" If the 'ignorecase' option is on, the case of normal letters is ignored.
" 'smartcase' can be set to ignore case when the pattern contains lowercase
" letters only.
set ignorecase
set smartcase
" While typing a search command, show where the pattern, as it was typed
" so far, matches.
set incsearch


""" source code lines should be at most 80 characters wide
""" set a marker on the 81th text column
set colorcolumn=81

""" folds
" automatic folds based on syntax
set foldmethod=indent
set foldnestmax=1


"colorscheme Tomorrow
colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Bright
"colorscheme Tomorrow-Night-Eighties


""" EasyMotion
let g:EasyMotion_leader_key = '\'
"let g:EasyMotion_do_shade = 0
"hi link EasyMotionTarget ErrorMsg
"hi link EasyMotionShade Comment
hi link EasyMotionTarget2First EasyMotionTarget
hi link EasyMotionTarget2Second EasyMotionTarget
"hi EasyMotionTarget ctermbg=none ctermfg=red
"hi EasyMotionShade ctermbg=none ctermfg=gray
"hi EasyMotionTarget2First ctermbg=none ctermfg=red
"hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred


" set default encoding to utf-8
set encoding=utf-8


nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬


""" filetype specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C
autocmd BufNewFile,BufRead *.h set filetype=c
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" CSS
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" HTML
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Java
autocmd FileType java setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" JavaScript
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" make
autocmd FileType make setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Python
autocmd FileType py setlocal textwidth=79 tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent

" SQL
autocmd FileType sql setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" yaml
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab



""" strip trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" strip trailing whitespace on save
autocmd BufWritePre *.asm,*.c,*.css,*.h,*.html,*.jade,*.java,*.m,*.md,*.markdown,*.js,*.py,*.sh,*.styl,*.sql,*.txt,*.v :call <SID>StripTrailingWhitespaces()

" map the <SID>StripTrailingWhitespaces function to a shortcut
"nnoremap <silent> ,s :call <SID>StripTrailingWhitespaces()<CR>
nnoremap ,w :call <SID>StripTrailingWhitespaces()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""" custom shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open a new tab with t
" note the trailing space in the command
nnoremap t :tabedit 

" toggle spell checking
" http://vim.wikia.com/wiki/Toggle_spellcheck_with_function_keys
nnoremap ,s :setlocal spell!<CR>


""" Greek input and spell checking
function! <SID>GreekInputSpellChecking()
    setlocal keymap=greek_utf-8
    setlocal spell spelllang=en,el
endfunction
function! <SID>EnglishInputSpellChecking()
    setlocal keymap=
    setlocal spell spelllang=en,el
endfunction
"nnoremap ,g :call <SID>GreekInputSpellChecking()<CR>
"nnoremap ,e :call <SID>EnglishInputSpellChecking()<CR>
nnoremap ,g :setlocal keymap=greek_utf-8<CR>:setlocal spell spelllang=en,el<CR>
nnoremap ,e :setlocal keymap=<CR>:setlocal spell spelllang=en,el<CR>
nnoremap ,h :setlocal keymap=greek_utf-8<CR>:setlocal spell spelllang=el<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""" create parent directories on save
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END


""" use the mouse in gvim
if has("gui_running")
    nmap <LeftMouse> <LeftMouse>i
endif


" NERDTree show hidden files
let NERDTreeShowHidden=1


""" open folds when opening a file
au BufRead * normal zR


""" from "Vim as a Python IDE"
set clipboard=unnamed
