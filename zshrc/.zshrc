set -o vi

# Append to the history file, don't overwrite it
setopt APPEND_HISTORY
# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS
# Ignore all duplicates in the history
setopt HIST_IGNORE_ALL_DUPS

# Set the history size
HISTSIZE=5000
HISTFILESIZE=7000
HISTFILE=~/.zsh_history

# Paths
# Set the pyenv path
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Alias definitions.
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

eval "$(pyenv init --path)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval `ssh-agent`

# Add Homebrew to the PATH if it exists (Linux)
if [[ "$OSTYPE" == "linux-gnu"* && -d /home/linuxbrew/.linuxbrew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
