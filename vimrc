" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

filetype off
filetype plugin indent on

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                      " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set showmatch

nnoremap <leader><space> :noh<cr>
nnoremap <leader>c :noh<cr>

" bind control-l to hashrocket
imap <C-l> <Space>=><Space>"


" Some options from
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#making-vim-more-useful
set encoding=utf-8
set autoindent
set cursorline
set modelines=0
set ttyfast
" set relativenumber

set nowrap                        " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

" Folding settings
set foldmethod=indent
set foldlevel=1
set foldnestmax=2


" Move lines up and down
" noremap <C-J> :m +1 <CR>
" noremap <C-K> :m -2 <CR>


" Duplicate a selection
" Visual mode: D
vmap D y'>p

" No Help, please
noremap <F1> <Esc>

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
" set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=2 softtabstop=2 shiftwidth=2 
set expandtab

set laststatus=2                 " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Or use vividchalk
" colorscheme topfunky-light
colorscheme railscasts
" colorscheme railscasts

let mapleader = ","

" Moving
nnoremap / /\v
vnoremap / /\v

" "makes j and k work the way you expect instead of working in some archaic 
" “movement by file line instead of screen line” fashion."

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <leader><cr> o<esc>

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Searching
set gdefault

map <F4> :ls<CR>:buffer<space>

" In visual mode, indent and keep selection
vmap > >gv
vmap < <gv


" Move selection up/down (add =gv to reindent after move)
vmap <D-S-Up> :m-2<CR>gv
vmap <D-S-Down> :m'>+<CR>gv

" Tab mappings.
noremap <leader>tt :tabnew<cr>
noremap <leader>te :tabedit
noremap <leader>tc :tabclose<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tn :tabnext<cr>
noremap <leader>tp :tabprevious<cr>
noremap <leader>tf :tabfirst<cr>
noremap <leader>tl :tablast<cr>
noremap <leader>tm :tabmove

" F2 toggles folding
inoremap <F2> <C-O>za
nnoremap <F2> za
onoremap <F2> <C-C>za
vnoremap <F2> zf

" Nerdtree (,n)
map <leader>n :NERDTreeToggle<CR>

" Split screen things
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Edit shortcuts
" http://vimcasts.org/episodes/the-edit-command/
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>


" Buffer navigation
" noremap <leader>t :CommandT<Return>
noremap <leader>t :CommandT<Return>
noremap <Leader>a :bprev<Return>
noremap <Leader>s :bnext<Return>
" noremap <Leader>d :bd<Return>
" noremap <Leader>f :b<Return>

" Controversial...swap colon and semicolon for easier commands
nnoremap ; :
vnoremap ; :

" Rails Edit routes
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb
noremap <leader>rm :Rmodel 
noremap <leader>rc :Rcontroller 
noremap <leader>rv :Rview 

" Automatic fold settings for specific files. Uncomment to use.
autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" http://vimcasts.org/episodes/running-vim-within-irb/
" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" augroup md
"   autocmd BufRead *.md set ai formatoptions=tcroqn comments=n:&gt;
" augroup END

" Misc
map <Leader>u <Plug>MakeGreen
noremap <leader>cc Ypkgccj

" command to strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" I use Ack a lot (described below), so I mapped a leader key for it:
nnoremap <leader>f :Ack 

"  work with HTML often, so I have ,ft mapped to a “fold tag” function:
nnoremap <leader>ft Vatzfuu

" This next mapping imitates TextMates Ctrl+Q function to re-hardwrap 
nnoremap <leader>q gqip

" I have a ,v mapping to reselect the text that was just pasted so I can 
" perform commands (like indentation) on it:
nnoremap <leader>v V`]

" quickly open up my ~/.vimrc file in a vertically split window so I can add new things to it on the fly.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

command! LargeFont :set guifont=Menlo:h18
command! SmallFont :set guifont=Menlo:h11

if &t_Co > 2 || has("gui_runing")
  " enable syntax highlighting
  syntax on
endif

" map fc <Esc>:call CleanClose(1)<cr>
" map fq <Esc>:call CleanClose(0)
" noremap <Leader>d :bd<Return>
noremap <Leader>d <Esc>:call CleanClose(1)<CR>

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

