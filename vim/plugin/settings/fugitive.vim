" fugitive.git
" ========================================
" For fugitive.git, dp means :diffput. Define dg to mean :diffget
nnoremap <silent> ,dg :diffget<CR>
nnoremap <silent> ,dp :diffput<CR>

" Git
nnoremap <leader>g :Git

" Branch (b)
nnoremap <leader>gb  :Git branch
nnoremap <leader>gbc :Git checkout -b
nnoremap <leader>gbl :Git branch -v
nnoremap <leader>gbL :Git branch -av
nnoremap <leader>gbx :Git branch -d
nnoremap <leader>gbX :Git branch -D
nnoremap <leader>gbm :Git branch -m
nnoremap <leader>gbM :Git branch -M
nnoremap <leader>gbs :Git show-branch
nnoremap <leader>gbS :Git show-branch -a

" Commit (c)
nnoremap <leader>gc  :Gcommit<CR>
nnoremap <leader>gco :Git checkout
nnoremap <leader>gcs :Git show

" Fetch (f)
nnoremap <leader> gf :Git fetch<CR>

" Push (p)
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gpf :Git push --force<CR>

" Pull (pl)
nnoremap <leader>gpl :Git pull --rebase<CR>

" Stash (s)
nnoremap <leader>gs  :Git stash
nnoremap <leader>gsa :Git stash apply
nnoremap <leader>gsx :Git stash drop
nnoremap <leader>gsl :Git stash list

" Working Copy (w)
nnoremap <leader>gws :Gstatus<CR>
