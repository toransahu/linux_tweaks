"~/.vimrc

"========================= CONSTS ===========================
let MAX_LINE_COL=120


"===================== General Settings =====================
set encoding=utf-8                              " encoding
set number                                      " set line number
set nocompatible                                " no vi compat
filetype plugin indent on                       " filetype func off
set rtp+=~/.vim/bundle/Vundle.vim               " initialize vundle
set rtp+=~/.fzf                                 " add fzf to env path
set tags=tags,~/.tags                           " ask vim to pick tag generated by ctags
set title                                       " set filename in terminal window

" set nobackup
" set nowritebackup
" set noswapfile

"===================== Other 

set clipboard=unnamedplus                       " this supports only vim-gnome not vim or vim-tiny
filetype plugin indent on                       " filetype func on
" execute python code usin F9
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>   

" switch between tabs
nnoremap <C-Up> :tabprevious<CR>                                                                            
nnoremap <C-Down> :tabnext<CR>

" open every buffer in a new tab
" https://vim.fandom.com/wiki/Open_every_buffer_in_its_own_tabpage
" :au BufAdd,BufNewFile,BufRead * nested tab sball
" :au BufRead * nested tab sball

"========================== Plugins ===========================
call vundle#begin()                             " start- all plugins below

"------------------------ Basic Plugins -----------------------

Plugin 'VundleVim/Vundle.vim'                   " Plugin Manager
Plugin 'morhetz/gruvbox'                        " Color Scheme
Plugin 'NLKNguyen/papercolor-theme'             " Color Scheme - Materal Design 
Plugin 'itchyny/lightline.vim'                  " Botton Status Bar
Plugin 'itchyny/vim-gitbranch'                  " lightline uses it
Plugin 'mhinz/vim-signify'                      " VCS - git, svn diff 
Plugin 'scrooloose/nerdtree.git'                " CLI File Manager 
Plugin 'Nopik/vim-nerdtree-direnter'            " Fix dir opening in new tab on enter if let g:NERDTreeMapOpenInTab='<ENTER>'
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
Plugin 'tpope/vim-sensible'                     " Default configs everyone can agree on

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
" Plugin 'myitcv/govim'                           " new plugin for go written in go feature > vim-go
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }       " go support; https://github.com/fatih/vim-go-tutorial
"Plugin 'jodosha/vim-godebug'                   " go debugger in split screen with delve CLI - only for neovim; TODO: check later
Plugin 'janko-m/vim-test'                       " polyglot test runner

call vundle#end()                               " stop - all plugins above


"============= Plugin Configs

set hlsearch                                    " highlight search patterns
" colorscheme gruvbox                             " set colorscheme
" set background=dark                             " set bg color
colorscheme PaperColor                             " set colorscheme
set background=light                             " set bg color
" set column limit/line length limit
execute 'set colorcolumn='.MAX_LINE_COL         

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
      \ 'colorscheme': 'PaperColor',  
      \ }
" g:lighline.colorscheme: if PaperColor installed & enabled

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>

" open files in new tab - DIR FIX: see plugins
let g:NERDTreeMapOpenInTab='<ENTER>'

" Customize the settings for vim-template plugin
let g:email = "toran.sahu@yahoo.com"
let g:user = "Toran Sahu"

" nerd commenter setting
filetype plugin on                                      " turn on filetype, plugin detection
let g:NERDSpaceDelims = 1                               " put a space 
let g:NERDCustomDelimiters = {'python': {'left': '#'}}  " to fix double space issue with g:NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'


" vim-jedi (disable)
" let g:jedi#completions_enabled = 1

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
let g:ale_linters = {'python': ['flake8', ], 'go': ['gopls', ],}
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
let g:go_fmt_command = "goimports"    "[disabled] Run goimports along gofmt on each save
let g:go_auto_type_info = 0           "[disabled] Automatically get signature/type info for object under cursor
" automatically prompt autocompletion on typing dot (.) 
" behind the scene Ctrl x, ctrl o 
" au filetype go inoremap <buffer> . .<C-x><C-o>  


"gopls based configs
" need to do `go get -u -v golang.org/x/tools/gopls`
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'


"================govim config=============
set mouse=a

" To get hover working in the terminal we need to set ttymouse. See
"
" :help ttymouse
"
" for the appropriate setting for your terminal. Note that despite the
" automated tests using xterm as the terminal, a setting of ttymouse=xterm
" does not work correctly beyond a certain column number (citation needed)
" hence we use ttymouse=sgr
set ttymouse=sgr

" Suggestion: By default, govim populates the quickfix window with diagnostics
" reported by gopls after a period of inactivity, the time period being
" defined by updatetime (help updatetime). Here we suggest a short updatetime
" time in order that govim/Vim are more responsive/IDE-like
set updatetime=500

" Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
" balloondelay
set balloondelay=250

"================vim-run <F4>=============== 
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"autocmd filetype java nnoremap <Leader>c :w <CR>:!javac % :r&& java %:r<CR>
" TODO: F4
autocmd filetype java nnoremap <Leader>c :w <CR>:!javac % :r&& java %:r<CR>
"autocmd filetype php nnoremap <Leader>c :w <CR>:!clear && php  %<CR>
" TODO: F4
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


"============= Cheatsheet ===========
" ----MOTION----
" all the below movements can be preceded by a count; e.g. 4j moves down 4 lines
"
" h   move one character left
" j   move one row down
" k   move one row up
" l   move one character right
" w   move to beginning of next word
" b   move to previous beginning of word
" e   move to end of word
" W   move to beginning of next word after a whitespace
" B   move to beginning of previous word before a whitespace
" E   move to end of word before a whitespace
"
" 0   move to beginning of line
" $   move to end of line
" _   move to first non-blank character of the line
" g_  move to last non-blank character of the line
" 
" gg  move to first line
" G   move to last line
" ngg move to n'th line of file (n is a number; 12gg moves to line 12)
" H   move to top of screen
" M   move to middle of screen
" L   move to bottom of screen
" zz  scroll the line with the cursor to the center of the screen
" zt  scroll the line with the cursor to the top
" zb  scroll the line with the cursor to the bottom

" Ctrl-d  move half-page down
" Ctrl-u  move half-page up
" Ctrl-b  page up  TODO: conflict with ctrl+b - go to definition
" Ctrl-f  page down  TODO: conflict with ctrl+f - fzf find string
" Ctrl-o  jump to last (older) cursor position
" Ctrl-i  jump to next cursor position (after Ctrl-O)
" Ctrl-y  move view pane up
" Ctrl-e  move view pane down
 
" n   next matching search pattern
" N   previous matching search pattern
" *   next whole word under cursor
" #   previous whole word under cursor
" g*  next matching search (not whole word) pattern under cursor
" g#  previous matching search (not whole word) pattern under cursor
" gd  go to definition/first occurrence of the word under cursor
" %   jump to matching bracket { } [ ] ( )
" fX  to next 'X' after cursor, in the same line (X is any character)
" FX  to previous 'X' before cursor (f and F put the cursor on X)
" tX  til next 'X' (similar to above, but cursor is before X)
" TX  til previous 'X'
" ;   repeat above, in same direction
" ,   repeat above, in reverse eadirection
"
" ----UTILS----
" visual select + U     convert to upper case
" visual select + u     convert to lower case
" 
" Without using a visual selection, gU<motion> will make the characters in motion uppercase, or use gu<motion> for lowercase.
" ~    : Changes the case of current character
" guu  : Change current line from upper to lower.
" gUU  : Change current LINE from lower to upper.
" guw  : Change to end of current WORD from upper to lower.
" guaw : Change all of current WORD to lower.
" gUw  : Change to end of current WORD from lower to upper.
" gUaw : Change all of current WORD to upper.
" g~~  : Invert case to entire line
" guG : Change to lowercase until the end of document.
"
" ----MACRO----
" qd 	start recording to register d
" ... 	your complex series of commands
" q 	stop recording
" @d 	execute your macro
" @@ 	execute your macro again 
" 4@d 	execute your macro 4 times 
