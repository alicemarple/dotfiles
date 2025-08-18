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

Plug 'ghifarit53/tokyonight-vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'tribela/vim-transparent'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
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

colorscheme catppuccin_mocha

let g:netrw_banner = 0
let mapleader=" "

inoremap jk <Esc>
nnoremap <Leader>nh :nohlsearch<CR>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <Leader>as ggVG
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>sg :Rg<CR>
nnoremap <Leader>ee :Ex<CR>

