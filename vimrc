"Vundle Plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'sjl/tslime.vim'
Plugin 'vim-scripts/paredit.vim'


call vundle#end()
filetype plugin indent on
"End Vundle

"Configurations
set noshowmode
set wildmenu
set hlsearch
"Colors
syntax enable
set background=dark
colorscheme solarized

set number
set relativenumber

"Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Lightline
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'component': {
    \   'readonly': '%{&readonly?"":""}',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Tslime
let g:tslime_normal_mapping = '<leader>t'
let g:tslime_visual_mapping = '<leader>t'
let g:tslime_vars_mapping = '<leader>T'
let g:tslime_ensure_trailing_newlines = 1

"Lisp Identation
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt
