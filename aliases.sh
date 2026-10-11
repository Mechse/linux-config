# Shell shortcuts. Sourced from ~/.bashrc (and ~/.zshrc) by install.sh.
# Add your own below, then run `reload` or open a new shell.

# Basics
alias c='clear'
alias ll='ls -lh --color=auto'
alias la='ls -lAh --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias h='history'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# System
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ports='ss -tulpn'

# Git
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate -20'
alias gp='git pull'

# Re-read this file after editing it
alias reload='. "${LINUX_CONFIG_DIR}/aliases.sh"'
