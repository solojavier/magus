# path, the 0 in the filename causes this to load first
export PATH=$PATH:$HOME/.magus/bin:$HOME/.magus/bin/magus

# Mac uses GNU Core Utilities, they're MUCH better.
if [[ `uname` == 'Darwin'  ]]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi
