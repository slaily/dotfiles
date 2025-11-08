export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"
alias gits="git status"
alias gitd="git diff"
alias gitp="git pull"

eval "$(pyenv init --path)"
eval "$(starship init zsh)"

. "$HOME/.local/bin/env"
