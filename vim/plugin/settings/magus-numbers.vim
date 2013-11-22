" Relative Numbers Toggle
"
" We don't enable automatic switching, mainly beacuse depending on your
" computer performance may decrease, slowing down you down.
"
"
function! RelativeNumbersOn()
  set relativenumber
endfunc

function! RelativeNumbersOff()
  set norelativenumber
endfunc

function! NumberToggle()
  if(&relativenumber == 1)
    call RelativeNumbersOff()
    autocmd! User AcSmoothScrollEnter
    autocmd! User AcSmoothScrollLeave
  else
    call RelativeNumbersOn()
    autocmd User AcSmoothScrollEnter call RelativeNumbersOff()
    autocmd User AcSmoothScrollLeave call RelativeNumbersOn()
  endif
endfunc

" (r)ejative number Toggle
nnoremap <leader>r :call NumberToggle()<cr>
