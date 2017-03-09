set nocp "让 VIM 工作在不兼容模式下
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plugin 'mattn/emmet-vim'
Plugin 'ervandew/supertab'
Plugin 'fugalh/desert.vim'
Plugin 'vim-airline/vim-airline'
" Plugin 'fholgado/minibufexpl.vim'  " 不如airline 好看

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = " "
map <leader>b :TagbarToggle<CR> 
map <leader>t :NERDTreeToggle<CR>
map <leader>a ^i//<Esc> 
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
" 下一个todo
map <leader>n /todo<CR>:nohl<CR>
" filetype plugin on
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

set nu
" set background=dark

set tabstop=4
set ignorecase smartcase
set relativenumber
set sm 
set fillchars=vert:\ ,stl:\ ,stlnc:\
set novisualbell
syntax on
set hls   "搜索时高亮显示被找到的文本
set is    "搜索时在未完全输入完毕要检索的文本时就开始检索
set ambiwidth=double  "防止特殊符号无法正常显示
" let g:rehash256 = 1
set t_Co=256 "支持256颜色
" colorscheme darkblue 
" set termguicolors " 真彩色

"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
set cursorline 
set cursorcolumn
" highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=none guifg=none
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=none guifg=none
" hi CursorLine   cterm=NONE ctermbg=grey ctermfg=white
" hi CursorColumn cterm=NONE ctermbg=grey ctermfg=white

set sw=4 "自动缩进的时候缩进尺寸为4个空格
set ts=4 "Tab宽度为4个字符
set smarttab "当使用et将Tab替换为空格之后,按下一个Tab键就能插入4个空格,但要想删除这4个空格,就得按4下Backspace,很不方便.设置smarttab之后,就可以只按一下Backspace就删除4个空格了.
" set spell "打开拼写检查.拼写有错的单词下方会有红色波浪线,将光标放在单词上,按 z= 就会出现拼写建议,按 ]s 可以直接跳到下一个拼写错误处. 


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


colorscheme molokai 
let g:molokai_original = 1 
" colorscheme desert


" autocmd VimEnter * NERDTree "在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
let NERDTreeShowBookmarks=1 "当打开NERDTree窗口时，自动显示Bookmarks  

" airline setting
" let g:airline_theme="luna" 

"这个是安装字体后 必须设置此项" 
"let g:airline_powerline_fonts = 1   

"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
"我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 关闭状态显示空白符号计数,这个对我用处不大"
"let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#whitespace#symbol = '!'
