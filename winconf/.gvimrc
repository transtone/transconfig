noremap <C-x> "+x
noremap <C-c> "+y
noremap <C-v> "+gp
noremap <A-d> cw<Esc>
noremap <C-x><C-s> :w<cr>
inoremap <C-x> <Esc>"+xa
inoremap <C-c> <Esc>"+ya
inoremap <C-v> <Esc>"+gpa
"inoremap <C-x><C-s> <Esc>:w<cr>a

winpos 500 180
set lines=38 columns=138 

"vim的菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
"vim提示信息乱码的解决
language messages zh_CN.utf-8
 
colorscheme github	"配色方案
set helplang=cn		"设置中文帮助
set history=500		"保留历史记录
set guifont=等距更纱黑体\ T\ SC\ Semibold:h10	"设置字体
set tabstop=4		"设置tab的跳数
set expandtab
set backspace=2 	"设置退格键可用
set wrap 		"设置自动换行
"set nowrap 		"设置不自动换行
set linebreak 		"整词换行，与自动换行搭配使用
"set list 		"显示制表符
set autochdir 		"自动设置当前目录为正在编辑的目录
set hidden 		"自动隐藏没有保存的缓冲区，切换buffer时不给出保存当前buffer的提示
set scrolloff=5 	"在光标接近底端或顶端时，自动下滚或上滚
"Toggle Menu and Toolbar 	"隐藏菜单栏和工具栏
"set guioptions-=m
"set guioptions-=T
set showtabline=2 	"设置显是显示标签栏
set autoread 		"设置当文件在外部被修改，自动更新该文件
set mouse=a 		"设置在任何模式下鼠标都可用
set nobackup 		"设置不生成备份文件
"set go=				"不要图形按钮
set guioptions-=T           " 隐藏工具栏
"set guioptions-=m           " 隐藏菜单栏
 
"===========================
"查找/替换相关的设置
"===========================
set hlsearch "高亮显示查找结果
set incsearch "增量查找
 
 
"===========================
"代码设置
"===========================
syntax enable "打开语法高亮
syntax on "打开语法高亮
set showmatch "设置匹配模式，相当于括号匹配
set smartindent "智能对齐
"set shiftwidth=4 "换行时，交错使用4个空格
set autoindent "设置自动对齐
"set cursorcolumn "启用光标列
set cursorline	"启用光标行
set guicursor+=a:blinkon0 "设置光标不闪烁
set fdm=indent "
 
 
" 关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=21
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

