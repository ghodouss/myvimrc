"" Install Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins-----------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'sjl/badwolf'
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-java'
Plug 'neoclide/coc-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'preservim/vimux'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" All of your Plugins must be added before the following line
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" CocVimConfig ----------------------------------
runtime custom/coc.vim 

" UI Config ----------------------------------------------------
colorscheme solarized8_high
set background=light
set number" show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set laststatus=2
set statusline+=%F

" Syntax ----------------------------------------------
syntax enable           " enable syntax processing

" Vim Working Dir -------------------------------------------------
set autochdir   " Sets vim dir to file's directory

" Tabzz -------------------------------------------------
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set expandtab       " tabs are spaces

autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType h setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sql setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType java setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scala setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType feature setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Backspace --------------------------------------------
set backspace=indent,eol,start

" Optimizations ----------------------------------------
set lazyredraw          " redraw only when we need to

" Search ---------------------------------------------------
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>


" Folding ----------------------------------------
set foldenable          " enable folding
set foldlevelstart=5   " open most folds by default
nnoremap <space> za  
set foldmethod=indent   " fold based on indent level 


" Movement --------------------------------------


" Mappings -------------------------------------
let mapleader=","       " leader is comma

" jk is escape
inoremap jk <esc>

" File Specific Settings ---------------------------------------
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

" Backups ------------------------------------
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Ale Config -------------------------------------
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_python_auto_pipenv = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_python_flake8_use_global = 0
let g:ale_linters = {'python': ['pylint', 'mypy']}

" Jedi Vim Config ----------------------------------------------------
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#documentation_command = "K"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#usages_command = "<leader>a"
let g:SuperTabDefaultCompletionType = "context"
let g:syntastic_enable_highlighting = 0


" Copy/Paste maps --------------------------------------------------------
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" File Search Maps --------------------------------------------------------
nnoremap <C-g> :Files<CR>
nnoremap <C-f> :GitFiles<CR>
nnoremap <Leader>h :Buffers<CR>

" Vimux config--------------------------------------------------------
let g:VimuxOrientation = "v"
map <Leader>vv :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

" Airline config--------------------------------------------------------
let g:airline_theme='badwolf'


let g:tmux_navigator_no_mappings = 1
noremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>
noremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set number 
    autocmd WinLeave * set nonumber 
augroup END
