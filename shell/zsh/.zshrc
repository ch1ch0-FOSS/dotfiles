# Zsh Configuration

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS

# Completion
autoload -U compinit && compinit

# Aliases
alias ll='ls -lah'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'

# Prompt
PS1='%n@%m:%~ $ '

