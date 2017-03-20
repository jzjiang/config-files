set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Solarized
Plugin 'altercation/vim-colors-solarized'

" Syntastic
Plugin 'scrooloose/syntastic'

" Handlebars syntax highlighting
Plugin 'mustache/vim-mustache-handlebars'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Colours!
syntax enable
set background=dark
colorscheme solarized

" Basics
set showcmd
set showmode
set nu " Line numbers on
set showmatch " Show matching brackets/parenthesis
set spell
set history=1000
set backup " backup current file
set splitright
set splitbelow
set mouse=a
set clipboard=unnamed

" Whitespace
set nowrap
set ts=2
set sw=2
set expandtab
set softtabstop=2
set autoindent
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
set list

" Visual editing
set cursorline
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" Autocomplete
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

" Searching
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

" Always work out of cwd
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" Easier than typing SyntasticCheck
nmap <silent> <leader>c :SyntasticCheck<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers = [ 'eslint' ]
autocmd FileType javascript let b:syntastic_javascript_eslint_exec = substitute(system('npm bin'), '\n\+$', '', '') . "/eslint"
autocmd FileType javascript let b:syntastic_checkers = ['eslint']
