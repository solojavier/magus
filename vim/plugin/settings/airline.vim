" Enable the Powerline
if has("gui_running")
  let g:airline_powerline_fonts = 1
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline#extensions#branch#symbol = ' '
  let g:airline#extensions#readonly#symbol = ''
  let g:airline_linecolumn_prefix = '␤ '
else
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline#extensions#branch#symbol = ''
  let g:airline#extensions#readonly#symbol = ''
  let g:airline_linecolumn_prefix = ''
endif

" Remove the utf-8[unix]
let g:airline_section_y=""
