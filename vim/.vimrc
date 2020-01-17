"Add plugins with Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mattn/emmet-vim'
call vundle#end() 
filetype plugin indent on

"Change the colorscheme
colorscheme molokai

"Enable syntax processing
if has("syntax")
    syntax enable
endif

"Highlight matching [{()}]
set showmatch

"Add line numbers
set number

"Fix arrow keys that display A B C D on remote shell
set nocompatible

"Move vertically by visual line
nnoremap k gk
nnoremap <Up> gk
nnoremap j gj
nnoremap <Down> gj

"Allow backspacing over autoindent, line breaks, start of insert
set backspace=indent,eol,start

"Enable use of the mouse for all modes
set mouse=a

"Search as characters are entered
set incsearch

"Ignore case when searching
set ignorecase

"Highlight search matches (press the escape key twice to turn off)
set hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR>

"Move backups in the /tmp folder instead of working directory
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"Number of visual spaces per tab 
set tabstop=4

"Number of spaces in tab when editing
set softtabstop=4

"Tabs are spaces
set expandtab

"Change the leader key of the Emmet plugin
let g:user_emmet_leader_key=','
