
" ################### alpha ( V 1.2 )  ################### 

set number
set relativenumber
set laststatus=2
set noshowmode
syntax on
set tabstop=2
set termguicolors
set mouse=a
set hlsearch
set clipboard=unnamedplus


" ################### List your plugins here ################### 

call plug#begin()

Plug 'ghifarit53/tokyonight-vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'tribela/vim-transparent'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'

call plug#end()


let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

filetype plugin indent on

" Colorscheme
colorscheme catppuccin_mocha

" Set space as leader key
let mapleader=" "

" To escape normal mode
inoremap jk <Esc>

" Deselect the search highlight
nnoremap <Leader>hc :nohlsearch<CR>

" Move down while cursor is in middle of page
nnoremap <C-d> <C-d>zz

" Move up while cursor is in middle of page
nnoremap <C-u> <C-u>zz

" Save all buffers and exit
nnoremap <Leader>se :wqa<CR>

" Save all buffers
nnoremap <Leader>sb :wa<CR>

" Exit without saving
nnoremap <Leader>ef :q!<CR>

" For selecting whole file
nnoremap <Leader>sa ggVG

" Search Files
nnoremap <Leader>ff :Files<CR>

" Search keyword in files
nnoremap <Leader>ef :Rg<CR>


" ################### NerdTree ###################

" Open current File in NerdTree
nnoremap <leader>ee :NERDTreeFocus<CR>

" Open NerdTree 
nnoremap <Leader>n :NERDTree<CR>

" Toggle NerdTree
nnoremap <Leader>nt :NERDTreeToggle<CR>

" Find in NerdTree 
nnoremap <Leader>nf :NERDTreeFind<CR>
