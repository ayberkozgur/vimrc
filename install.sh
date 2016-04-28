#!/bin/bash

#Get script variables
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
INITCMD="\e[0;94m$0\e[0m"
INITCMDERR="\e[0;31m$0\e[0m"

error_and_die(){
    >&2 echo -e $1
    exit 1
}

symlink(){
    FROM=$1
    TO=$2
    POSSIBLY_FROM=$3

    echo -e "$INITCMD: Getting $TO in place..."
    ln -s $LNARG $FROM $TO
    if [ "$?" -ne "0" ]
    then
        if [ "$(readlink -f $TO)" == $FROM -o "$(readlink -f $TO)" == $POSSIBLY_FROM ]
        then
            echo -e "$INITCMD: $TO is already installed, skipping."
        else
            error_and_die "$INITCMDERR: $TO already exists as something else; run with -f to overwrite target files"
        fi
    fi
    echo -e "$INITCMD: Getting $TO in place...done."
}

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

#Symlink vimrc, nvim, nvimrc
symlink "$HOME/.vim/vimrc" "$HOME/.vimrc" "$HOME/.dotfiles/vim/vimrc"
symlink "$HOME/.vim" "$HOME/.nvim" "$HOME/.dotfiles/nvim"
symlink "$HOME/.vim/vimrc" "$HOME/.nvimrc" "$HOME/dotsfiles/vim/vimrc"
