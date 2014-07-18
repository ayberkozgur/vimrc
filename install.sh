#!/bin/sh

die(){
	echo "$1"
	exit 1
}

[ -e ~/.vimrc ] && die "You already have a ~/.vimrc. If you want to continue delete it manually."

cd ~/.vim/

echo "Getting plugins..."
git submodule update --init --recursive

echo "Getting .vimrc in place..."
ln -s ~/.vim/vimrc ~/.vimrc

echo "Compiling YouCompleteMe..."
cd ~/.vim/bundle/YouCompleteMe
mkdir build
cd build
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs -j5
cd ..
rm -rf build

echo "Done!"

