#!/usr/bin/env bash
#

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p ~/Applications
mkdir -p ~/.config/nvim/autoload
mkdir -p ~/.config/nvim/plugin

cp $script_dir/files/isdark ~/Applications/.
cp $script_dir/files/darkmodesocket.vim ~/.config/nvim/autoload
cat $script_dir/files/autocmds.vim >> ~/.config/nvim/plugin/autocmds.vim 

echo "Don't forget to create the iTerm script!"
