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

  " quickly switch between color schemes.
  command Dark set background=dark
  command Light set background=light
else
  "dont load csapprox if we no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1

  " Quickly switch between color schemes.
  " You need to config your iTerm2 to use "Dark" and "Light" Color Scheme.
  command Dark set background=dark | !echo -e '\033]50;SetProfile=Dark\aColor Scheme Changed'
  command Light set background=light | !echo -e '\033]50;SetProfile=Light\aColor Scheme Changed'
endif

