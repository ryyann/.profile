# Enable highlight colors
export CLICOLOR=1

# Use GREEN for username and YELLOW for absolut path
# ANSI escape sequences can be found here http://ascii-table.com/ansi-escape-sequences.php
export PS1="\[\e[1;32m\]\u \[\e[0;37m\]in \[\e[1;33m\]\w \[\e[0;37m\]🐕 💨  \[\e[0m\]"

# DVM
[[ -s "$(brew --prefix dvm)/dvm.sh" ]] && source "$(brew --prefix dvm)/dvm.sh"
[[ -r $DVM_DIR/bash_completion ]] && . $DVM_DIR/bash_completion

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Profile commands
prof () {
  vim ~/.profile
}

reprof () {
  . ~/.profile
}

# Git bash profile
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . "$(brew --prefix)/etc/bash_completion"
fi

# Git commands
alias g="git"
alias ga="git add"
alias gs="git status"
alias gh="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

gcm () {
  git commit -m "$*"
}

gpoc () {
  git push origin "$(git rev-parse --abbrev-ref HEAD)"
}

go () {
  git checkout "$1"
}

gob () {
  git checkout -b "$1"
}

# General shortcuts

# Long ls is long
alias la="ls -lah"
