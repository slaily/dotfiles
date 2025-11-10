set -o vi

# Ignore all duplicates in the history
setopt HIST_IGNORE_ALL_DUPS
# Append to the history file, don't overwrite it
setopt APPEND_HISTORY

# Set the history size
HISTSIZE=1000
HISTFILESIZE=2000
HISTFILE=~/.zsh_history

# Paths
# Set the Oh My Zsh path
export ZSH="$HOME/.oh-my-zsh"
# Set the pyenv path
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Alias definitions.
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# Load Oh My Zsh
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  # Oh My Zsh plugins
  plugins=(zsh-autosuggestions)
  source $ZSH/oh-my-zsh.sh
fi

eval "$(pyenv init --path)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval `ssh-agent`
