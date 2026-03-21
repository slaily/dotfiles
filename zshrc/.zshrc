# === Shell Options ===
set -o vi                      # Use vim keybindings in the terminal (Esc to enter normal mode)
unsetopt BEEP                  # No terminal sounds

# Quick escape: type 'jk' fast in insert mode to switch to normal mode
bindkey -M viins 'jk' vi-cmd-mode

# Word navigation with Ctrl+Arrow (bind in both vi insert and normal modes)
bindkey -M viins '^[[1;5D' backward-word    # Ctrl+Left  (insert mode)
bindkey -M viins '^[[1;5C' forward-word     # Ctrl+Right (insert mode)
bindkey -M vicmd '^[[1;5D' backward-word    # Ctrl+Left  (normal mode)
bindkey -M vicmd '^[[1;5C' forward-word     # Ctrl+Right (normal mode)
setopt APPEND_HISTORY HIST_FIND_NO_DUPS HIST_IGNORE_ALL_DUPS  # Cleaner history

# === History ===
HISTSIZE=100000                # Lines kept in memory
SAVEHIST=100000                # Lines saved to file
HISTFILE=~/.zsh_history

# === Environment & PATH ===
export PYENV_ROOT="$HOME/.pyenv"       # Python version manager location
export GOPATH="$HOME/go"               # Go workspace (go install puts binaries here)
export VIRTUAL_ENV_DISABLE_PROMPT=1    # Don't let venv modify prompt (starship handles it)

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# === OS-Specific Config ===
# macOS: Add Homebrew Ruby to PATH
# Linux: Initialize Linuxbrew if installed
if [[ "$OSTYPE" == darwin* ]]; then
    export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"
elif [[ "$OSTYPE" == linux-gnu* && -d /home/linuxbrew/.linuxbrew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# === Plugins (requires Homebrew) ===
# autosuggestions: Shows grayed-out command suggestions as you type (→ to accept)
# syntax-highlighting: Colors commands green/red based on validity
if command -v brew &>/dev/null; then
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# === Aliases ===
# Keep aliases in separate file for cleanliness. Edit ~/.zsh_aliases to add more.
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

# === Tool Initialization ===
eval "$(pyenv init - zsh)"     # Python version management (pyenv install 3.x, pyenv global 3.x)
eval "$(starship init zsh)"    # Fancy prompt - config at ~/.config/starship.toml
eval "$(zoxide init zsh)"      # Smart cd - use 'z' instead of 'cd' to jump to frequent dirs
eval "$(ssh-agent -s)" &>/dev/null
ssh-add ~/.ssh/id_github &>/dev/null  # Auto-load GitHub SSH key on shell start

# === Auto Virtual Environment ===
# Automatically activates Python venv when you cd into a project with .venv/ or venv/
# Deactivates when you leave. No more "source .venv/bin/activate" needed.
auto_venv_activate() {
    local dir="$PWD" venv=""

    # Walk up directory tree to find .venv or venv
    while [[ "$dir" != "/" ]]; do
        for name in .venv venv; do
            [[ -d "$dir/$name" ]] && venv="$dir/$name" && break 2  # break 2 = exit both loops
        done
        dir="${dir:h}"  # :h = parent directory (zsh syntax, like dirname)
    done

    # Activate if found and not already active
    if [[ -n "$venv" && "$VIRTUAL_ENV" != "$venv" ]]; then
        echo "🐍 Activated: ${venv/#$HOME/~}"  # ${x/#$HOME/~} = replace $HOME with ~ for display
        source "$venv/bin/activate"
    # Deactivate if we left a project with venv
    elif [[ -z "$venv" && -n "$VIRTUAL_ENV" ]]; then
        echo "🚫 Deactivated: ${VIRTUAL_ENV/#$HOME/~}"
        deactivate
    fi
}

# Hook the function to run on directory change and before each prompt
autoload -U add-zsh-hook
add-zsh-hook chpwd auto_venv_activate   # chpwd = "change pwd" - runs when you cd
add-zsh-hook precmd auto_venv_activate  # precmd = runs before prompt displays (catches first load)
