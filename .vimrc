" Make vim more useful, not vi-compatible
set nocompatible

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Set color schema and syntax
set t_Co=256
syntax on
if has('gui_running')
	set background=light
	colorscheme solarized
else
	set background=dark
	colorscheme desert256
endif

" Enabled later, after Pathogen
filetype off

" Make tabs as wide as two spaces and soft
set tabstop=2
set shiftwidth=2
set expandtab

" Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set lcs=tab:▸\ ,trail:·
set list

" Change mapleader
let mapleader=","

" set some junk
set ttyfast " Send more characters at a given time.
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set autoindent " Copy indent from last line when starting new line
set wildmenu " Enhance command-line completion
set number " Enable line numbers
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set noerrorbells " Disable error bells
set nostartofline " Don’t reset cursor to start of line when moving around
set ruler " Show the cursor position
set showcmd " Show the (partial) command as it’s being typed
set scrolloff=5 " Start scrolling three lines before the horizontal window border

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

call pathogen#infect()
filetype plugin indent on
