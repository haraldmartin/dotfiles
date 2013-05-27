" This is Martin Stroms .vimrc file with lots of inpiriation from:
" github.com/henrik/dotfiles
" github.com/garybernhardt/dotfiles
" stevelosh.com/blog/2010/09/coming-home-to-vim

set nocompatible                      " Must come first because it changes other options.
let mapleader = ","

" Pathogen for plugin management
filetype off
call pathogen#infect()                " Load bundles
filetype plugin indent on


" ----- settings --------------------------------------------------------------

set encoding=utf-8

syntax on
set background=dark                   " Some plugins/themes need this
" color Tomorrow-Night
color jellybeans+

set showcmd                           " Display incomplete commands.
set showmode                          " Display the mode you're in.
set showmatch                         " Show matching brackets
set backspace=indent,eol,start        " Intuitive backspacing.
set hidden                            " Handle multiple buffers better.
set ruler                             " Show cursor position.
set listchars=nbsp:·,tab:▸\ ,trail:·  " Configure how invisibles appear.
set list!                             " Show invisibles.
set cursorline
set autoindent
set modelines=1
set nojoinspaces                      " 1 space, not 2, when joining sentences.
set fillchars=vert:\                  " No vertical bar in splits "

" Searching
set gdefault
set hlsearch incsearch                " Highlight matches + as you type
set ignorecase smartcase              " Case-insensitive searching unless expression contains capital letter

set wildmenu                          " Enhanced command line completion.
set wildmode=list:longest             " Complete files like a shell.
set wildignore+=tmp/*,*/tmp/*,*/tmp/**/*,*.jpg,*.gif,*.tif,*.png
set shell=bash

set nowrap                            " Turn on line wrapping.
set scrolloff=3                       " Show 3 lines of context around the cursor.
set visualbell                        " No beeping.

" Backup files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Indention
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab

" Useful status information at bottom of screen
" set statusline=%<%.99F\ %h%w%m%r%y\ %{fugitive#statusline()}%=%-16(\ %l,%c-%v\ %)%P
set laststatus=2                      " Show the status line all the time

" From github.com/henrik/dotfiles/blob/master/vim/config/settings.vim
" Reload file without prompting if it has changed on disk.
" Will still prompt if there is unsaved text in the buffer.
set autoread
" MacVim checks for autoread when it gains focus; terminal Vim
" must trigger checks. Do so when switching buffers, or after
" 2 secs (the value of updatetime) of pressing nothing.
set updatetime=2000
au WinEnter,BufWinEnter,CursorHold * checktime
set autowrite

" dont include included files when completing
set complete-=i
set complete-=t
set whichwrap+=<,>,[,]


" ----------- commands/mappings ----------------------------------------------

" Quicker filetype setting:
"   :F html
" instead of
"   :set ft=html
" Can tab-complete filetype.
command! -nargs=1 -complete=filetype F set filetype=<args>

command! W :w
noremap S :w<cr>
nnoremap <cr> :noh<cr>
cabbrev w!! w !sudo tee % > /dev/null<CR>:e!<CR><CR>

" bind control-l to hashrocket
imap <C-l> <Space>=><Space>"

" Duplicate a selection
vmap D y'>p

" No Help, please
noremap <F1> <Esc>

" Use "very magic" regular expressions when seaching
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" no n00b!!!!!!!!!!!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" make move up/down behave as one expects
nnoremap j gj
nnoremap k gk

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Buffer switching
map <F4> :ls<CR>:b<space>

" In visual mode, indent and keep selection
vmap > >gv
vmap < <gv

" Tab mappings.
noremap <S-Left> :tabp<CR>
noremap <S-Right> :tabn<CR>

" Always show tab bar
" set showtabline=2

" Split screen things
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Create a split on the given side. (from http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want)
nmap <leader><left>   :leftabove  vnew<CR>
nmap <leader><right>  :rightbelow vnew<CR>
nmap <leader><up>     :leftabove  new<CR>
nmap <leader><down>   :rightbelow new<CR>

" Edit shortcuts (from http://vimcasts.org/episodes/the-edit-command)
nnoremap <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Buffer navigation
noremap <D-[> :bprev<cr>
noremap <D-]> :bnext<return>

" Command T configuration
" let g:CommandTMaxHeight=20
" noremap <leader>t :CommandT<cr>
" noremap <leader>T :CommandTFlush<cr>\|:CommandT<cr>
noremap <leader>t :CtrlP<CR>
noremap <leader>T :CtrlPBuffer<CR>

" Ctrl-P
" let g:ctrlp_match_window_bottom = 0
" let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 30
let g:ctrlp_show_hidden = 0
let g:ctrlp_max_files = 0

cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Controversial...swap colon and semicolon for easier commands
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" command to strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" I use Ack a lot (described below), so I mapped a leader key for it:
nnoremap <leader>a :Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" I have a ,v mapping to reselect the text that was just pasted so I can
" perform commands (like indentation) on it:
nnoremap <leader>v V`]

" Yank to OS X pasteboard.
noremap <leader>y "*y

" Paste from OS X pasteboard without messing up indent.
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>:put! *<CR>:set nopaste<CR>

" Close a buffer without closing the split
noremap <leader>d <Esc>:call CleanClose(1)<CR>

" map ,, to run tests in current file
nnoremap ,, :w \| !ruby -Itest %<cr>

" --------- commands ---------------------------------------------------------

function! CleanClose(tosave)
  if (a:tosave == 1)
      w!
  endif
  let todelbufNr = bufnr("%")
  let newbufNr = bufnr("#")
  if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
      exe "b".newbufNr
  else
      bnext
  endif

  if (bufnr("%") == todelbufNr)
      new
  endif
  exe "bd".todelbufNr
endfunction

let g:gitgrepprg="git\\ grep\\ -En"

function! s:GitGrep(cmd, args)
  let grepprg_bak=&grepprg
  exec "set grepprg=" . g:gitgrepprg

  let l:grepargs = a:args
  " Escape pipes in e.g. :GitGrep "foo|bar"
  let l:grepargs = escape(l:grepargs, '|')
  " Escape again if piped argument is unquoted, e.g. :GitGrep foo|bar
  if l:grepargs =~ '\(^\|\s\)[^"'']\S*|'
    let l:grepargs = escape(l:grepargs, '|')
  endif

  silent execute a:cmd . " " . l:grepargs

  if a:cmd =~# '^l'
    topleft lopen
  else
    topleft copen
  endif

  let &grepprg=grepprg_bak
  exec "redraw!"
endfunction

command! -nargs=* -complete=file GitGrep call s:GitGrep('grep<bang>', <q-args>)
command! -nargs=* -complete=file GitGrepAdd call s:GitGrep('grepadd<bang>', <q-args>)
command! -nargs=* -complete=file LGitGrep call s:GitGrep('lgrep<bang>', <q-args>)
command! -nargs=* -complete=file LGitGrepAdd call s:GitGrep('lgrepadd<bang>', <q-args>)


" ------ auto commmands ------------------------------------------------------

if has("autocmd")

  " Automatic fold settings for specific files. Uncomment to use.
  " autocmd FileType ruby setlocal foldmethod=syntax
  " autocmd FileType css  setlocal foldmethod=indent

  " make and python use real tabs
  au FileType make    set noexpandtab
  au FileType python  set noexpandtab

  " These files are also Ruby.
  au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,Vagrantfile,Guardfile,config.ru} set ft=ruby

  " These files are also Markdown.
  au BufRead,BufNewFile *.{md,mdown,mkd,mkdn} set ft=markdown

  " <Leader>r or <D-r> to run CoffeeScript.
  au FileType coffee map <buffer> <Leader>r :CoffeeRun<CR>
  au FileType coffee map <buffer> <D-r> :CoffeeRun<CR>

  " <Leader>R or <D-R> to see CoffeeScript compiled.
  au FileType coffee map <buffer> <Leader>R :CoffeeCompile<CR>
  au FileType coffee map <buffer> <D-R> :CoffeeCompile<CR>

  " Unbreak 'crontab -e' with Vim: http://drawohara.com/post/6344279/crontab-temp-file-must-be-edited-in-place
  au FileType crontab set nobackup nowritebackup

  " Close help windows with just q.
  au FileType HELP map <buffer> q :q<CR>

  autocmd BufLeave,FocusLost * silent! wall

  " Remember last location in file, but not for commit messages.
  au BufReadPost * if &filetype !~ 'commit\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  " 'Edit anyway' if swap file exists.
  au SwapExists * let v:swapchoice = 'e'
endif
