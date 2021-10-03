if has('filetype')
  filetype indent plugin on
endif

if has('sylax')
    syntax on               " Enable colored.
endif

" Edition settings
set showcmd             " Show (partial) command in status line.
set title               " Enable title bar.
set showmatch           " Show matching brackets.
set number              " Enable number line
set scrolloff=5         " Lines to keep above and below the cursor.
set laststatus=2        " Always display the status bar.
set linebreak           " Avoid wrapping a line in the middle of a word.
set wildmenu            " Display command line’s tab complete options as a menu.
set visualbell          " Flash the screan instead for beeping no errors.
set nocompatible        " Disenable comaptibili with vi.
set background=dark     " Set dark theme.
set autoindent          " Auto insert
set laststatus=2        " Always display the status line, even if only one window is displayed.

" Searching settings
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hlsearch            " Enable hight ligth search

" Mouse setings
set mouse=a             " Enable mouse usage (all modes)

" Cash file setings
set noswapfile
set nowrap

let g:rainbow_active = 1
