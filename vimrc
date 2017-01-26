set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = " "
map <leader>b <Esc>:TagbarToggle <CR> 
map <leader>t <Esc>:NERDTreeToggle <CR>
map <leader>a $^i//<Esc> 
map <leader>l <C-w>l "分屏向右 
map <leader>h <C-w>h "分屏向左 
map <leader>w <C-w>w "分屏向左 
map <leader>p :call PhpDocSingle() <CR>

" filetype plugin on
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP

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


" php语法检查
autocmd BufWritePost *.php call PHPSyntaxCheck()
 
" php路径
let g:PHP_SYNTAX_CHECK_BIN = '/home/users/xiuwei/athena/php/bin/php' 
" if !exists('g:PHP_SYNTAX_CHECK_BIN')
"     let g:PHP_SYNTAX_CHECK_BIN = 'php'
" endif
 
function! PHPSyntaxCheck()
    let result = system(g:PHP_SYNTAX_CHECK_BIN.' -l -n '.expand('%'))
    if (stridx(result, 'No syntax errors detected') == -1)
        echohl WarningMsg | echo result | echohl None
    endif
endfunction


" php 补全代码
" set omnifunc=phpcomplete#CompletePHP
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
