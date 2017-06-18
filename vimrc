set nocompatible              " be iMproved, required
syntax on
filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elzr/vim-json'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'isRuslan/vim-es6'
Plugin 'elixir-lang/vim-elixir'
Plugin 'jparise/vim-graphql'
Plugin 'digitaltoad/vim-jade'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'editorconfig/editorconfig-vim'

" Above is required for vundle

execute pathogen#infect()

source ~/.vim/typos.vim                 " Common typos and abbreviations

" == Settings
" For an overview of options see :help options-list
set backspace=indent,eol,start " more powerful backspacing
set backupext=.backup          " Backup Extension
set formatoptions=qroct        " Format options
set hlsearch                   " Highlight search results
set incsearch                  " Enable Incremental Seach ( Search as you type )
set noautowrite                " Disable Autowrite
set nobackup                   " Disable Backup
set nocompatible               " Use Vim defaults instead of 100% vi compatibility
set nostartofline              " Do not jump to first character with page commands, i.e., keep the cursor in the current column.
set nowrap                     " Don't wrap
set number                     " Display the line number
set ruler                      " Display line and col #; cursor of the screen
set showmatch                  " Show matching brackets
set showmode                   " Show current mode
set expandtab                  " Use spaces instead of tabs
set visualbell                 " Screw sound, flash the screen instead
set shiftwidth=2               " Shiftwidth 
set tabstop=2                  " Number of spaces tabs should be converted to
set softtabstop=2
set smartindent                " Always indent my tabs when I enter a new line
set title                      " Set VIM to change the title
set titlestring=vim:\ %F       " Format the title
set mouse=a
set smarttab
set tags=tags;/                " keep going up a dir until you find a tags file
set tabpagemax=100
set nofoldenable " disable folds

" == Mapping 
" Open a CTAG in a new tab: http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" <CTRL>+TAB to cycle through tabs, seems to only work in GVIM
noremap <C-Tab> gt

" Create a new tab
noremap <C-W>tn :tabnew<CR>

"" Use <Ctrl>+N or <CTRL>+P to cycle through tabs:
nnoremap <C-N> gt
nnoremap <C-P> gT

" have <F1> prompt for a help topic, rather than displaying the introduction
" page, and have it do this from any mode:
nnoremap <F1> :help<Space>

" Disable Ex Mode!
nnoremap <S-Q> <Esc>

" For those quick fingers, which can't release the shift key.
nmap :W :w
nmap :Q :q

" When the space bar key is hit, go down 10 spaces
nmap <Space> 10j

set runtimepath+=$GOROOT/misc/vim

" https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_map = '<C-f>'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" https://github.com/kien/ctrlp.vim/issues/160
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" NERD Tree https://github.com/scrooloose/nerdtree
map <C-e> :NERDTreeToggle<CR>

" change these directories because some files may read the tempfiles that vim
" creates
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp
