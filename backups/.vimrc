"~/.vimrc


"===================== General Settings =====================
set encoding=utf-8                              " encoding
set number                                      " set line number
set nocompatible                                " no vi compat
filetype plugin indent on                       " filetype func off
set rtp+=~/.vim/bundle/Vundle.vim               " initialize vundle
set rtp+=~/.fzf                                 " add fzf to env path
set tags=tags,~/.tags                           " ask vim to pick tag generated by ctags

"===================== Other 

set clipboard=unnamedplus                       " this supports only vim-gnome not vim or vim-tiny
filetype plugin indent on                       " filetype func on
" execute python code usin F9
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>   

"========================== Plugins ===========================
call vundle#begin()                             " start- all plugins below

"------------------------ Basic Plugins -----------------------

Plugin 'VundleVim/Vundle.vim'                   " Plugin Manager
Plugin 'morhetz/gruvbox'                        " Color Scheme
Plugin 'itchyny/lightline.vim'                  " Botton Status Bar
Plugin 'itchyny/vim-gitbranch'                  " lightline uses it
Plugin 'mhinz/vim-signify'                      " VCS - git, svn diff 
Plugin 'scrooloose/nerdtree.git'                " CLI File Manager 
Plugin 'editorconfig/editorconfig-vim'          " Editor properties
Plugin 'tpope/vim-abolish'                      " Easily search for, substitute, and abbreviate multiple variants of a word
Plugin 'justinmk/vim-gtfo'                      " GOTO PWD via file Manager or Terminal;  Usage: got; gof; goT; goF
"Plugin 'shime/vim-livedown'                    " markdown live preview in mini server browser
Plugin 'suan/vim-instant-markdown'              " markdown live preview in mini server browser
"Plugin 'ctrlpvim/ctrlp.vim'                    "super search
Plugin 'junegunn/fzf'                           " fuzzy finder
Plugin 'junegunn/fzf.vim'                       " fuzzy finder
"Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'mileszs/ack.vim'                        " Ack - search patterns; need: sudo apt-get install ack-grep
Plugin 'rking/ag.vim'                           " (Depricated) Ag - Ack alternative; need: sudo apt install silversearcher-ag
Plugin 'google/vim-searchindex'                 " Search index/number

"------------------------ Prog utils ---------------------------

Plugin 'Valloric/YouCompleteMe'                 " Auto completion engine
"Plugin 'davidhalter/jedi-vim'                  " Auto completion engine for python only
Plugin 'toransahu/vim-template'                 " Template System
"Plugin 'aperezdc/vim-template'
"Plugin 'vim-syntastic/syntastic'               " Syntax Checking
"Plugin 'google/yapf', { 'rtp': 'plugins/vim' }
"Plugin 'ambv/black'
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'google/vim-codefmt'
Plugin 'w0rp/ale'                               " Asynchronous Linting Enging - ALE
Plugin 'SirVer/ultisnips'                       " Snippet Engine
Plugin 'honza/vim-snippets'                     " Snippet files - Snippets are separated from the engine
Plugin 'heavenshell/vim-pydocstring'            " Python docstring gen
Plugin 'scrooloose/nerdcommenter'               " for easy comments
Plugin 'tpope/vim-fugitive'                     " git commands in VIM
Plugin 'tpope/vim-surround'                     " surround text with something manually
Plugin 'raimondi/delimitmate'                   " auto close
"Plugin 'tmhedberg/SimpylFold'                  " code fold
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }       " go support; https://github.com/fatih/vim-go-tutorial
Plugin 'janko-m/vim-test'                       " polyglot test runner

call vundle#end()                               " stop - all plugins above


"============= Plugin Configs

" highlight search patterns
set hlsearch

" set color
colorscheme gruvbox
set background=dark
set colorcolumn=80

" lightline fix
set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>

" Customize the settings for vim-template plugin
let g:email = "toran.sahu@yahoo.com"
let g:user = "Toran Sahu"

" nerd commenter setting
filetype plugin on


" vim-jedi (disable)
let g:jedi#completions_enabled = 1

" YCM Config
nnoremap <F5> :YcmCompleter GoToDefinition<CR>
nnoremap <F6> :YcmCompleter GoToReferences<CR>
nnoremap <F7> :YcmCompleter GoToDeclaration<CR>

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_strings = 1 " Completion in string

" mimic intellij
nnoremap <C-b> :YcmCompleter GoToDefinition<CR>
:nnoremap <C-A-Left> <C-o>
:nnoremap <C-A-Right> <C-i>

" Syntastic configs
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0 " dont run on open
"let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = { 'mode': 'passive' }

"" linters
"let g:syntastic_python_checkers = ['pylint', 'flake8', 'yapf']
""let g:syntastic_python_checkers = ['black']
""let g:syntastic_python_checkers = []

"" yapf linter
"map <C-Y> :call yapf#YAPF()<cr>
"imap <C-Y> <c-o>:call yapf#YAPF()<cr>


" Vim AutoFormat
"let g:formatterpath = ['~/black']

" ALE COnfig
"Check Python files with flake8 and others
" for docstring lints: pip install flake8-docstrings
let g:ale_linters = {'python': ['flake8', ]}
"let g:ale_linters = {'python': ['flake8','mypy']}
"let g:ale_linters = {'python': ['flake8','pylint']}

" Fix Python files with black and others
let g:ale_fixers = {'python': ['black', 'isort']}

" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 0
let g:ale_python_black_options = '--line-length 120'
let g:ale_python_flake8_options = '--max-line-length 120'

" Virtualenv/pipenv related
"let g:ale_python_auto_pipenv = 1
"let g:ale_python_flake8_auto_pipenv = 1
"let g:ale_python_flake8_executable = $VIRTUAL_ENV . '/bin/flake8'

"let g:ale_python_black_executable = $VIRTUAL_ENV . '/bin/black'
"let g:ale_python_pylint_options = '--load-plugins pylint_django'



"================vim-go config============
let g:go_template_autocreate = 0


"================vim-run <F4>=============== 
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype java nnoremap <Leader>c :w <CR>:!javac % :r&& java %:r<CR>
autocmd filetype php nnoremap <Leader>c :w <CR>:!clear && php  %<CR>
autocmd filetype go nnoremap <F4> :GoRun <CR>

"===============untisnip configs
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"autocmd BufWritePre *.py execute ':Black'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"eclim configs for java and other langs using eclipse
let g:EclimCompletionMethod = 'omnifunc'

"" vim-livedown configs
"" should markdown preview get shown automatically upon opening markdown buffer
"let g:livedown_autorun = 1

"" should the browser window pop-up upon previewing
"let g:livedown_open = 1

"" the port on which Livedown server will run
"let g:livedown_port = 1337

"" the browser to use
"let g:livedown_browser = "firefox"

"python with virtualenv support
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
  "project_base_dir = os.environ['VIRTUAL_ENV']
  "activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  "exec(open(activate_this).read(), dict(__file__=activate_this))
"EOF

"" vim fugative config
"set statusline+=%{FugitiveStatusline()}
" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
" diffget & diffput are vim commands
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Tabs keybinding

map <C-t><C-n> :tabnew<cr>
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" Ag config (alongwith Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vim-test
let g:test#runner_commands = ['Django', 'Nose', 'Nose2', 'PyTest', 'PyUnit', 'Maven', 'Gradle']

let test#java#runner = 'maventest'
let test#java#maventest#options = {
  \ 'nearest': '--fail-fast',
  \ 'file':    '--fail-fast', 
  \ 'suite':   '--fail-fast',
\}

"let test#python#runner = 'pytest'
let test#python#djangotest#options = {
  \ 'nearest': '--failfast --keepdb',
  \ 'file':    '--failfast --keepdb',
  \ 'suite':   '--failfast --keepdb',
\}

let test#vim#term_position = "belowright"

" FZF configs
map <C-f><C-f> :Files<cr>
map <C-f><C-l> :Line<cr>
map <C-f><C-r> :Rg<cr>
map <Space><Space> :Files<cr>
map <C-f> :Rg<cr>

" ctag configs
"Ctrl+] - go to definition
"Ctrl+T - Jump back from the definition.
"Ctrl+W Ctrl+] - Open the definition in a horizontal split

"Ctrl+\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"Alt+] - Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR> 

"============= TODO
"- try google/vim-codefmt [x]
"- status for vim-signify
"- colorize
"- try int3/vim-extradite - browse git commits
