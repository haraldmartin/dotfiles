" This is Martin Stroms .vimrc file with lots of inpiriation from:
" github.com/henrik/dotfiles
" github.com/garybernhardt/dotfiles
" stevelosh.com/blog/2010/09/coming-home-to-vim
" github.com/junegunn/dotfiles

set nocompatible                      " Must come first because it changes other options.


" ----------- plugins --------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Appearance
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
  autocmd! User indentLine doautocmd indentLine Syntax
  let g:indentLine_color_term = 239
  let g:indentLine_color_gui = '#616161'

" Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline#extensions#tabline#enabled = 1

" Colors
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
" Plug 'yuttie/hydrangea-vim'
" Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'AlessandroYorba/Despacio'
Plug 'cocopon/iceberg.vim'
Plug 'w0ng/vim-hybrid'
Plug 'nightsense/snow'
" Plug 'nightsense/stellarized'
Plug 'arcticicestudio/nord-vim'
" Plug 'nightsense/cosmic_latte'
Plug 'haishanh/night-owl.vim'
Plug 'drewtempelmeyer/palenight.vim'

" File + buffer management
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  augroup nerd_loader
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd BufEnter,BufNew *
          \  if isdirectory(expand('<amatch>'))
          \|   call plug#load('nerdtree')
          \|   execute 'autocmd! nerd_loader'
          \| endif
  augroup END

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
set rtp+=/usr/local/bin/fzf

Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'down': '70%' }

" Plug 'ap/vim-buftabline'

" Formatting
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/rainbow_parentheses.vim'
autocmd VimEnter * RainbowParentheses

Plug 'haraldmartin/vim-filetype-formatter'
Plug 'cohama/lexima.vim'

" Navigating
Plug 'tpope/vim-surround'
Plug 'vim-scripts/camelcasemotion'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/tComment'

" Git
Plug 'tpope/vim-fugitive'
  nmap     <Leader>g :Gstatus<CR>gg<c-n>
  nnoremap <Leader>d :Gdiff<CR>
Plug 'rhysd/git-messenger.vim'
Plug 'junegunn/gv.vim' " A git commit browser.
Plug 'mhinz/vim-signify'
  let g:signify_vcs_list = ['git']

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Searching
" Plug 'junegunn/vim-slash'

" Languages
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
  let g:closetag_filenames = '*.js'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'othree/html5-syntax.vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tweekmonster/django-plus.vim'

" Multi
Plug 'tpope/vim-dispatch'

" Initialize plugin system
call plug#end()


let mapleader = ","


" ----- settings --------------------------------------------------------------

set encoding=utf-8
set mouse=a

set number

syntax on
set background=dark
" let g:seoul256_background = 233
" colo seoul256
" colo palenight
colo iceberg

set guifont=Source\ Code\ Pro:h14

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
set clipboard^=unnamed,unnamedplus    " Share clipboard with OS X

" Searching
set gdefault
set hlsearch incsearch                " Highlight matches + as you type
set ignorecase smartcase              " Case-insensitive searching unless expression contains capital letter

set wildmenu                          " Enhanced command line completion.
" set wildmode=list:longest           " Complete files like a shell.
set wildmode=longest,list:longest     " https://robots.thoughtbot.com/vim-you-complete-me


set wildignore+=tmp/*,*/tmp/*,*/tmp/**/*,*.jpg,*.gif,*.tif,*.png,node_modules,*.js.map,*.mp3,*.swf,*.woff,node_modules,bower_components,frontend_bundle,*.pyc,staticfiles
set shell=bash

set nowrap                            " Turn on line wrapping.
set showbreak=↪
set scrolloff=3                       " Show 3 lines of context around the cursor.
set visualbell                        " No beeping.

" Backup files
set backupdir=~/.vim-backup
set directory=~/.vim-backup

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
" imap <C-l> <Space>=><Space>"

" Duplicate a selection
vmap D y'>p

" No Help, please
noremap <F1> <Esc>

" Use "very magic" regular expressions when seaching
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Create a split on the given side. (from http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want)
nnoremap <leader><left>   :leftabove  vnew<CR>
nnoremap <leader><right>  :rightbelow vnew<CR>
nnoremap <leader><up>     :leftabove  new<CR>
nnoremap <leader><down>   :rightbelow new<CR>

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
" map <F4> :ls<CR>:b<space>

" In visual mode, indent and keep selection
vmap > >gv
vmap < <gv

" Tab mappings.
noremap <C-Left> :tabp<CR>
noremap <C-Right> :tabn<CR>

" Always show tab bar
" set showtabline=2

" Split screen things
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Edit shortcuts (from http://vimcasts.org/episodes/the-edit-command)
nnoremap <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Buffer navigation
noremap <D-[> :bprev<cr>
noremap <D-]> :bnext<return>

" FZF.vim mappings
" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>F :Files<CR>
nnoremap <C-P> :GFiles <CR>

nnoremap <Leader>B :Buffers<CR>
nnoremap <Leader>h :History<CR>

nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>L :Lines<CR>
nnoremap <Leader>' :Marks<CR>

nnoremap <Leader>/ :Rg<Space>

cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Controversial...swap colon and semicolon for easier commands
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" command to strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" I use Ack a lot (described below), so I mapped a leader key for it:
" nnoremap <leader>a :Ack
" let g:ackprg = 'ag --nogroup --nocolor --column'

" I have a ,v mapping to reselect the text that was just pasted so I can
" perform commands (like indentation) on it:
nnoremap <leader>v V`]

" Yank to OS X pasteboard.
noremap <leader>y "*y

" Paste from OS X pasteboard without messing up indent.
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>:put! *<CR>:set nopaste<CR>

" Close a buffer without closing the split
" command Bd bp\|bd \#
" noremap <leader>d :Bd <CR>

noremap <leader>d <Esc>:call CleanClose(1) <CR>

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

" nmap ,, :w \| !ruby -Itest %<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %


" File formatting settings
" nnoremap <leader>f :FiletypeFormat<cr>
" vnoremap <leader>f :FiletypeFormat<cr>

autocmd BufWritePre *.py FiletypeFormat
autocmd BufWritePre *.js FiletypeFormat
autocmd BufWritePre *.jsx FiletypeFormat
autocmd BufWritePre *.css FiletypeFormat
autocmd BufWritePre *.scss FiletypeFormat

" -------= plugin ssettings ------------------------

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ------ auto commmands ------------------------------------------------------

if has("autocmd")

  " Automatic fold settings for specific files. Uncomment to use.
  " autocmd FileType ruby setlocal foldmethod=syntax
  " autocmd FileType css  setlocal foldmethod=indent

  " make and python use real tabs
  au FileType make    set noexpandtab
  " au FileType python  set noexpandtab

  " These files are also Ruby.
  au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,Vagrantfile,Guardfile,config.ru} set ft=ruby

  " These files are also Markdown.
  au BufRead,BufNewFile *.{md,mdown,mkd,mkdn} set ft=markdown

  " <Leader>r or <D-r> to run CoffeeScript.
  " au FileType coffee map <buffer> <Leader>r :CoffeeRun<CR>
  " au FileType coffee map <buffer> <D-r> :CoffeeRun<CR>

  " <Leader>R or <D-R> to see CoffeeScript compiled.
  " au FileType coffee map <buffer> <Leader>R :CoffeeCompile<CR>
  " au FileType coffee map <buffer> <D-R> :CoffeeCompile<CR>

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
