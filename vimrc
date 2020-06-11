" 现在使用spacevim配置文件
scriptencoding utf-8
set encoding=utf-8
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
" Plugin 'bling/vim-bufferline'
Plugin 'tomasr/molokai'
"Plugin 'junegunn/seoul256.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'xuhdev/SingleCompile' "编译 执行
Plugin 'MaryHal/AceJump.vim'
Plugin 'itchyny/calendar.vim'
Plugin 'junegunn/fzf' "fzf"
Plugin 'junegunn/fzf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/limelight.vim'
Plugin 'mbbill/undotree'
Plugin 'junegunn/vim-easy-align'
Plugin 'ludovicchabant/vim-gutentags'
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
nnoremap <leader>t :NERDTreeToggle<CR> " NERDTreeToggle 目录树
" 除了 NERDTree 外只有一个 buffer时候 :q 会连 NERDTree 一起关闭
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


nnoremap <leader>n /todo<CR>:nohl<CR> " 下一个todo

nnoremap <leader>p :call PhpDocSingle()<CR> " php添加注释

" filetype plugin on
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP

nnoremap <leader>u :UndotreeToggle<CR> " undo列表 

" 编辑模式下的快捷键
" inoremap <C-Right> <ESC>ea
" inoremap <C-Left> <ESC>bi

"设置切换Buffer快捷键"
nnoremap <silent>[b :bp<CR>
nnoremap <silent>]b :bn<CR>
nnoremap <silent>[a :next<CR> " 下个buffer
nnoremap <silent>]a :prev<CR> " 上个buffer

nnoremap <leader>ev :vsplit $MYVIMRC<cr> " 编辑.vimrc文件
nnoremap <leader>sv :source $MYVIMRC<cr> " 重载.vimrc
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc> " 给一个单词添加双引号
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc> " 给一个单词添加单引号


set mouse=ar
" 中文帮助
set helplang=cn

" 开启命令超时,超时时间300毫秒
set to 
set tm=500

"set nu
"set relativenumber
set nowrap
"hi Normal ctermbg=NONE
"set background=dark

set autoindent "根据上一行决定新行的缩进
set cindent 
set tabstop=4
set fileignorecase "使用:e 的时候忽略文件名大小写 下面的 ignorecase smartcase tagcase 也是忽略大小写的配
set ignorecase 
set smartcase "查找中如果有一个大写字母，则切换到大小写敏感查找
set sm 
set fillchars=vert:\ ,stl:\ ,stlnc:\
set novisualbell
syntax on
set hls   "搜索时高亮显示被找到的文本
set is    "搜索时在未完全输入完毕要检索的文本时就开始检索
set ic  "搜索時不區分大小寫
set modifiable

" 当光标一段时间保持不动了，就禁用高亮
autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>


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
	" 下面一行用于使用 :set list 显示空白字符时对 空格 tab 换行的映射
	set listchars=tab:>-,space:⊔,trail:-,eol:¬
endif

" 在vim的补全时忽略某些文件
set wildignore+=*.o,*~,*.pyc,*.class
" 补全列表方式 和循环方式
set wildmode=full
" 补全提示增强
set wildmenu

" 输入括号时光标会短时间跳转到匹配的括号上
set showmatch
set matchtime=3

" set list

if has("gui_running")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif


" html css文件生效
let g:user_emmet_install_global = 0
autocmd FileType html,css,php,smarty EmmetInstall
" emmet 默认热键<C-Y>
let g:user_emmet_mode='i'
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
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#switch_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" 关闭状态显示空白符号计数,这个对我用处不大"
" let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#whitespace#symbol = '!'

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

nnoremap <Leader><Leader> :call AceJumpChar("")<CR> " acejump
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" php注释
" Default values
let g:pdv_cfg_Type = "mixed"
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = "0.0.1"
let g:pdv_cfg_Author = "修伟 <xiuwei@hunwater.com>"
let g:pdv_cfg_Copyright = "Copyright ''"
let g:pdv_cfg_License = "PHP Version 7.0 {@link http://www.php.net/license/7_0.txt}"

"calendar 配置
nnoremap <leader>c :Calendar<CR> " calendar月历
nnoremap <leader>cc :Calendar -view=clock<CR> " calendar 时间
nnoremap <leader>cw :Calendar -view=week<CR>  " calendar 周
let g:calendar_first_day = 'sunday'
let g:calendar_time_zone = '8000'

" 自定义快捷键
nnoremap <leader>sw demmwvep`mPb " 交换两个单词的位置 例:foo goo 光标在f出时使用 goo foo
" 选择buffer 
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab10
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab
" 查看buffers
nnoremap <leader>l :Buffers<CR> 

" 寄存器
nnoremap <leader>d :di<CR>
" nnoremap <leader><tab> :e #<CR> " CTRL<CR> 为默认 不重新映射了
" nnoremap <leader><tab> :bn<CR> " 为默认 不重新映射了
" 使用自动命令 对不同的文件的注释
" autocmd FileType php nnoremap <buffer> <leader>/ I#<down><esc>

"  格式化xml 从csdn上抄的 http://blog.csdn.net/joeblackzqq/article/details/7427220
func! Xml_r()
   set filetype=xml
   :%s/></>\r</g "把><替换成>回车<
   :normal gg=G
endfunction
nnoremap <leader>x :call Xml_r()<CR> " 格式化xml

"C,C++的调试
nnoremap <leader>r :SCCompileRun<CR> " 编译运行单个C++文件
"nnoremap <leader>r :call Rungdb()<CR>
"func! Rungdb()
"   exec "w"
"   exec "!g++ % -g -o -std=c++11 -wall %<"
"	exec "!gdb ./%<"
"endfunc

nnoremap <silent> <Leader>f :Files<CR> " fzf 查找当前文件夹下的文件
nnoremap <silent> <Leader>b :Buffers<CR> " fzf 查找Buffers 中的某个buffer  
nnoremap <silent> <Leader>/ :Lines<CR> " fzf 查找当前Buffers中的某一行

if ( version >= 800 )
	" ale配置 语法校验
	nnoremap <silent> <leader>k <Plug>(ale_previous_wrap) " 貌似是上一个语法错误
	nnoremap <silent> <leader>j <Plug>(ale_next_wrap) " 貌似是下一个语法错误
	let g:ale_sign_error = '>'
	let g:ale_sign_warning = '-'
	let g:ale_lint_on_text_changed = 'never' " 这条和下条是让ale在保存文件是校验语法,若无这两句会在编辑时校验,比较烦
	let g:ale_lint_on_enter = 0
else
	" php语法检查
	autocmd BufWritePost *.php call PHPSyntaxCheck()
	 
	" php路径 写到环境变量里 这里就不用些配置了
	let g:PHP_SYNTAX_CHECK_BIN = 'php'
	 
	function! PHPSyntaxCheck()
		let result = system(g:PHP_SYNTAX_CHECK_BIN.' -l -n '.expand('%'))
		if (stridx(result, 'No syntax errors detected') == -1)
			echohl WarningMsg | echo result | echohl None
		endif
	endfunction
endif

" undotree
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+aimS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--languages=php']
