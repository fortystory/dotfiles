set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plugin 'mattn/emmet-vim'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = " "
map <leader>b :TagbarToggle<CR> 
map <leader>t :NERDTreeToggle<CR>
map <leader>a $^i//<Esc> 
"分屏向右 
map <leader>l <C-w>l
"分屏向左 
map <leader>h <C-w>h
" 保存 
map <leader>w <Esc>:w<CR>
" 退出
map <leader>q <Esc>:q<CR> 
"php添加注释
map <leader>p :call PhpDocSingle()<CR> 

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

" emmet 
" 只在插入模式使用
" let g:user_emmet_mode='i'    "only enable insert mode functions.
" let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
" let g:user_emmet_mode='a'    "enable all function in all mode.

" html css文件生效
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" emmet 默认热键<C-Y>
let g:user_emmet_leader_key="<c-e>"
