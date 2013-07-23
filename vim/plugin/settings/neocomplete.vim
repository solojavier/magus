let g:neocomplete#enable_at_startup     = 1

" No competin as we type, it's distracting.
let g:neocomplete#disable_auto_complete = 1

" Case Sensitive is imprtant to us.
let g:neocomplete#enable_ignore_case    = 0

" Append / to directory paths.
let g:neocomplete#enable_auto_delimiter = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" OmniCompletion like YouCompleteMe
let g:neocomplete#enable_refresh_always = 1

" Tab for NeoSnippets, NeoComplete and Normal use.
" Forward only, at this point in time NeoSnippet can't jump back: https://github.com/Shougo/neosnippet.vim/issues/92
imap <expr><TAB> <SID>check_back_space() ? "\<TAB>" :
      \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
      \ pumvisible() ? '<Down>' : neocomplete#start_manual_complete()

function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

" (C-jk) navigation
inoremap <expr><C-j>  pumvisible() ? "\<Down>" : "j"
inoremap <expr><C-k>  pumvisible() ? "\<Up>" : "k"

" (o) open
inoremap <expr><C-o> pumvisible() ? neocomplete#close_popup() : "o"

" (c) cancel
inoremap <expr><C-c> pumvisible() ? neocomplete#cancel_popup() : "q"

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

