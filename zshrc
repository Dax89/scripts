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
#export ANTIGEN_AUTO_CONFIG=false
source .zsh/antigen.zsh

#export ALIEN_THEME="soft"
export USE_NERD_FONT=1

antigen use oh-my-zsh

antigen bundle <<EOBUNDLES 
	git
	vim-interaction
	command-not-found
	zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen theme eendroroy/alien alien
antigen apply

# End of Antigen

