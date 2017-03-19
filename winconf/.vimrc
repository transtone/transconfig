filetype plugin on
filetype indent on

:map <F5> :tabprevious<CR>
:map <F6> :tabnext<CR>
:map ^T :tabnew<CR>
:imap <F5> <ESC>:tabprevious<CR>i
:imap <F6> <ESC>:tabnext<CR>i
:imap ^T <ESC>:tabnew<CR>i

set paste
set clipboard+=unnamed

set fileencodings=utf-8,chinese,latin-1
" 设置文件编码检测类型及支持格式
set fencs=utf-8,gbk,ucs-bom,gb18030,gb2312,cp936

let &runtimepath.=',$HOME/.vim'
