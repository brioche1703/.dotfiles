# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Make non case sensitive
HYPHEN_INSENSITIVE="true"

plugins=(git zshmarks)

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

# ZshMarks Bookmarks Alias
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"

# Theme
ZSH_THEME="robbyrussell"

#Git prompt
plugins=(
  git-prompt
)
