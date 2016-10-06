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
Plugin 'junegunn/fzf'
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

"Remaps
inoremap jj <ESC>

"Configurations
set noshowmode
set wildmenu
set hlsearch
set tw=80

"Swap file directory
set backupdir^=~/.vim/backup_files//
set directory^=~/.vim/swap_files//
set undodir^=~/.vim/undo_files//

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
set completeopt=menuone,menu,preview

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
let g:SuperTabDefaultCompletionType = "context"
autocmd FileType * 
      \if &omnifunc != '' |
      \call SuperTabChain(&omnifunc, "<c-p>") |
      \call SuperTabSetDefaultCompletionType("<c-x><c-o>") |
      \endif

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

"Neocomplete
let g:acp_enableAtStartup = 0
"let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_pattern = '\*ku\*'
let g:neocomplete#enable_auto_select = 1

inoremap <expr><C-g> neocompete#undo_completion()
inoremap <expr><C-g> neocompete#complete_common_string()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


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
