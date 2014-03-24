" Enable soft-wrapping for text files
autocmd FileType text,markdown setlocal wrap linebreak nolist showbreak=…

function! Wrap()
  setlocal wrap linebreak nolist showbreak=…
endfunction

function! NoWrap()
  setlocal nowrap nolinebreak list showbreak=…
endfunction

command! -nargs=* Wrap call Wrap()
command! -nargs=* NoWrap call NoWrap()

