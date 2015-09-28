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
set statusline=%t       "tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=\ %r%{getcwd()}%h 
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


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
" theme
""""""""""""""""""""""""""""""""""""
set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans = 1 "fixes transparency when background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "normal"
colorscheme solarized

""""""""""""""""""""""""""""""""""""
" Plugins/themes:
""""""""""""""""""""""""""""""""""""
" tComment: http://www.vim.org/scripts/script.php?script_id=1173
" solarized: https://github.com/altercation/vim-colors-solarized
