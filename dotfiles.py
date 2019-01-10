#! /bin/python3

from pathlib import Path
from argparse import ArgumentParser
from urllib import request
import shutil
import sys
import os

def download_file(url, file):
    with request.urlopen(url) as response:
        with open(file, "wb") as f:
            f.write(response.read())
            f.close()

def create_argparser():
    parser = ArgumentParser(description="DotFiles Manager")
    group = parser.add_mutually_exclusive_group()
    group.add_argument("--sync", action="store_true", help="Sync system to repository")
    group.add_argument("--install", action="store_true", help="Install repository to System")
    return parser

def execute_sync():
    homepath = Path.home()
    print("Syncing files from '" + str(homepath) + "' folder")
    shutil.copy(homepath / ".vimrc", "vimrc")
    shutil.copy(homepath / ".zshrc", "zshrc")

def execute_install():
    homepath = Path.home()
    print("Installing files to '" + str(homepath) + "' folder")

    # VIM
    vimautoloadpath = homepath / ".vim/autoload"
    os.makedirs(vimautoloadpath, exist_ok=True)
    download_file("https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim", vimautoloadpath / "plug.vim")
    shutil.copy("vimrc", homepath / ".vimrc")

    # ZSH
    zshpath = homepath / ".zsh"
    os.makedirs(zshpath, exist_ok=True)
    download_file("https://git.io/antigen", zshpath / "antigen.zsh")
    shutil.copy("zshrc", homepath / ".zshrc")

def main():
    parser = create_argparser()
    args = parser.parse_args()

    if args.sync:
        execute_sync()
    elif args.install:
        execute_install()
    else:
        parser.print_help()

if __name__ == "__main__":
    if os.getuid() == 0:
        print("'root' user cannot execute this script")
        sys.exit(1)

    main()
