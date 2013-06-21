let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Search for the whole path.
let g:ctrlp_by_filename = 0

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlP<CR>

" Additional mapping for buffer search
nnoremap <silent> ,b :CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'to [something]'
map ,tm :CtrlP app/models<CR>
map ,tc :CtrlP app/controllers<CR>
map ,tv :CtrlP app/views<CR>
map ,th :CtrlP app/helpers<CR>
map ,tl :CtrlP lib<CR>
map ,tp :CtrlP public<CR>
map ,ts :CtrlP spec<CR>
map ,tf :CtrlP fast_spec<CR>
map ,td :CtrlP db<CR>
map ,tC :CtrlP config<CR>
map ,tV :CtrlP vendor<CR>
map ,tF :CtrlP factories<CR>
map ,tT :CtrlP test<CR>

"Cmd-Shift-(M)ethod - jump to a method (tag in current file)
"Ctrl-m is not good - it overrides behavior of Enter
nnoremap <silent> <D-M> :CtrlPBufTag<CR>
