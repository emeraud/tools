""""""""""""""""""""""""""""""""""""
" backup: disabled, scm handles it...
""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""
" indentation
""""""""""""""""""""""""""""""""""""
set expandtab           " enter spaces when tab is pressed
set tabstop=2           " nb spaces by tab
set softtabstop=2
set shiftwidth=2        " nb spaces for >>
set autoindent          " copy indent from current line when starting a new line

""""""""""""""""""""""""""""""""""""
" navigation
""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start    " backspace also removes all of these

""""""""""""""""""""""""""""""""""""
" search feature
""""""""""""""""""""""""""""""""""""
set ignorecase   " no case
set hlsearch     " highlight all matches

""""""""""""""""""""""""""""""""""""
" status line
""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

""""""""""""""""""""""""""""""""""""
" syntax
""""""""""""""""""""""""""""""""""""
syntax on   			" syntax highlighting
set showmatch     " highlight pairs '(' ')', etc...

""""""""""""""""""""""""""""""""""""
" tabs / splits
""""""""""""""""""""""""""""""""""""
set splitright
set splitbelow

""""""""""""""""""""""""""""""""""""
" typography
""""""""""""""""""""""""""""""""""""
set wrap          " display long line as multiple lines
set ruler         " show line and column number
set showcmd 			" show (partial) command in status line
set nu            " line numbers

""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""
" tComment: http://www.vim.org/scripts/script.php?script_id=1173
