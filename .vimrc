" ============ BASIC UI ============
set number              " Show absolute line numbers
set relativenumber      " Relative numbers for movement
set ruler               " Show cursor position
set cursorline          " Highlight current line
set showcmd             " Show incomplete commands
set showmatch           " Highlight matching braces
syntax on               " Enable syntax highlighting
colorscheme murphy      " Murphy scheme (built-in)

" ============ INDENTATION ============
set tabstop=4           " Width of a tab
set shiftwidth=4        " Width for autoindents
set expandtab           " Tabs become spaces
set smartindent         " Smart autoindenting

" ============ SEARCH ============
set ignorecase          " Ignore case when searching...
set smartcase           " ...unless uppercase used
set incsearch           " Highlight matches as you type
set hlsearch            " Highlight search matches

" Clear search highlight with <leader>h
nnoremap <leader>h :nohlsearch<CR>

" ============ STATUS LINE ============
set laststatus=2
set statusline=%f\ %h%m%r\ %=%-14.(%l,%c%V%)\ %P

" ============ NAVIGATION ============
" Use space as leader
let mapleader=" "

" Easy window movement
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Faster movement
nnoremap <C-j> 5j
nnoremap <C-k> 5k

" ============ FILE HANDLING ============
set autoread            " Reload file if changed on disk
set hidden              " Allow switching buffers without saving
set backupcopy=yes      " Prevents file permission issues

" ============ QUALITY OF LIFE ============
" Better completion
set wildmenu
set wildmode=longest:full,full

" Don’t wrap long lines
set nowrap
