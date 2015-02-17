# path, the 0 in the filename causes this to load first
export PATH=$PATH:$HOME/.magus/bin:$HOME/.magus/bin/magus

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Mac uses GNU Core Utilities, they're MUCH better.
if [[ `uname` == 'Darwin'  ]]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi
