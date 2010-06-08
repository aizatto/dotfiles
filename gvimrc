colorscheme twilight
set go-=T
set columns=87
set lines=95

function Fullscreen()
  set columns=187
endfunction
command! Fullscreen :call Fullscreen()

function Halfscreen()
  set columns=87
endfunction
command! Halfscreen :call Halfscreen()

function Halfscreen15()
  set columns=100
endfunction
command! Halfscreen15 :call Halfscreen15()

map <D-`> :maca _cycleWindows:<CR>
map <D-~> :maca _cycleWindowsBackwards:<CR>

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
