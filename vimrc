scriptencoding utf-8
set nocp "让 VIM 工作在不兼容模式下
set rtp+=~/.vim/bundle/Vundle.vim
" set rtp+=/usr/local/lib/python3.5/dist-packages/powerline/bindings/vim/
call vundle#begin()
 
Plugin 'VundleVim/Vundle.vim'
" Plugin 'majutsushi/tagbar' "暂时无用
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plugin 'mattn/emmet-vim'
Plugin 'ervandew/supertab'
Plugin 'fugalh/desert.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'
"Plugin 'junegunn/seoul256.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/gundo.vim'
Plugin 'MaryHal/AceJump.vim'
Plugin 'itchyny/calendar.vim'
if ( version >= 800 )
	Plugin 'w0rp/ale' " 语法检查
endif
"Plugin 'vim-ctrlspace/vim-ctrlspace'
" Plugin 'vim-scripts/taglist.vim' "taglist
"Plugin 'hrj/vim-DrawIt'   " 画ascii码画
"Plugin 'chriskempson/tomorrow-theme'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = " "
" nnoremap <leader>b :TagbarToggle<CR> " tagbar
" nnoremap <leader>b :Tlist<CR> 
nnoremap <leader>t :NERDTreeToggle<CR>

" 下一个todo
nnoremap <leader>n /todo<CR>:nohl<CR>

"php添加注释
nnoremap <leader>p :call PhpDocSingle()<CR> 

" filetype plugin on
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" undo列表 
nnoremap <leader>u :GundoToggle<CR>

" 编辑模式下的快捷键
" inoremap <C-Right> <ESC>ea
" inoremap <C-Left> <ESC>bi

"设置切换Buffer快捷键"
nnoremap <silent>[b :bp<CR>
nnoremap <silent>]b :bn<CR>
nnoremap <silent>[a :next<CR>
nnoremap <silent>]a :prev<CR>

"编辑.vimrc文件
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"重载.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
"给一个单词添加双引号
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" 中文帮助
set helplang=cn

" 开启命令超时,超时时间300毫秒
set to 
set tm=500

set nu
set nowrap
set background=dark

set autoindent "根据上一行决定新行的缩进
set cindent 
set tabstop=4
set fileignorecase "使用:e 的时候忽略文件名大小写 下面的 ignorecase smartcase tagcase 也是忽略大小写的配
set ignorecase 
set smartcase
set relativenumber
set sm 
set fillchars=vert:\ ,stl:\ ,stlnc:\
set novisualbell
syntax on
set hls   "搜索时高亮显示被找到的文本
set is    "搜索时在未完全输入完毕要检索的文本时就开始检索

"打开下面配置 powerline会显示不正确
"set ambiwidth=double  "防止特殊符号无法正常显示
" let g:rehash256 = 1
set t_Co=256 "支持256颜色
" colorscheme darkblue 
" set termguicolors " 真彩色

set cursorline 
set cursorcolumn

set sw=4 "自动缩进的时候缩进尺寸为4个空格
set ts=4 "Tab宽度为4个字符
set smarttab "当使用et将Tab替换为空格之后,按下一个Tab键就能插入4个空格,但要想删除这4个空格,就得按4下Backspace,很不方便.设置smarttab之后,就可以只按一下Backspace就删除4个空格了.
" set spell "打开拼写检查.拼写有错的单词下方会有红色波浪线,将光标放在单词上,按 z= 就会出现拼写建议,按 ]s 可以直接跳到下一个拼写错误处. 
set nocompatible
set hidden

" 里面的配置可能再vim8以下的版本中报错
if (version > 800)
	set tagcase=smart
	" 在vim的补全时忽略某些文件
	set wildignore+=*.o,*~,*.pyc,*.class
endif
" 补全列表方式 和循环方式
set wildmode=full
" 补全提示增强
set wildmenu

" 输入括号时光标会短时间跳转到匹配的括号上
set showmatch
set matchtime=3

" 下面一行用于使用 :set list 显示空白字符时对 空格 tab 换行的映射
set listchars=tab:>-,space:⊔,trail:-,eol:¬
" set list

if has("gui_running")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif


" php语法检查
autocmd BufWritePost *.php call PHPSyntaxCheck()
 
" php路径
let g:PHP_SYNTAX_CHECK_BIN = '/home/xiuwei/bin/php' 
if !exists('g:PHP_SYNTAX_CHECK_BIN')
    let g:PHP_SYNTAX_CHECK_BIN = 'php'
endif
 
function! PHPSyntaxCheck()
    let result = system(g:PHP_SYNTAX_CHECK_BIN.' -l -n '.expand('%'))
    if (stridx(result, 'No syntax errors detected') == -1)
        echohl WarningMsg | echo result | echohl None
    endif
endfunction

" html css文件生效
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" emmet 默认热键<C-Y>
let g:user_emmet_leader_key="<c-e>"

colorscheme molokai 
let g:molokai_original = 1 
" let g:seoul256_background = 233
" colorscheme seoul256

" autocmd VimEnter * NERDTree "在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
let NERDTreeShowBookmarks=1 "当打开NERDTree窗口时，自动显示Bookmarks  

" airline setting
let g:airline_powerline_fonts = 1
"打开tabline功能
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

let g:airline_theme='deus'

" or copy paste the following into your vimrc for shortform text
" 普通模式显示N 插入显示I 可视显示V
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

set laststatus=2
set lazyredraw

" nnoremap <silent><C-p> :CtrlSpace O<CR>
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

" acejump
nnoremap <Leader><Leader> :call AceJumpChar("")<CR>

" php注释
" Default values
let g:pdv_cfg_Type = "mixed"
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = "0.0.1"
let g:pdv_cfg_Author = "修伟 <xiuwei@hunwater.com>"
let g:pdv_cfg_Copyright = "Copyright ''"
let g:pdv_cfg_License = "PHP Version 7.0 {@link http://www.php.net/license/7_0.txt}"

"calendar 配置
nnoremap <leader>c :Calendar<CR>
nnoremap <leader>cc :Calendar -view=clock<CR>
nnoremap <leader>cw :Calendar -view=week<CR>
let g:calendar_first_day = 'sunday'
let g:calendar_time_zone = '8000'

" 自定义快捷键
nnoremap <leader>sw demmwvep`mPb "switch word 
" 选择buffer 
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>
nnoremap <leader>0 :b10<CR>
nnoremap <leader>l :buffers !<CR>
" nnoremap <leader><tab> :e #<CR> " CTRL<CR> 为默认 不重新映射了
nnoremap <leader><tab> :bn<CR> 为默认 不重新映射了
" 使用自动命令 对不同的文件的注释
" autocmd FileType php nnoremap <buffer> <leader>/ I#<down><esc>

"  格式化xml 从csdn上抄的 http://blog.csdn.net/joeblackzqq/article/details/7427220
func! Xml_r()
   set filetype=xml
   :%s/></>\r</g "把><替换成>回车<
   :normal gg=G
endfunction
nnoremap <leader>x :call Xml_r()<CR>

"C,C++的调试
nnoremap <leader>r :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o -Wall %<"
	exec "!gdb ./%<"
endfunc

if ( version >= 800 )
	" ale配置 语法校验
	nnoremap <silent> <leader>k <Plug>(ale_previous_wrap)
	nnoremap <silent> <leader>j <Plug>(ale_next_wrap)
	let g:ale_sign_error = '>'
	let g:ale_sign_warning = '-'
	let g:ale_lint_on_text_changed = 'never' " 这条和下条是让ale在保存文件是校验语法,若无这两句会在编辑时校验,比较烦
	let g:ale_lint_on_enter = 0
endif
