" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

" set guifont=Menlo:h13           " Font family and font size.
set guifont=Meslo\ LG\ S\ DZ:h13
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

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-T for CommandT
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>

  " Command-Shift-F for Ack
  " macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
  " map <D-F> :Ack<space>

  " Command-e for ConqueTerm
  " map <D-e> :call StartTerm()<CR>

  " Command-/ to toggle comments
  nmap <D-/> :TComment<CR>
  vmap <D-/> :TComment<CR> gv
end

