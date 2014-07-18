#!/bin/sh

die(){
	echo "$1"
	exit 1
}

[ -e ~/.vimrc ] && die "You already have a ~/.vimrc. If you want to continue delete it manually."

cd ~/.vim/

echo "Getting vim plugins..."
git submodule update --init

echo "Getting .vimrc in place..."
ln -s ~/.vim/vimrc ~/.vimrc

echo "Done!"

