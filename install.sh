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

check_deps(){
    DEPS=$(cat "$SCRIPTPATH/dependencies")
    REQDEPS=""
    for DEP in $DEPS
    do
        STATUS=$(dpkg-query -W -f=\${Status} 2>&1 "$DEP")
        if [ "$STATUS" != "install ok installed" ]
        then
            REQDEPS="$REQDEPS $DEP"
        fi
    done
    if [ "$REQDEPS" == "" ]
    then
        return "0"
    else
        error_and_die "$INITCMDERR: Dependencies $REQDEPS not found. Run \`$SCRIPTPATH/install-deps.sh\` to install them."
    fi
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

#Check dependencies
echo -e "$INITCMD: Checking dependencies..."
check_deps || exit 1
echo -e "$INITCMD: Checking dependencies...done."

cd ~/.vim/

#Get submodules
echo -e "$INITCMD: Getting plugins..."
git submodule update --init --recursive || exit 1
echo -e "$INITCMD: Getting plugins...done."

#Symlink vimrc, nvim, nvimrc
symlink "$HOME/.vim/vimrc" "$HOME/.vimrc" "$HOME/.dotfiles/vim/vimrc"
symlink "$HOME/.vim" "$HOME/.nvim" "$HOME/.dotfiles/nvim"
symlink "$HOME/.vim/vimrc" "$HOME/.nvimrc" "$HOME/dotsfiles/vim/vimrc"

#Build ycm
echo -e "$INITCMD: Building YouCompleteMe..."
cd "$HOME/.vim/bundle/YouCompleteMe" || exit 1
./install.py --clang-completer || error_and_die "$INITCMDERR: Failed to build YouCompleteMe."
echo -e "$INITCMD: Building YouCompleteMe...done."

