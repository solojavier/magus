let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  let g:gist_clip_command = 'pbcopy'
elseif os == 'Linux'
  let g:gist_clip_command = 'xclip -selection clipboard'
else
  let g:gist_clip_command = 'putclip'
endif

let g:gist_show_privates = 1
let g:gist_get_multiplefile = 1
