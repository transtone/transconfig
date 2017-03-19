"打开行号
set nu!
"自动折行
set wrap
"TAB距离
set tabstop=3

set softtabstop=3
set shiftwidth=3
set expandtab
set cindent
set cursorline
"颜色类型
"colorscheme github

"关闭自动备份
set nobackup
set nowb

"关闭交换文件
set noswapfile

"开启折叠
"set nofen
set fdl=0
set fdc=2
set fdm=syntax

" 指定菜单语言
source $VIMRUNTIME/mswin.vim
set guifont=Envy\ Code\ R\ for\ Powerline:h10
"set guifont=PT\ Mono:h10


" 隐藏工具条
"
" see :help 'guioptions'
"
set guioptions-=T
"set guioptions-=m

"
" 状态条，显示字节数，列数，行数，当前行等信息
"
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line



"帮助语言
set helplang=cn
set iskeyword+=

map <S-Right> :tabnext<CR>
map <S-Left> :tabprev<CR>
