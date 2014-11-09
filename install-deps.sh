#!/bin/bash

#Get script variables
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
INITCMD="\e[0;94m$0\e[0m"
DEPS=$(echo $(cat "$SCRIPTPATH/dependencies"))

#Install dependencies
echo -e "$INITCMD: Installing dependencies..."
apt-get install $DEPS || exit 1
echo -e "$INITCMD: Installing dependencies...done."

