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

" loads the directories "vim/ftdetect" and "vim/ftplugin"
filetype plugin on
