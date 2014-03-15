set laststatus=2

" Enable the Powerline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#branch#symbol = ' '
let g:airline#extensions#readonly#symbol = ''
let g:airline_linecolumn_prefix = '␤ '
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2

" Remove the utf-8[unix]
let g:airline_section_y=""
