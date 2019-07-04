" 开启行号
set nu
"关闭自动备份
set nobackup
set nowb

"关闭交换文件
set noswapfile

"设置文件的代码形式 utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

"帮助语言
set helplang=cn
set iskeyword+=

" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/vimfiles/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()  " required

filetype plugin indent on
filetype plugin on

"let g:airline_theme="gruvbox" 
let g:airline_powerline_fonts = 1

