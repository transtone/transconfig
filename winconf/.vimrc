" 开启行号
set nu
"关闭自动备份
set nobackup
set nowb

"关闭交换文件
set noswapfile

set paste

"设置文件的代码形式 utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

"帮助语言
set helplang=cn
set iskeyword+=

nnoremap j gj
nnoremap k gk
nnoremap ^ g^
noremap <A-j> <C-f>
noremap <A-k> <C-b>

let mapleader = "q"

map <Leader><Leader>l <Plug>(easymotion-bd-jk)
map <Leader>c :noh<CR>
map <Leader>w :w<CR>

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
Plugin 'scrooloose/nerdcommenter'
Plugin 'posva/vim-vue'
Plugin 'nginx.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vimacs'


call vundle#end()  " required

filetype plugin indent on
filetype plugin on

let g:airline_theme="wombat" 
let g:airline_powerline_fonts = 1

