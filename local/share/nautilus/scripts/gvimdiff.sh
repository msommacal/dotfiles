#!/usr/bin/env bash

export GVIMINIT="set nocp | source $HOME/.config/vim/gvimrc"
export VIMINIT="set nocp | source $HOME/.config/vim/vimrc"

gvimdiff $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS
