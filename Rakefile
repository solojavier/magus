require 'rake'
require 'fileutils'
require File.join(File.dirname(__FILE__), 'bin', 'yadr', 'neobundle')

desc "Hook our dotfiles into system-standard positions."
task :install => [:submodule_init, :submodules] do
  puts
  puts "======================================================"
  puts "Welcome to Magus Installation. (Powered by YADR)"
  puts "======================================================"
  puts

  install_homebrew if RUBY_PLATFORM.downcase.include?("darwin")
  install_with_apt_get if RUBY_PLATFORM.downcase.include?("linux")
  install_rvm_binstubs

  # this has all the runcoms from this directory.
  if want_to_install?('git configs (color, aliases)')
    file_operation(Dir.glob('git/*'))
    run %{ git config --global core.excludesfile ~/.gitignore }
    run %{ mkdir ~/.git_template }
  end

  file_operation(Dir.glob('irb/*')) if want_to_install?('irb/pry configs (more colorful)')
  file_operation(Dir.glob('ruby/*')) if want_to_install?('rubygems config (faster/no docs)')
  run %{gem install tmuxinator html2haml} if want_to_install?('required gems')
  file_operation(Dir.glob('ctags/*')) if want_to_install?('ctags config (better js/ruby support)')
  file_operation(Dir.glob('tmux/*')) if want_to_install?('tmux config')
  file_operation(Dir.glob('vimify/*')) if want_to_install?('vimification of command line tools')

  Rake::Task["install_prezto"].execute

  install_fonts if RUBY_PLATFORM.downcase.include?("darwin")

  install_term_theme if RUBY_PLATFORM.downcase.include?("darwin")

  if want_to_install?('vim configuration (highly recommended)')
    file_operation(Dir.glob('{vim,vimrc}'))
    Rake::Task["install_neobundle"].execute
  end

  run_bundle_config

  success_msg("installed")
end

task :install_prezto do
  if want_to_install?('zsh enhancements & prezto')
    install_prezto
  end
end

task :update do
  Rake::Task["install"].execute
  #TODO: for now, we do the same as install. But it would be nice
  #not to clobber zsh files
end

task :submodule_init do
  unless ENV["SKIP_SUBMODULES"]
    run %{ git submodule update --init --recursive }
  end
end

desc "Init and update submodules."
task :submodules do
  unless ENV["SKIP_SUBMODULES"]
    puts "======================================================"
    puts "Downloading Magus submodules...please wait"
    puts "======================================================"

    run %{
      cd $HOME/.magus
      git submodule update --recursive
      git clean -df
    }
    puts
  end
end

desc "Runs NeoBundle installer in a clean vim environment"
task :install_neobundle do
  puts "======================================================"
  puts "Installing NeoBundle."
  puts "The installer will now proceed to run NeoBundleInstall."
  puts "Due to a bug, the installer may report some errors"
  puts "when installing the plugin 'syntastic'. Fortunately"
  puts "Syntastic will install and work properly despite the"
  puts "errors so please just ignore them and let's hope for"
  puts "an update that fixes the problem!"
  puts "======================================================"

  puts ""

  run %{
    cd $HOME/.magus
    git clone https://github.com/Shougo/neobundle.vim #{File.join('vim','bundle', 'neobundle.vim')}
  }

  NeoBundle::update_neobundle
end

task :default => 'install'


private
def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def number_of_cores
  if RUBY_PLATFORM.downcase.include?("darwin")
    cores = run %{ sysctl -n hw.ncpu }
  else
    cores = run %{ nproc }
  end
  puts
  cores.to_i
end

def run_bundle_config
  return unless system("which bundle")

  bundler_jobs = number_of_cores - 1
  puts "======================================================"
  puts "Configuring Bundlers for parallel gem installation"
  puts "======================================================"
  run %{ bundle config --global jobs #{bundler_jobs} }
  puts
end

def install_rvm_binstubs
  puts "======================================================"
  puts "Installing RVM Bundler support. Never have to type"
  puts "bundle exec again! Please use bundle --binstubs and RVM"
  puts "will automatically use those bins after cd'ing into dir."
  puts "======================================================"
  run %{ chmod +x $rvm_path/hooks/after_cd_bundler }
  puts
end

def install_homebrew
  run %{which brew}
  unless $?.success?
    puts "======================================================"
    puts "Installing Homebrew, the OSX package manager...If it's"
    puts "already installed, this will do nothing."
    puts "======================================================"
    run %{ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"}
  end

  puts
  puts
  puts "======================================================"
  puts "Updating Homebrew."
  puts "======================================================"
  run %{brew update}
  puts
  puts
  puts "======================================================"
  puts "Installing Homebrew packages...There may be some warnings."
  puts "======================================================"
  puts
  puts "Installing zsh ..."
  run %{brew install zsh}
  puts
  puts "Installing ctags ..."
  run %{brew install ctags}
  puts
  puts "Installing git ..."
  run %{brew install git}
  puts
  puts "Installing ghi ..."
  run %{brew install ghi}
  puts
  puts "Installing hub ..."
  run %{brew install hub}
  puts
  puts "Installing tmux ..."
  run %{brew install tmux}
  puts
  puts "Installing reattach-to-user-namespace ..."
  run %{brew install reattach-to-user-namespace}
  puts
  puts "Installing the_silver_searcher ..."
  run %{brew install the_silver_searcher}
  puts
  puts "Installing fasd ..."
  run %{brew install fasd}
  puts
  puts "Installing jslint ..."
  run %{brew install jslint}
  puts
  puts "Installing GNU Core Utilities ..."
  run %{brew install coreutils}
  puts
  patch=`mvim --version | grep -n '1-\\d' | awk '{print $3}'`.gsub(/\d-/, "").to_i
  if patch <= 885
    puts "Installing macvim-edge ..."
    run %{ brew uninstall macvim }
    run %{ brew install macvim --with-cscope --with-lua --HEAD }
  end
  puts
  puts
end

def install_with_apt_get
  run %{which apt-get}
  if $?.success?
    puts
    puts
    puts "======================================================"
    puts "Installing packages..."
    puts "======================================================"
    puts
    puts "Installing zsh ..."
    run %{sudo apt-get install zsh}
    puts
    puts "Installing ctags ..."
    run %{sudo apt-get install ctags}
    puts
    puts "Installing git ..."
    run %{sudo apt-get install git}
    puts
    puts "Installing ghi ..."
    run %{sudo apt-get install ghi}
    puts
    puts "Installing tmux ..."
    run %{sudo apt-get install tmux}
    puts
    puts "Installing the_silver_searcher ..."
    run %{ sudo apt-get install silversearcher-ag  }
    puts
    puts "Installing fasd ..."
    run %{wget https://github.com/clvv/fasd/archive/1.0.1.tar.gz }
    run %{tar xvfz ~/.magus/1.0.1.tar.gz }
    run %{cd ~/.magus/fasd-1.0.1; sudo make install }
    run %{rm -rf fasd-1.0.1 }
    run %{rm 1.0.1.tar.gz }
    puts
    puts "Installing jslint ..."
    run %{ wget http://www.javascriptlint.com/download/jsl-0.3.0-src.tar.gz }
    run %{ tar xvfz ~/.magus/jsl-0.3.0-src.tar.gz }
    run %{ cd ~/.magus/jsl-0.3.0/src/; make -f Makefile.ref }
    run %{ sudo cp ~/.magus/jsl-0.3.0/src/Linux_All_DBG.OBJ/jsl /usr/local/bin/jsl }
    run %{ rm jsl-0.3.0-src.tar.gz }
    run %{ rm -rf jsl-0.3.0 }
    puts
    puts "Installing vim-edge ..."
    run %{ sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial }
    run %{ sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common }
    run %{
      sudo apt-get install liblua5.1-dev;
      sudo mkdir /usr/include/lua5.1/include/;
      sudo cp /usr/include/lua5.1/* /usr/include/lua5.1/include/;
      sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.1.so /usr/local/lib/liblua.so;
    }
    run %{ hg clone https://code.google.com/p/vim/ ~/.magus/vim-src }
    run %{
      cd ~/.magus/vim-src;
      ./configure --with-features=huge \
        --enable-perlinterp \
        --enable-rubyinterp \
        --enable-pythoninterp=yes \
        --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
        --enable-multibyte \
        --enable-fontset \
        --enable-gui=gtk2 \
        --disable-netbeans \
        --enable-luainterp=yes \
        --with-lua-prefix=/usr/include/lua5.1 \
        --enable-cscope \
        --enable-largefile \
        --prefix=/usr;
      make VIMRUNTIMEDIR=/usr/share/vim/vim74;
      sudo make install;
    }
    run %{ rm -rf ~/.magus/vim-src }
  end
  puts
  puts
end

def install_fonts
  puts "======================================================"
  puts "Installing patched fonts for Powerline."
  puts "======================================================"
  run %{ cp -f $HOME/.magus/fonts/* $HOME/Library/Fonts }
  puts
end

def install_term_theme
  puts "======================================================"
  puts "iTerm Setup"
  puts "======================================================"

  # If iTerm2 is not installed or has never run we can't do anything.
  if !File.exists?(File.join(ENV['HOME'], '/Library/Preferences/com.googlecode.iterm2.plist'))
    puts "======================================================"
    puts "iTerm2 is not installed or has not been open, please "
    puts "try again."
    puts "======================================================"
    return
  end

  # Make sure that the user configures iTerm correctly.
  # You can't modify iTerm2 plist on the fly with iTerm open, so yeah, not much we can do.
  while true do
    break unless %x{ defaults read ~/Library/Preferences/com.googlecode.iterm2.plist | grep "LoadPrefsFromCustomFolder = 1" }.empty?
    puts ""
    puts "Please complete the following steps:"
    puts " 1. Open iTerm Preferences > General "
    puts " 2. In the bottom Left, enable the checkbox that reads"
    puts "    'Load Preferneces from a Custom Folder'"
    puts " 3. Click the input and Add the following path: "
    puts "      ~/.magus/iTerm2/"
    puts " 4. Close the Preferences Window."
    puts " "
    break unless ask('The steps above have not been completed yet, should I check again? [y] or [n]')
  end
end

def ask(message)
  puts message
  return true if STDIN.gets.chomp == 'y'
  return false
end

def install_prezto
  puts
  puts "Installing Prezto (ZSH Enhancements)..."

  run %{ ln -nfs "$HOME/.yadr/zsh/prezto" "${ZDOTDIR:-$HOME}/.zprezto" }

  # The prezto runcoms are only going to be installed if zprezto has never been installed
  file_operation(Dir.glob('zsh/prezto/runcoms/z*'), :copy)

  puts
  puts "Overriding prezto ~/.zpreztorc with Magus's zpreztorc to enable additional modules..."
  run %{ ln -nfs "$HOME/.magus/zsh/prezto-override/zpreztorc" "${ZDOTDIR:-$HOME}/.zpreztorc" }

  puts
  puts "Creating directories for your customizations"
  run %{ mkdir -p $HOME/.zsh.before }
  run %{ mkdir -p $HOME/.zsh.after }
  run %{ mkdir -p $HOME/.zsh.prompts }

  if ENV["SHELL"].include? 'zsh' then
    puts "Zsh is already configured as your shell of choice. Restart your session to load the new settings"
  else
    puts "Setting zsh as your default shell"
    run %{ chsh -s /bin/zsh }
  end
end

def want_to_install? (section)
  if ENV["ASK"]=="true"
    puts "Would you like to install configuration files for: #{section}? [y]es, [n]o"
    STDIN.gets.chomp == 'y'
  else
    true
  end
end

def file_operation(files, method = :symlink)
  files.each do |f|
    file = f.split('/').last
    source = "#{ENV["PWD"]}/#{f}"
    target = "#{ENV["HOME"]}/.#{file}"

    puts "======================#{file}=============================="
    puts "Source: #{source}"
    puts "Target: #{target}"

    if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    if method == :symlink
      run %{ ln -nfs "#{source}" "#{target}" }
    else
      run %{ cp -f "#{source}" "#{target}" }
    end

    # Temporary solution until we find a way to allow customization
    # This modifies zshrc to load all of Magus's zsh extensions.
    # Eventually Magus's zsh extensions should be ported to prezto modules.
    if file == 'zshrc'
      File.open(target, 'a') do |zshrc|
        zshrc.puts('for config_file ($HOME/.magus/zsh/*.zsh) source $config_file')
      end
    end

    puts "=========================================================="
    puts
  end
end

def list_vim_submodules
  result=`git submodule -q foreach 'echo $name"||"\`git remote -v | awk "END{print \\\\\$2}"\`'`.select{ |line| line =~ /^vim.bundle/ }.map{ |line| line.split('||') }
  Hash[*result.flatten]
end

def success_msg(action)
  puts ""
  puts "`MMb     dMM'                                     "
  puts " MMM.   ,PMM   Like Janus, but with more Magic!   "
  puts " M`Mb   d'MM    ___     __     ___   ___   ____   "
  puts " M YM. ,P MM  6MMMMb   6MMbMMM `MM    MM  6MMMMb\ "
  puts " M `Mb d' MM 8M'  `Mb 6M'`Mb    MM    MM MM'    ` "
  puts " M  YM.P  MM     ,oMM MM  MM    MM    MM YM.      "
  puts " M  `Mb'  MM ,6MM9'MM YM.,M9    MM    MM  YMMMMb  "
  puts " M   YP   MM MM'   MM  YMM9     MM    MM      `Mb "
  puts " M   `'   MM MM.  ,MM (M        YM.   MM L    ,MM "
  puts "_M_      _MM_`YMMM9'Yb.YMMMMb.   YMMM9MM_MYMMMM9  "
  puts "                      6M    Yb                    "
  puts "                      YM.   d9   Powered by YADR  "
  puts "                       YMMMM9                     "
  puts ""
  puts "Magus has been #{action}. Please restart your terminal and vim."
end
