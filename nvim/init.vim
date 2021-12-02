" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" @author: Edinson E. Padrón Urdaneta
" @email: edinson.padron at posteo dot net
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" General options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Enable file type detection
filetype plugin indent on

" Enable colour syntax highlighting
syntax enable

" Set the shell to be used
set shell=/bin/bash

" Change the current working directory to the one containing the file which
" was opened or selected
set autochdir

" Filenames for the tag command
set tags=./tags;$HOME,./ctags;$HOME,./.vimtags;$HOME

" Do not wrap lines longer than the window's width
set nowrap

" Set how many character to scroll sidewise
set sidescroll=1

" Move to the previous/next line when press at the beginning/end of one
set whichwrap=h,l

" Disable the use of the mouse
set mouse=

" Redraw only when we need to
set lazyredraw

" Set the leader key
let mapleader = ','
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" vim-plug settings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Post-update/-install hooks +++++++++++++++++++++++++++++++++++++++++++++++++
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction
" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" System path for the plugins managed by vim-plug
call plug#begin('$HOME/.config/nvim/plugged')

" Bundles ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-rooter', {'on': 'Rooter'}
Plug 'altercation/vim-colors-solarized'
Plug 'andymass/vim-matchup'
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java', 'aspectj']}
Plug 'blankname/vim-fish/', {'for': 'fish'}
Plug 'cohama/lexima.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'euclio/vim-markdown-composer', { 'for': 'markdown', 'do': function('BuildComposer') }
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim', {'for': ['css', 'html', 'jsp', 'xml', 'xslt', 'javascript.jsx']}
Plug 'mxw/vim-jsx', {'for': 'javascript.jsx'}
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'tpope/vim-git', {'for': ['git', 'gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail']}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/dbext.vim', {'for': ['sql']}
Plug 'vim-scripts/restore_view.vim'

" All of your plugins must be added before the following line ++++++++++++++++
call plug#end()
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Buffer options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Edit multiple unsaved files at the same time
set hidden

" Prompt to save unsaved changes when exiting
set confirm

" Keep various histories between edits
set viminfo=%,'25,f1,<300,:100,/100,h
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Swap file options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set directory=$HOME/.config/nvim/vimswap/
set swapfile
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Backup file options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set backupdir=$HOME/.config/nvim/vimbackup/
set backupcopy=auto
set backup
set writebackup
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" History file options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set undodir=$HOME/.config/nvim/vimundo/
set undofile
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Search option ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Highlight searches
set hlsearch

" Do case insensitive matching...
set ignorecase

" ...except when using capital letters
set smartcase

" Incremental search
set incsearch

" Turn off search highlight
nnoremap <Leader><Space> :nohlsearch<CR>
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Insert options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Better handling of backspace key
set backspace=indent,eol,start

" Sane indenting when filetype not recognised
set autoindent

" Emulate typical editor navigation behaviour
set nostartofline
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Status / command line options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Better command line completion
set wildmenu

" Expand match on first Tab complete
set wildmode=longest:full,full

" Show (partial) command in status line
set showcmd

" Always show a status line
set laststatus=2

" Prevent 'Press Enter' messages
set cmdheight=1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Interface options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Display line numbers at the left of the screen
set number

" Show the line number relative to the line with the cursor
set relativenumber
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Indentation options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set smarttab
set expandtab
set tabstop=8
set shiftwidth=2
set softtabstop=2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Highlighting options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Set the background color brightness
set background=light

" Color scheme
colorscheme solarized

" Highlight the screen line of the cursor
set cursorline

" Indicate the limit of the recommended text width
set colorcolumn=+1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Spell options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Enable spell checking
set spell

" Set the language to use for spell checking
set spelllang=en,es
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Maps ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy
map Y y$

" Do not loose the current selection when shift indentation
vnoremap > >gv
vnoremap <lt> <lt>gv

" Move vertically by visual line
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Move through buffers
nnoremap <M-Left> :bp<CR>
nnoremap <M-Right> :bn<CR>

" Return to normal mode inside :term
tnoremap <Esc> <C-\><C-n>
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Auto commands options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" autocmd group for the following ':autocmd' commands
augroup init.vim

" Clear this group to prevent accidental double-loading
autocmd!


" Fish +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd! BufRead,BufNewFile *.aj setfiletype java


" Fish +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType fish compiler fish
autocmd FileType fish setlocal foldmethod=expr nospell textwidth=99


" Java +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal softtabstop=2 shiftwidth=2 textwidth=99


" Javascript +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType javascript setlocal foldenable foldmethod=indent textwidth=99


" Javascript.jsx +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType javascript.jsx let g:emmet_html5 = 0
autocmd FileType javascript.jsx setlocal foldenable foldmethod=indent
autocmd FileType javascript.jsx setlocal textwidth=99


" Kotlin +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType kotlin setlocal foldenable foldmethod=indent
autocmd FileType kotlin setlocal softtabstop=2 shiftwidth=2 textwidth=99


" Python +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd FileType python setlocal textwidth=99

" Delete spaces at the end of each line
autocmd FileType python normal m`:%s/\s\+$//e ``


" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Go back to the default autocmd group
augroup end
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Bundle options ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Airline ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

" Integrate with powerline fonts
let g:airline_powerline_fonts = 1


" CtrlP ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Open the new tab page after the last one
let g:ctrlp_tabpage_position = 'al'

" Create a new file in a new tab
let g:ctrlp_open_new_file = 't'

" Root markers in addition to the default ones
let g:ctrlp_root_markers = ['.idea']

" Enable lazy update
let g:ctrlp_lazy_update = 1

" Enable some ctrlp extensions
let g:ctrlp_extensions = ['buffertag', 'tag']

" Indicate the ctags arguments for some filetypes
let g:ctrlp_buftag_types = {
\ 'python': '--python-kinds=-i',
\}

let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/](tmp|dist|bower_components|node_modules|build|gradle)$',
\}


" JavaComplete +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:JavaComplete_GradleExecutable = (
\ '$HOME/.sdkman/candidates/gradle/current/bin/gradle'
\)

let g:JavaComplete_ServerAutoShutdownTime = 180

let g:JavaComplete_ImportSortType = 'packageName'

let g:JavaComplete_UsePython3 = 1


" Mundo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:mundo_right = 1
let g:mundo_width = 40

nnoremap <Leader>u :MundoToggle<CR>


" NERDCommenter ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Avoid <Leader>cc behaving like <Leader>cn
let g:NERDDefaultNesting = 0

" Disable the menu
let g:NERDMenuMode = 0

" Add spaces around the commented text
let g:NERDSpaceDelims = 1

" Remove any space found in empty (un)commented lines if there is any
let g:NERDTrimTrailingWhitespace = 1


" NERDTree +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Toggle NERDTree's window visualization
nnoremap <C-n> :NERDTreeToggle<CR>

" Show NERDTree's window at the rigth side of the screen
let g:NERDTreeWinPos = 'right'

" Set the window's size
let g:NERDTreeWinSize = 40


" PythonMode +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:pymode_indent=1
let g:pymode_rope=0
let g:pymode_lint_ignore='E116,E712,E731,E711,E121,C901'
let g:pymode_lint_unmodified=1


" Restore view options +++++++++++++++++++++++++++++++++++++++++++++++++++++++
set viewoptions=cursor,folds,slash,unix
set viewdir=$HOME/.config/nvim/vimview/


" Solarized ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:solarized_contrast = 'normal'
let g:solarized_hitrail = 1


" The Silver Searcher ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " Disable per-session caching
  let g:ctrlp_use_caching = 0
endif


" UltiSnips ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:UltiSnipsExpandTrigger='<Leader>x'
let g:UltiSnipsJumpForwardTrigger='<Leader>f'
let g:UltiSnipsJumpBackwardTrigger='<Leader>b'


" vim-markdown-composer ++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Don't start the server when a markdown file is opened
let g:markdown_composer_autostart = 0

" Syntax highlight theme
let g:markdown_composer_syntax_theme = 'idea'


" vim-root +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Don't change the current working directory automatically
let g:rooter_manual_only = 1

" When enable, behave similarly to autochdir for non-project files
let g:rooter_change_directory_for_non_project_files = 'current'

nnoremap <Leader>cd :Rooter<CR>
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" vim: nospell
