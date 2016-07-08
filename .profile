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

# Pin Entry
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

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
  branch="$(git rev-parse --abbrev-ref HEAD)"
  if [ "$1" ]; then
    git push origin "$1" "$branch"
  else
    git push origin "$branch"
  fi
}

go () {
  git checkout "$1"
}

gob () {
  git checkout -b "$1"
}

# npm commands
alias ni="npm install"
alias nr="npm run"

# General shortcuts

# Long ls is long
alias la="ls -lah"
