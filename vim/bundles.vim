" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using neobundle plugin manager.
" Once you've updated the list of plugin, you can run neobundle update by issuing
" the command :NeoBundleInstall.
"
" IMPORTANT: If you want to add custom plugins without contributing back to
" the project use: ~/.magus/vim/.bundles.local
"

" Filetype off is required by neobundle
filetype off

set rtp+=~/.vim/bundle/neobundle.vim/

call neobundle#rc(expand('~/.vim/bundle/'))

" let NeoBundle manage NeoBundle (required)
NeoBundleFetch "Shougo/neobundle.vim"

" All Magus Bundles here

" Ruby, Rails, Rake...
NeoBundle "rking/vim-ruby-refactoring"
NeoBundle "tpope/vim-rails"
NeoBundle "tpope/vim-rake"
NeoBundle "vim-ruby/vim-ruby"
NeoBundle "vim-scripts/Specky"
NeoBundle "ck3g/vim-change-hash-syntax"
NeoBundle "tpope/vim-bundler"

" Other Languages
NeoBundle "hybridgroup/vim-html-escape"
NeoBundle "claco/jasmine.vim"
NeoBundle "digitaltoad/vim-jade"
NeoBundle "groenewege/vim-less"
NeoBundle "itspriddle/vim-jquery"
NeoBundle "jtratner/vim-flavored-markdown"
NeoBundle "kchmck/vim-coffee-script"
NeoBundle "AndrewRadev/vim-eco"
NeoBundle "nelstrom/vim-markdown-preview"
NeoBundle "slim-template/vim-slim"
NeoBundle "timcharper/textile.vim"
" NeoBundle "tpope/vim-haml"
NeoBundle "wavded/vim-stylus"
NeoBundle "vim-scripts/liquid.vim"
NeoBundle "iakio/smarty3.vim"
NeoBundle "nono/vim-handlebars"
NeoBundle "juvenn/mustache.vim"
NeoBundle "evanmiller/nginx-vim-syntax"
NeoBundle "miripiruni/CSScomb-for-Vim"
NeoBundle "pangloss/vim-javascript"
NeoBundle "jby/tmux.vim.git"
NeoBundle "JulesWang/css.vim"
NeoBundle "cakebaker/scss-syntax.vim"

" Git related...
NeoBundle "hybridgroup/vim-git-grep-rails-partial"
NeoBundle "MarioRicalde/gitv"
NeoBundle "mattn/gist-vim"
NeoBundle "tjennings/git-grep-vim"
NeoBundle "tpope/vim-fugitive"
NeoBundle "tpope/vim-git"
NeoBundle "mhinz/vim-signify"

" General text editing improvements...
NeoBundle "Lokaltog/vim-easymotion"
NeoBundle "AndrewRadev/splitjoin.vim"
NeoBundle "Raimondi/delimitMate"
NeoBundle "briandoll/change-inside-surroundings.vim"
NeoBundle "Shougo/neocomplete.vim"
NeoBundle "Shougo/neosnippet.vim"
NeoBundle "godlygeek/tabular"
NeoBundle "honza/vim-snippets"
NeoBundle "nelstrom/vim-visual-star-search"
NeoBundle "tomtom/tcomment_vim"
NeoBundle "vim-scripts/IndexedSearch"
NeoBundle "vim-scripts/camelcasemotion"
NeoBundle "vim-scripts/matchit.zip"
NeoBundle "tommcdo/vim-exchange"

" General vim improvements
" NeoBundle "vim-scripts/YankRing.vim"
NeoBundle "hybridgroup/greplace.vim"
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "bogado/file-line"
NeoBundle "jistr/vim-nerdtree-tabs"
NeoBundle "kien/ctrlp.vim"
NeoBundle "majutsushi/tagbar"
NeoBundle "mattn/webapi-vim"
NeoBundle "rking/ag.vim"
NeoBundle "scrooloose/nerdtree"
NeoBundle "scrooloose/syntastic"
NeoBundle "jlanzarotta/bufexplorer"
NeoBundle "sjl/gundo.vim"
NeoBundle "MarioRicalde/vim-qargs"
NeoBundle "tomtom/tlib_vim"
NeoBundle "tpope/vim-abolish"
NeoBundle "tpope/vim-endwise"
NeoBundle "tpope/vim-ragtag"
NeoBundle "tpope/vim-repeat"
NeoBundle "tpope/vim-surround"
NeoBundle "tpope/vim-unimpaired"
NeoBundle "vim-scripts/AnsiEsc.vim"
NeoBundle "vim-scripts/AutoTag"
NeoBundle "vim-scripts/lastpos.vim"
NeoBundle "vim-scripts/sudo.vim"
NeoBundle "xsunsmile/showmarks"
NeoBundle "Shougo/vimshell.vim"
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle "MarioRicalde/stab.vim"
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle "nelstrom/vim-visual-star-search"
NeoBundle "mattn/emmet-vim"
NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'chrisbra/NrrwRgn'

" Text objects
NeoBundle "austintaylor/vim-indentobject"
NeoBundle "bootleq/vim-textobj-rubysymbol"
NeoBundle "coderifous/textobj-word-column.vim"
NeoBundle "kana/vim-textobj-datetime"
NeoBundle "kana/vim-textobj-entire"
NeoBundle "kana/vim-textobj-function"
NeoBundle "kana/vim-textobj-user"
NeoBundle "lucapette/vim-textobj-underscore"
NeoBundle "nathanaelkane/vim-indent-guides"
NeoBundle "nelstrom/vim-textobj-rubyblock"
NeoBundle "thinca/vim-textobj-function-javascript"
NeoBundle "vim-scripts/argtextobj.vim"

" Cosmetics, color scheme, Powerline...
NeoBundle 'bling/vim-airline'
NeoBundle "chrisbra/color_highlight"
NeoBundle "vim-scripts/TagHighlight"
NeoBundle "bogado/file-line"
NeoBundle "MarioRicalde/vim-lucius"
NeoBundle "hybridgroup/vim-colors-solarized"

" Customization
" The plugins listed in ~/.vim/.bundles.local will be added here to
" allow the user to add vim plugins to Magus without the need for a fork.
if filereadable(expand("~/.magus/vim/.bundles.local"))
  source ~/.magus/vim/.bundles.local
endif

"Filetype plugin indent on is required by NeoBundle
filetype plugin indent on

" Installation check.
NeoBundleCheck
