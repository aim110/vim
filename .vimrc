" sy on
set number                  " line numbers
set ruler                   " column, line numbers
set showmode                " show 'insert' and other modes
set autoread                " read file if it was changed
let mapleader=','

" Search
set hls                     " highlight search
set ignorecase
set smartcase               " Search case sensitive only if got upper case in request
set incsearch               " incremental search
map <leader><space> :noh<CR>
set wildmenu " show files while using commands e, tabe
set wildignore=*.o,*~,*.pyc,.git\*,.hg\*,.svn\* " extensions not to show

set so=10
" set shellcmdflag=-ic        " make vim know about bash aliases
" cursor line
set cursorline
hi CursorLine cterm=None guibg=8 ctermbg=0
nnoremap <leader>c :set cursorline!<CR>

" Editing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
" prev, next, new tab
"map <leader>h :tabp<CR>
"map <leader>l :tabn<CR>
map <leader>n :tabnew<CR>
map <leader>m :tabp<CR>
map <leader>. :tabn<CR>

" Highlights
hi perlTodo term=italic,bold,underline ctermfg=black ctermbg=darkmagenta
hi Comment ctermfg=green

" window up/down
map <leader>+ <c-w>+
map <leader>- <c-w>-

" Some mappings
nnoremap <leader>a :set number!<CR>
nnoremap <leader>s :set list!<CR>
nnoremap <leader>d :set paste!<CR>
inoremap jj <esc>
" set TlistToggle
set fileencodings=utf-8,koi8-r,cp1251
set gdefault
nnoremap <tab> %
vnoremap <tab> %
set nocompatible
nnoremap ; :
nnoremap <leader>v V`]
" get full path for current file in cmd
cabbr %% <C-R>=expand('%:p:h')<CR>

"
" new
"
set pastetoggle=<F2> " like <leader>d, for pasing
vnoremap <leader>s :sort<CR>     " sort selected

" move blocks
vnoremap > >gv
vnoremap < <gv

" don't use backups
set nobackup
set nowritebackup
set noswapfile

" highlist trailing whitespaces; before colorscheme
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" remove all trailing whitespaces by F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" apply sweet color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

filetype off
filetype plugin indent on " to enable ftplugin AFAIK
syntax on

" format long text to 80 symbols
vmap Q gq
nmap Q gqap

" plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
call pathogen#infect()

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git; https://github.com/Lokaltog/vim-powerline
set laststatus=2
" let g:Powerline_symbols = 'fancy'
" set encoding=utf-8

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
" http://www.vim.org/scripts/script.php?script_id=1494
set ft=python_editing
set nofoldenable

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" exec `git submodule update --init` at .vim/bundle/jedi-vim
" maybe it's crucial to `pip install jedi`
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


"
" end of new
"


" compile and run
:autocmd bufenter *.pl nmap <C-c><C-c> :!perl -Wc %
:autocmd bufenter *.pm nmap <C-c><C-c> :!perl -Wc %
:autocmd bufenter *.pl nmap <C-c><C-v> :!perl -w %

:autocmd bufenter *.py nmap <C-c><C-c> :!python -m py_compile %
:autocmd bufenter *.py nmap <C-c><C-n> :!nosetests -s -v --with-doctest
:autocmd bufenter *.py nmap <C-c><C-m> :!nosetests -s -v --with-doctest --tests=%
:autocmd bufenter *.py nmap <C-c><C-v> :!python %

:autocmd bufenter *.sh nmap <C-c><C-v> :!bash %

:autocmd bufenter *.c nmap <C-c><C-c> :!gcc % -std=c99
:autocmd bufenter *.cpp nmap <C-c><C-c> :!gcc % -std=c99
:autocmd bufenter *.c nmap <C-c><C-v> :!./a.out
" :autocmd bufenter * nmap <C-c><C-v> :!bash %
