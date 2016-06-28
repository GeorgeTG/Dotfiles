""" .vimrc

""" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

"" To paste code with no autoindent
set pastetoggle=<F10>

let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_insertion = 1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"""" PLUGINS AREA
call vundle#begin()

"Let the plugin manage it self. Required
Plugin 'gmarik/Vundle.vim'

""" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'godlygeek/csapprox'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'
Plugin 'othree/html5.vim'

call vundle#end()            " required
"""" PLUGINS AREA END

filetype plugin indent on    " required

""" syntax highlighting
syntax on

set t_Co=256

""" show (partial) command in the last line of the screen
set showcmd

""" display line numbers
set number

""" For airline
set laststatus=2

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

""" search
" If the 'ignorecase' option is on, the case of normal letters is ignored.
" 'smartcase' can be set to ignore case when the pattern contains lowercase
" letters only.
set ignorecase
set smartcase
" While typing a search command, show where the pattern, as it was typed
" so far, matches.
set incsearch


""" source code lines should be at most 101 characters wide
""" set a marker on the 81th text column
set colorcolumn=101

""" folds
" automatic folds based on syntax
set foldmethod=indent
set foldnestmax=1

"colorscheme evening
"colorscheme Tomorrow
colorscheme evening
"colorscheme Tomorrow-Night-Bright
"colorscheme Tomorrow-Night-Eighties

""" Gvim cursor
highlight Cursor guifg=white guibg=red
highlight iCursor guifg=white guibg=steelblue
set guicursor+=a:blinkon0

if &term =~ "xterm\\|rxvt"
    " use an orange cursor in insert mode
    let &t_SI = "\<Esc>]12;orange\x7"
    " use a red cursor otherwise
    let &t_EI = "\<Esc>]12;223;116;180\x7"
    silent !echo -ne "\033]12;red\007"
    " reset cursor when vim exits
    autocmd VimLeave * silent !echo -ne "\033]112\007"
    " use \003]12;gray\007 for gnome-terminal and rxvt up to
    version 9.21
    endif


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
nnoremap t :tabnew  

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

""" use the mouse in gvim
if has("gui_running")
    nmap <LeftMouse> <LeftMouse>i
endif


" NERDTree key
map <C-n> :NERDTreeToggle<CR>

""" open folds when opening a file
au BufRead * normal zR


""" from "Vim as a Python IDE"
set clipboard=unnamedplus
