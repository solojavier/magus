#!/bin/sh

if [ ! -d "$HOME/.magus" ]; then
    echo "Installing YADR for the first time"
    git clone git@github.com:MarioRicalde/magus.git "$HOME/.magus"
    cd "$HOME/.magus"
    [ "$1" == "ask" ] && export ASK="true"
    rake install
else
    echo "Magus is already installed"
fi
