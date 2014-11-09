#!/bin/bash

error_and_die(){
    >&2 echo -e $1
    exit 1
}

build_ycm(){
    RETVAL=0

    #Try to create build directory
    rm -rf build/ || return 1
    mkdir build/ || return 1
    cd build/
    if [ "$?" -ne "0" ]
    then
        rmdir build/
        return 1
    fi

    #Build
    cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . "$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp" || RETVAL=1
    make ycm_support_libs -j5 || RETVAL=1

    #Cleanup build directory
    cd .. || RETVAL=1
    rm -rf build/ || RETVAL=1

    return "$RETVAL"
}

#Color output
INITCMD="\e[0;94m$0\e[0m"

#Get -f argument
if [ "$1" == "-f" ]
then
    LNARG="-f"
fi

cd ~/.vim/

#Get submodules
echo -e "$INITCMD: Getting plugins..."
git submodule update --init --recursive || exit 1
echo -e "$INITCMD: Getting plugins...done."

#Symlink ~/.vimrc
echo -e "$INITCMD: Getting ~/.vimrc in place..."
ln -s $LNARG "$HOME/.vim/vimrc" "$HOME/.vimrc"
if [ "$?" -ne "0" ]
then
    if [ "$(readlink -f "$HOME/.vimrc")" == "$HOME/.vim/vimrc" ]
    then
        echo -e "$INITCMD: ~/.vimrc is already installed, skipping."
    else
        error_and_die "$INITCMD: ~/.vimrc already exists as something else; run with -f to overwrite target files"
    fi
fi
echo -e "$INITCMD: Getting ~/.vimrc in place...done."

#Build ycm
echo -e "$INITCMD: Building YouCompleteMe..."
cd "$HOME/.vim/bundle/YouCompleteMe" || exit 1
build_ycm || error_and_die "$INITCMD: Failed to build YouCompleteMe."
echo -e "$INITCMD: Building YouCompleteMe...done."

