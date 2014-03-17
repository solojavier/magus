" This remaps easymotion to show us only the left
" hand home row keys as navigation options which 
" may mean more typing to get to a particular spot
" but it'll all be isolated to one area of the keyboard

let g:EasyMotion_keys = 'asdfghjklqwertyuiopcvbn'
let g:EasyMotion_use_upper = 1

" keep cursor column
let g:EasyMotion_startofline = 0

" Don't skip folded line
let g:EasyMotion_skipfoldedline = 0

" Jump to first with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

" Highlight cursor
let g:EasyMotion_cursor_highlight = 1

" Extend search
map  :/ <Plug>(easymotion-sn)
xmap :/ <Esc><Plug>(easymotion-sn)\v%V
omap :/ <Plug>(easymotion-tn)
nmap :n <Plug>(easymotion-sn)<C-p>
map ;N <Plug>(easymotion-bd-n)

" Replace defaut
" smart f & F / t & T
omap f <Plug>(easymotion-bd-fl)
xmap f <Plug>(easymotion-bd-fl)
nmap f <Plug>(easymotion-bd-fl)
omap t <Plug>(easymotion-bd-tl)
xmap t <Plug>(easymotion-bd-tl)
nmap t <Plug>(easymotion-bd-tl)

" Anywhere!
map <Space><Space> <Plug>(easymotion-jumptoanywhere)

" Extend hjkl
map <Space>h <Plug>(easymotion-linebackward)
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
map <Space>l <Plug>(easymotion-lineforward)

" Use ths Theme for The colors.
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen

