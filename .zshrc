# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="./.dotfiles/aux.exclude/oh-my-zsh"

# THEME
ZSH_THEME="agnoster"

# Make non case sensitive
HYPHEN_INSENSITIVE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# MY UPDATES


# Enable Vim control in shell
bindkey -v
# Remap ESC key to "kj"
bindkey -M viins 'kj' vi-cmd-mode

# Autocomplete
autoload -U compinit add-zsh-hook
compinit

# Reload zsh cfg
alias reload!='RELOAD=1 source ~/.zshrc'

# Tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'

# FZF configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# Theme for powerline fonts
export TERM=xterm-256color
alias dotfiles='/usr/bin/git --git-dir=/home/brioche/.dotfiles/ --work-tree=/home/brioche'
