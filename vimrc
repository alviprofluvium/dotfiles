"Vundle Plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'

call vundle#end()
filetype plugin indent on
"End Vundle

"Configurations
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

"Airline
set laststatus=2
let g:airline_powerline_fonts = 1

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
