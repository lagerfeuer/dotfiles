" General
autocmd!
syntax on
set nu
" set relativenumber
set autoread
set laststatus=2
set encoding=utf-8
set t_Co=256

" Improved Enter
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Leader 
let mapleader=","

" Python Paths
let g:python_host_prog = '/usr/bin/python'
let g:python2_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" hide default mode indicator
set noshowmode

" Search
set ignorecase
set smartcase
set nohlsearch

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Autocomplete/Syntax-Check
Plug 'Shougo/deoplete.nvim'
" C/C++
" Plug 'zchee/deoplete-clang'
Plug 'neomake/neomake'
Plug 'justmao945/vim-clang'
Plug 'rhysd/vim-clang-format'
Plug 'ericcurtin/CurtineIncSw.vim'
" Python
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'
Plug 'tell-k/vim-autopep8'
Plug 'tmhedberg/SimpylFold'
Plug 'zhimsel/vim-stay'
" Crystal
Plug 'rhysd/vim-crystal'
" Latex
Plug 'donRaphaco/neotex', { 'for': 'tex' }
" Lisp
Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'kovisoft/slimv'
Plug 'l04m33/vlime'
" ReStructuredText
Plug 'Rykka/riv.vim', { 'for': 'rst' }
Plug 'Rykka/InstantRst', { 'for': 'rst' }
" NerdTree
Plug 'scrooloose/nerdtree'
" Ranger
" Plug 'airodactyl/neovim-ranger'
" TMUX
Plug 'tmux-plugins/vim-tmux'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Misc
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'matze/vim-move'
" Airline (Powerline)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Colorschemes
Plug 'sjl/badwolf'
Plug 'notpratheek/vim-luna'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'w0ng/vim-hybrid'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'trusktr/seti.vim'
Plug 'arcticicestudio/nord-vim'
" Misc Langs
Plug 'harenome/vim-mipssyntax'
Plug 'pearofducks/ansible-vim'
Plug 'fladson/vim-kitty', { 'branch': 'main' }

call plug#end()

filetype plugin indent on
" show existing tab with 2 spaces width
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
" Smarttab
set smarttab

" colorscheme
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
" let g:onedark_termcolors=256
" onedark, seti, nord
colorscheme nord

""" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""" Python
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff = 1
let g:autopep8_ignore="E226,E24,W6,E731"
" Jedi
let g:jedi#show_call_signatures = 2
map <leader>s :call jedi#force_py_version_switch()<CR>

""" C/C++
let g:clang_format#detect_style_file = 1
let g:clang_format#style_options = {
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "FixNamespaceComments": "true",
            \ "IndentWidth" : 2,
            \ "PointerBindsToType": "true",
            \ "Standard" : "Auto"}

autocmd FileType c,cpp nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>f :ClangFormat<CR>
autocmd FileType c,cpp ClangFormatAutoEnable
nmap <Leader>C :ClangFormatAutoToggle<CR>
"map <leader>f :ClangFormat<CR>
map <leader>a :call CurtineIncSw()<CR>

"""  Airline
let g:airline_powerline_fonts = 1
let g:tender_airline = 1
" 'onedark' , 'tomorrow', 'nord'
let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1

""" Neomake
autocmd! BufWritePost * Neomake

" vim-move <C-k> up / <C-j> down
" <C-k>/<C-j> already in use for window movement, default <A-k>/<A-j>
" let g:move_key_modifier = 'C'

""" Ranger
" call with <F9>
nnoremap <f9> :tabe %:p:h<cr>

""" NerdTree
map <C-n> :NERDTreeToggle<CR>

""" Lisp
augroup rainbow_lisp
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
""" Prolog
au BufReadPost *.plt setf prolog

""" vim-stay
set viewoptions=cursor,folds,slash,unix
