" This is Martin Stroms .vimrc file with lots of inpiriation from:
" github.com/henrik/dotfiles
" github.com/garybernhardt/dotfiles
" stevelosh.com/blog/2010/09/coming-home-to-vim
" github.com/junegunn/dotfiles

set nocompatible                      " Must come first because it changes other options.

" so custom key mapping in plugins section work
let mapleader = ","



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
  " let g:airline#extensions#tabline#enabled = 1
Plug 'szw/vim-maximizer'
  nnoremap <silent> <Leader>m :MaximizerToggle<CR>

" Colors
Plug 'ackyshake/Spacegray.vim'
  let g:spacegray_use_italics = 1
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'haishanh/night-owl.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'saltdotac/citylights.vim'
Plug 'junegunn/seoul256.vim'
  let g:seoul256_background = 233
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'


" File + buffer management
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  set rtp+=/usr/local/bin/fzf
Plug 'junegunn/fzf.vim'
  let g:fzf_layout = { 'down': '70%' }

" Formatting
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/rainbow_parentheses.vim'
  autocmd VimEnter * RainbowParentheses

Plug 'dense-analysis/ale'
  let g:ale_fixers = {
  \   'javascript': ['prettier', 'eslint'],
  \   'javascriptreact': ['prettier', 'eslint'],
  \   'typescript': ['prettier', 'eslint'],
  \   'typescriptreact': ['prettier', 'eslint'],
  \   'python': ['black', 'isort'],
  \   'css': ['prettier', 'stylelint'],
  \   'scss': ['prettier', 'stylelint']
  \}

  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'javascriptreact': ['eslint'],
  \   'typescript': ['eslint', 'tsserver'],
  \   'typescriptreact': ['eslint', 'tsserver'],
  \   'python': ['flake8']
  \}

  "   'python': ['flake8']
  " 'python': ['pylint']

  let g:ale_completion_enabled = 1
  let g:ale_fix_on_save = 1
  let g:ale_linters_explicit = 1 " tell ALE to run only linters you've explicitly configured
  let g:ale_python_isort_options = '--profile black'
  let g:ale_python_pylint_options = '--load-plugins pylint_django '
        \'--disable=django-not-configured '
        \'--django-settings-module=allinsights.settings'

  " nmap <silent> <leader>an :ALENext<cr>
  " nmap <silent> <leader>ap :ALEPrevious<cr>

Plug 'Townk/vim-autoclose'

" Navigating
Plug 'tpope/vim-surround' " Change surrounding characters
" Plug 'vim-scripts/camelcasemotion' " Move between camelCase words
Plug 'tpope/vim-unimpaired' " [b and ]b to navigate buffers and more
Plug 'tpope/vim-endwise' " Auto insert end in ruby/elixir/djangohtml
Plug 'vim-scripts/tComment' " Toggle comments
Plug 'AndrewRadev/sideways.vim' " Move arguments left and right

" Git
Plug 'tpope/vim-fugitive'
  nmap     <Leader>g :Gstatus<CR>gg<c-n>
  nnoremap <Leader>d :Gdiff<CR>
Plug 'rhysd/git-messenger.vim' " Show git commit messages under cursor with leader gm
Plug 'junegunn/gv.vim' " A git commit browser.
Plug 'mhinz/vim-signify' " Show git diff in gutter
  let g:signify_vcs_list = ['git']
  
" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Searching
" Plug 'junegunn/vim-slash'

" Languages
Plug 'alvan/vim-closetag'
  let g:closetag_filenames = '*.js'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'othree/html5-syntax.vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tweekmonster/django-plus.vim'
" JavaScript + TypeScript
" (https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim)
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components'

" Run tests from vim
Plug 'vim-test/vim-test'

if has('nvim')
  Plug 'github/copilot.vim'
endif

" Plug 'puremourning/vimspector'
  let g:vimspector_enable_mappings = 'HUMAN'

"  -----------------------------------------------------------------------------------
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"   let g:coc_global_extensions = [
"     \ 'coc-tsserver'
"     \ ]

  " nnoremap <silent> K :call CocAction('doHover')<CR>
  "
  " function! ShowDocIfNoDiagnostic(timer_id)
  "   if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
  "     silent call CocActionAsync('doHover')
  "   endif
  " endfunction
  "
  " function! s:show_hover_doc()
  "   call timer_start(500, 'ShowDocIfNoDiagnostic')
  " endfunction
  "
  " autocmd CursorHoldI * :call <SID>show_hover_doc()
  " autocmd CursorHold * :call <SID>show_hover_doc()
  "
  " nmap <leader>do <Plug>(coc-codeaction)
  "
  " set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: There's always complete item selected by default, you may want to enable
  " no select by "suggest.noselect": true in your configuration file.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  " inoremap <silent><expr> <TAB>
  "       \ coc#pum#visible() ? coc#pum#next(1) :
  "       \ CheckBackspace() ? "\<Tab>" :
  "       \ coc#refresh()
  " inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  "
  " " Make <CR> to accept selected completion item or notify coc.nvim to format
  " " <C-g>u breaks current undo, please make your own choice.
  " inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
  "                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"  -----------------------------------------------------------------------------------

" Multi
Plug 'tpope/vim-dispatch'

" Plug 'aserebryakov/vim-todo-lists'
Plug 'ruanyl/vim-gh-line'
  let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '

Plug 'ranelpadon/python-copy-reference.vim'
  nnoremap <Leader>cp :PythonCopyReferenceDotted<CR>


" Initialize plugin system
call plug#end()


" ----- settings --------------------------------------------------------------

set encoding=utf-8
set mouse=a

set number

syntax on

if has('termguicolors')
  set termguicolors
endif

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
  set termguicolors
endif

set background=dark
" let g:seoul256_background = 233
" colo seoul256
" colo palenight
" colo iceberg
colo challenger_deep
let g:lightline = { 'colorscheme': 'challenger_deep'}


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
" set clipboard^=unnamed,unnamedplus    " Share clipboard with OS X
set colorcolumn=88

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

" switch tab with H (capital) and L
nnoremap H gT
nnoremap L gt

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
nnoremap <C-B> :Buffers <CR>

nnoremap <Leader>h :SidewaysLeft<cr>
nnoremap <Leader>l :SidewaysRight<cr>

nnoremap <Leader>B :Buffers<CR>
nnoremap <Leader>H :History<CR>

" nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>L :Lines<CR>
nnoremap <Leader>' :Marks<CR>

" nnoremap <leader>a :Ack<space>
nnoremap <Leader>/ :Rg<Space>
nnoremap <leader>a :Rg <c-r><c-w><cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Controversial...swap colon and semicolon for easier commands
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" NVIM sets Y to yank to end of line, but I prefer the old behavior
nnoremap Y yy

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

" function! MapTests()
  " nnoremap ,, :Dispatch ls /
" endfunction


" nmap ,, :w \| !ruby -Itest %<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %


" File formatting settings
" nnoremap <leader>f :FiletypeFormat<cr>
" vnoremap <leader>f :FiletypeFormat<cr>

" autocmd BufWritePre *.py Isort
" autocmd BufWritePre *.py FiletypeFormat
" autocmd BufWritePre *.js FiletypeFormat
" autocmd BufWritePre *.jsx FiletypeFormat
" autocmd BufWritePre *.css FiletypeFormat
" autocmd BufWritePre *.scss FiletypeFormat

autocmd BufWritePost *vimrc,*exrc :call feedkeys(":source %\<cr>")

" -------= plugin ssettings ------------------------

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nnoremap ,, :Dispatch fab test:backend,customers.tests
" nnoremap ,- :echo \:Dispatch fab test:backend,customers.tests

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
