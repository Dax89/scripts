# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/davide/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR='vim'

# Antigen
source ~/.zsh/antigen.zsh
antigen use oh-my-zsh

export SPACESHIP_GIT_SHOW=false

antigen bundle vim-interaction
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting 
antigen bundle zsh-users/zsh-autosuggestions

antigen theme denysdovhan/spaceship-prompt
antigen apply
# End of Antigen

