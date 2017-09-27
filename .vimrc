let mapleader=","

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-peekaboo'
call plug#end()

set nocompatible
set nobackup
set nowritebackup
set noswapfile
set ruler
set showcmd
set autowrite
set sessionoptions-=options
set completefunc=emoji#complete
set backspace=indent,eol,start
set t_Co=256
set number
set numberwidth=5
set hidden
set history=1000
set wildmenu
set wildmode=list:longest,full
set title
set autochdir
set autoindent
set incsearch
set hlsearch
set ignorecase
set smartcase
set laststatus=2
set statusline+=%F
set nojoinspaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set list
set listchars=tab:\|\
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

filetype plugin indent on
syntax on

" ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Set ack to use ag
let g:ackprg = 'ag --vimgrep'

colorscheme base16-tomorrow

" Open a file in a new tab
map <leader>t :tabedit<cr>:CtrlP<cr>

" For toggling comments
map <leader>c 1<leader>c<space>

cnoreabbrev Ack Ack!
nnoremap <leader>a :Ack!<space>

" Entering command mode
imap jk <esc>

" Faster tabs
map th :tabfirst<cr>
map tk :tabnext<cr>
map tj :tabprev<cr>
map tl :tablast<cr>
map tt :tabedit<space>
map te :Texplore<cr>

" Quick saving
map s :w<cr>

" Pastes on new line
map pu :pu<cr>

autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile .{vue,twig,jsx}rc set filetype=html
