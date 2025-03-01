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

call plug#begin()

" List your plugins here
Plug 'ghifarit53/tokyonight-vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'tribela/vim-transparent'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'

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
colorscheme catppuccin_mocha

" Set space as leader key
let mapleader=" "

" To escape normal mode
inoremap jk <Esc>

" Deselect the search highlight
nnoremap <Leader>h :nohlsearch<CR>

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

