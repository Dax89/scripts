#! /bin/sh

function display_usage {
 printf "Usage:\n1) dotfiles.sh --sync\n2) dotfiles.sh --install\n"
}

function execute_sync {
 printf "Syncing files from $HOME...\n"
 cp $HOME/.vimrc vimrc
}

function execute_install {
 printf "Installing files to $HOME...\n"
 curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

 cp vimrc $HOME/.vimrc 
}


if [[ $EUID -eq 0 ]]; then
 echo "This script must NOT be run as root" 1>&2
 exit 1
fi

case "$1" in
 --sync) execute_sync
  ;;
 --install) execute_install
  ;;
 *) display_usage
  ;;
esac
