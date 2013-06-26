" Whoever claims to be noble must conduct himself nobly.
"
"" Arrows are not acceptable on Normal mode.
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Use Emacs keys rather than arrow keys or Home/End keys!
inoremap <C-a>  <Home>
inoremap <C-e>  <End>
inoremap <C-b>  <Left>
inoremap <C-f>  <Right>
inoremap <C-d>  <Delete>

" MacVim D-Arrows is bad!
let macvim_skip_cmd_opt_movement=1
