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
