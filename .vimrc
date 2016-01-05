"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" be iMproved, required by Vundle
set nocompatible

" Set to auto read when a file is changed from the outside
set autoread

" Set to auto write when you switch buffers, make it etc.
set autowrite

" Close scratch preview after completion is done
"autocmd CompleteDone * pclose

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Map enter to semicolon
nnoremap <CR> :

" Fast saving
nmap <leader>w :w!<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber
set nu

" visual autocomplete for command menu
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme solarized
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr

" Set text width
set tw=76

" Add color to text width limit
set colorcolumn=76

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap

" Highlight search matches
set hlsearch

" Remove trailing characters
autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Remap VIM - to last non-blank character
map - $

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Required by Vundle
filetype off

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'oblitum/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'Chiel92/vim-autoformat'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mrtazz/DoxygenToolkit.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'mhinz/vim-startify'
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_autoclose_preview_window_after_insertion = 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
""Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let the .git direcory be the root directory
let g:ctrl_working_path_mode = 'r'

" seach by filename
let g:ctrlp_by_filename = 1

" search the whole tree
let g:ctrlp_max_files = 80000
let g:ctrlp_max_depth = 40

" all files as hidden buffers
let g:ctrlp_open_multiple_files = 'ij'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o)$',
  \ }

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bs :CtrlPMRU<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffergator settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gutentags settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%{gutentags#statusline()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ultisnips settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => DoxygenToolkit settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easymotion settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader> <Plug>(easymotion-prefix)
