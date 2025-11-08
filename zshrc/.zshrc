export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias gits="git status"
alias gitd="git diff"
alias gitp="git pull"
alias fzfp="fzf -m --preview='bat -n --color=always {}'"

eval "$(pyenv init --path)"
eval "$(starship init zsh)"

. "$HOME/.local/bin/env"
