set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
" Plugin 'tpope/vim-fugitive'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
" Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
" Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
" Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall  	 - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

" YCM配置
" 寻找全局配置文件
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 启用语义补全
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
" 设置终止匹配键
let g:ycm_key_list_stop_completion = ['<Space>']

" airline配置
" smarter tab line
let g:airline#extensions#tabline#enabled = 1
" which path formatter
let g:airline#extensions#tabline#formatter = 'unique_tail'
" 更换主题
let g:airline_theme="durant"
" 启用字体
let g:airline_powerline_fonts = 1
" 设置切换Buffer快捷键
nnoremap <c-n> :w<CR>:bn<CR>
nnoremap <c-p> :w<CR>:bp<CR>

let g:NERDSpaceDelims=1     " 注释后面自动加空格"

let g:airline#extensions#tabline#buffer_nr_show = 1

set encoding=utf-8
set fileencodings=utf-8,chinese
set tabstop=4 "tab键空格数
set cindent shiftwidth=4
set backspace=indent,eol,start
set incsearch "输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set number "显示行号
set display=lastline
set ignorecase "搜索时忽略大小写
syntax on "打开语法高亮
set nobackup
set foldenable "打开折叠
set ruler "显示标尺
set showcmd "命令模式下，在底部显示，当前键入的指令
set smartindent
set hlsearch "高亮显示搜索匹配结果
set cmdheight=1
set laststatus=2
set shortmess=atI
set formatoptions=tcrqn
set autoindent "下一行缩进和上一行一致
set showmode "在底部显示，当前处于命令模式还是插入模式
set t_Co=256 "启用256色
set cursorline "光标所在行高亮
set linebreak "只有遇到指定符号才发生折行
" set spell spelllang=en_us "打开英语单词的拼写检查
set undofile "保留撤销历史
set noerrorbells "出错时不要发出响声

" 命令模式下，底部操作指令按下Tab键自动补全。第一次按下Tab，会显示所有匹配的操作指令的清单；第二次按下Tab，会依次选择各个指令。
set wildmenu
set wildmode=longest:list,full

" highlight用来配色，cterm原生vim设置样式，ctermbg设置终端vim的背景色，ctermfg设置终端vim的前景色，guibg和guifg是gvim的
highlight CursorLine cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE

" 显示调试信息，再次回车退出小窗口
map <F9> :YcmDiags<CR>

" 鼠标设置
set mouse=nvc

" 光标移动
inoremap <c-l> <RIGHT>
inoremap <c-h> <LEFT>

" 符号自动补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap < <lt>><esc>i
inoremap { {}<Esc>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap > <c-r>=ClosePair('>')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 return a:char
 elseif line[col - 1] == a:char
 return "\<Right>"
 else
 return a:char.a:char."\<Esc>i"
 endif
endf

" insert模式下 Ctrl+d 删除整行
inoremap <c-d> <esc>dd$i<right>
" insert模式下 Ctrl+v 粘贴
inoremap <c-v> <esc>"+pa
" Ctrl+c 复制可视模式下选中的文本
vnoremap <c-c> "+y
" insert模式下 Ctrl+u 撤销
inoremap <c-u> <esc>ui
" Ctrl+x 删除可视模式下选中的文本
vnoremap <c-x> "+d<esc><esc>i

" 设置leader键
let mapleader = ";"
" 编辑我的vimrc文件
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" 重读我的vimrc文件
:nnoremap <leader>lv :source $MYVIMRC<cr>

" abbreviations
iabbrev dmail wangqy101@gmail.com
iabbrev dblog wangqy.cc

" 对normal模式下光标所在的单词添加双引号等
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" normal模式下移动到最后一个字符并开始编辑
nnoremap <c-i> G$i<RIGHT>

" esc键替换
inoremap jk <esc>

" 禁止<esc>
" inoremap <esc> <nop>

" 方向键乱码解决
inoremap OA <UP>
inoremap OB <DOWN>
inoremap OC <RIGHT>
inoremap OD <LEFT>

" 功能键乱码问题解决
inoremap [6~ <pagedown>
inoremap [5~ <pageup>
inoremap OH <home>
inoremap OF <end>
inoremap [3~ <del>
inoremap [2~ <ins>

" 这个leader用于那些只对某类文件而设置的映射
let maplocalleader = ','

" 自动组命令
augroup default_autogroup
	autocmd!
" 读写html文件时进行缩进处理
autocmd BufWritePre,BufRead *.html :normal gg=G

" 不同文件的注释
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType C nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType C++ nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>

" 代码补全
autocmd Filetype c set omnifunc=ccomplete#Complete
autocmd Filetype cpp set omnifunc=cppcomplete#Complete

" 不同文件的缩写
" autocmd FileType python :iabbrev <buffer> iff if:<left>
" autocmd FileType javascript :iabbrev <buffer> iff if()<left>
" autocmd FileType C :iabbrev <buffer> iff if()<left>
" autocmd FileType C++ :iabbrev <buffer> iff if()<left>

" 大括号自动分行
autocmd BufWritePre,BufRead *.c :inoremap <Enter> <c-r>=BracketsEnter('}')<CR>
autocmd BufWritePre,BufRead *.cpp :inoremap <Enter> <c-r>=BracketsEnter('}')<CR>

" http缩写
autocmd BufWritePre,BufRead *.md :iabbrev http http://pqcits4n2.bkt.clouddn.com/didong/images/

augroup END

" 大括号自动分行
function BracketsEnter(char)
	if getline('.')[col('.')-1] == a:char
		return "\<Enter>\<Tab>\<Esc>mpa\<Enter>\<Esc>`pa" 
	else
		return "\<Enter>"
	endif
endf

" 括号\引号等字符之间内容的删除d、修改c、复制y
onoremap ( i(
onoremap [ i[
onoremap { i{
onoremap ' i'
onoremap < i<

" 为VIM脚本文件设置折叠 {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vimscript setlocal foldmethod=marker
augroup END
" }}}

" 开始时折叠所有
set foldlevelstart=0

" 显示
" echo "          ┌─┐       ┌─┐"
" echo "       ┌──┘ ┴───────┘ ┴──┐"
" echo "       │                 │"
" echo "       │       ───       │"
" echo "       │  ─┬┘       └┬─  │"
" echo "       │                 │"
" echo "       │       ─┴─       │"
" echo "       │                 │"
" echo "       └───┐         ┌───┘"
" echo "           │         │"
" echo "           │         │"
" echo "           │         │"
" echo "           │         └──────────────┐"
" echo "           │                        │"
" echo "           │                        ├─┐"
" echo "           │                        ┌─┘    "
" echo "           │                        │"
" echo "           └─┐  ┐  ┌───────┬──┐  ┌──┘         "
" echo "             │ ─┤ ─┤       │ ─┤ ─┤         "
" echo "             └──┴──┘       └──┴──┘ "
" echo "                    神兽保佑       "
" echo "                    永无BUG!       "

" 移动到行首并开始编辑
nnoremap H 0i
" 移动到行尾并开始编辑
nnoremap L $a

" gvim字体大小
set guifont=Monospace\ 15

" gutentags配置
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v']
let g:gutentags_ctags_extra_args += ['--c-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v']

" ctags查看不同的匹配
nnoremap <leader>tl :tn<CR>
nnoremap <leader>th :tp<CR>

" 全选
noremap <c-a> <esc>ggvG$

" NERDTree配置
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

" nerdtree-git-plugin配置
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
