" Corrected Code Blocks
syn match  mkdCode         /^\s*\n\(\(\s\{4,}[^ ]\|\t\t\+[^\t]\).*\n\)\+/

" Support 
syn keyword mkdTodo  FIXME NOTE TODO OPTIMIZE XXX todo
hi def link mkdTodo Todo
