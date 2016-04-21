#!/bin/bash
cd ~
INSTALL_DIR=~/.local/bin
DOTFILES_DIR=~/code/dotfiles
ln -s $DOTFILES_DIR/.bash_aliases
ln -s $DOTFILES_DIR/.git-completion.sh
ln -s $DOTFILES_DIR/.git-prompt.sh
ln -s $DOTFILES_DIR/.gitconfig
ln -s $DOTFILES_DIR/.gitignore_global
mkdir -p "$INSTALL_DIR"
ln -s "$DOTFILES_DIR/.local/bin/bashmarks.sh" "$INSTALL_DIR/"
. ~/.bashrc