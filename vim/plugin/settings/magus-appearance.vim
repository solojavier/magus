" Make it beautiful - colors and fonts

" http://ethanschoonover.com/solarized/vim-colors-solarized
colorscheme solarized
set background=dark
set guifont=PragmataPro:h16,Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17

" Set the window minimum height
let &winheight = &lines * 2 / 10

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  " Line Highlight
  set cursorline
  " Column Rulers 80 being the "alriht, watch out" and 100 the "stahp!"
  set colorcolumn=80,100
else
  "dont load csapprox if we no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1
endif

