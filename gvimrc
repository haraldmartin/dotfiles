" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=Menlo:h13             " Font family and font size.
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.

set guioptions-=T                 "kill toolbar
set guioptions-=m                 "kill menu
set guioptions-=r                 "kill right scrollbar
set guioptions-=l                 "kill left scrollbar
set guioptions-=L                 "kill left scrollbar with multiple buffers

set background=dark               " Background.
set lines=45 columns=100          " Window dimensions.

set guioptions-=r                 " Don't show right scrollbar

if has("gui_macvim")
  " macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<cr>
end
