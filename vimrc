"Vundle Plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'sjl/tslime.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/fzf.vim'

"Scheme Plugins
Plugin 'vim-scripts/paredit.vim'
Plugin 'raymond-w-ko/vim-niji'

"Haskell Plugins
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'


call vundle#end()
filetype plugin indent on
"End Vundle

"Configurations
set noshowmode
set wildmenu
set hlsearch
set tw=80

"Colors
syntax enable
set background=dark
colorscheme solarized

set number
set relativenumber

"Indentation
set shiftwidth=2
set softtabstop=2
set expandtab
set smartcase
set smarttab
set smartindent
set autoindent

set incsearch
set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu

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
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Supertab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
    if has("unix")
        inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
    endif
endif

"Tslime
let g:tslime_normal_mapping = '<leader>t'
let g:tslime_visual_mapping = '<leader>t'
let g:tslime_vars_mapping = '<leader>T'
let g:tslime_ensure_trailing_newlines = 1

"Lisp Identation
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt

"Haskell
"ghc-mod
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

"neco-ghc
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"Tabularize
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>



"Niji
"let g:niji_dark_colours = [
"    \ [ '81', '#5fd7ff'],
"    \ [ '99', '#875fff'],
"    \ [ '1',  '#dc322f'],
"    \ [ '76', '#5fd700'],
"    \ [ '3',  '#b58900'],
"    \ [ '2',  '#859900'],
"    \ [ '6',  '#2aa198'],
"    \ [ '4',  '#268bd2'],
"    \ ]
