" New split will appear at the bottom.
set splitbelow
" New split will appear the right.
set splitright
" Timout wait for <leader> keys
set timeoutlen=250
if has("gui_running")
  " Disable the scrollbars (NERDTree)
  set guioptions-=r
  set guioptions-=L

  " Disable the macvim toolbar
  set guioptions-=T
else
  " Prevent Vim from clobbering the scrollback buffer.
  set t_ti= t_te=
  " Syntax coloring lines that are too long just slows down the world
  set synmaxcol=250
  set lazyredraw
endif
