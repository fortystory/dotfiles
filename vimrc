set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = " "
map <leader>b <Esc>:TagbarToggle <CR> 
map <leader>t <Esc>:NERDTreeToggle <CR>
map <leader>a $^i//<Esc> 
map <leader>l <C-w>l "分屏向右 
map <leader>h <C-w>h "分屏向左 
map <leader>w <C-w>w "分屏向左 



set nu
set background=dark
" set cursorline
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

set tabstop=4
set ignorecase smartcase
set relativenumber
set sm 
set fillchars=vert:\ ,stl:\ ,stlnc:\
set novisualbell
syntax on
colorscheme darkblue 

