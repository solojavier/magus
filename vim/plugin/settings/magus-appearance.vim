" Make it beautiful - colors and fonts

" http://www.vim.org/scripts/script.php?script_id=2536
colorscheme lucius
LuciusBlack

set cursorline

set guifont=PragmataPro:h16,Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17

" Set the window minimum height
let &winheight = &lines * 2 / 10

" Quickly switch between color schemes.
command! ThemeLight LuciusLight
command! ThemeLightLowContrast LuciusLightLowContrast
command! ThemeWhite LuciusWhite
command! ThemeWhiteLowContrast LuciusWhiteLowContrast
command! ThemeDark LuciusDark
command! ThemeDarkHighContrast LuciusDarkHighContrast
command! ThemeDarkLowContrast LuciusDarkLowContrast
command! ThemeBlack LuciusBlack
command! ThemeBlackHighContrast LuciusBlackHighContrast
command! ThemeBlackLowContrast LuciusBlackLowContrast

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190
else
  "dont load csapprox if we no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1

    if has("mac")
      command! ThemeLight execute 'LuciusLight' | !echo -e '\033]50;SetProfile=LuciusLight\aColor Scheme Changed'
      command! ThemeLightLowContrast execute 'LuciusLightLowContrast' | !echo -e '\033]50;SetProfile=LuciusLightLowContrast\aColor Scheme Changed'
      command! ThemeWhite execute 'LuciusWhite' | !echo -e '\033]50;SetProfile=LuciusWhite\aColor Scheme Changed'
      command! ThemeWhiteLowContrast execute 'LuciusWhiteLowContrast' | !echo -e '\033]50;SetProfile=LuciusWhiteLowContrast\aColor Scheme Changed'
      command! ThemeDark execute 'LuciusDark' | !echo -e '\033]50;SetProfile=LuciusDark\aColor Scheme Changed'
      command! ThemeDarkHighContrast execute 'LuciusDarkHighContrast' | !echo -e '\033]50;SetProfile=LuciusDarkHighContrast\aColor Scheme Changed'
      command! ThemeDarkLowContrast execute 'LuciusDarkLowContrast' | !echo -e '\033]50;SetProfile=LuciusDarkLowContrast\aColor Scheme Changed'
      command! ThemeBlack execute 'LuciusBlack' | !echo -e '\033]50;SetProfile=LuciusBlack\aColor Scheme Changed'
      command! ThemeBlackHighContrast execute 'LuciusBlackHighContrast' | !echo -e '\033]50;SetProfile=LuciusBlackHighContrast\aColor Scheme Changed'
      command! ThemeBlackLowContrast execute 'LuciusBlackLowContrast' | !echo -e '\033]50;SetProfile=LuciusBlackLowContrast\aColor Scheme Changed'
    endif
endif

set fillchars+=vert:\ 
