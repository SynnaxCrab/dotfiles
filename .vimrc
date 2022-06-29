" set rtp+=/opt/homebrew/lib/python3.9/site-packages/powerline/bindings/vim

" Make backspace always work
set backspace=indent,eol,start

scriptencoding utf-8
set encoding=utf-8

" Make vim more useful, not vi-compatible
set nocompatible

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
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

highlight Pmenu ctermbg=gray guibg=gray

" map file highlights
if has("autocmd")
	au BufRead,BufNewFile *.ejs setfiletype html
	au BufRead,BufNewFile *.less setfiletype css
endif

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

filetype plugin indent on

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nnoremap <silent> <C-p> :FZF<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let js_fixers = ['prettier', 'eslint']
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': js_fixers,
\ 'javascript.jsx': js_fixers,
\ 'typescript': js_fixers,
\ 'typescriptreact': js_fixers,
\ 'css': ['prettier'],
\ 'json': ['prettier'],
\ 'rust': ['rustfmt'],
\}

let g:ale_linters = {
\ 'rust': ['analyzer'],
\}

let g:ale_sign_error = "🐛"
let g:ale_sign_warning = "⚠️"
let g:ale_sign_info = "ℹ"

autocmd FileType javascript map <buffer> <c-]> :ALEGoToDefinition<CR>
autocmd FileType typescript map <buffer> <c-]> :ALEGoToDefinition<CR>
autocmd FileType typescriptreact map <buffer> <c-]> :ALEGoToDefinition<CR>

let g:ale_hover_to_floating_preview = 1
nnoremap H :ALEHover<CR>
nnoremap <silent> gr :ALEFindReferences<CR>

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'rust-lang/rust.vim'
" Color schemas
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
call plug#end()

" Set color schema
if (has("termguicolors"))
  set termguicolors
endif

set t_Co=256
syntax on
if has('gui_running')
  set background=light
  colorscheme onehalflight
else
  set background=dark
" colorscheme desert256
" colorscheme nord
" colorscheme one
  colorscheme onehalfdark
endif
