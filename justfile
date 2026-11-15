# List available recipes
default:
    @just --list

# Apply local chezmoi changes
apply:
    @chezmoi apply

# Pull latest dotfiles from GitHub and apply
update:
    @chezmoi update

# Preview changes without applying
dry-run:
    @chezmoi apply --dry-run --verbose

# Install missing Homebrew packages and mise tools
install:
    @brew bundle --global
    @mise install

# Reinstall all Homebrew packages and mise tools from scratch
reinstall:
    @brew bundle --global --force
    @mise install --force

# Uninstall all Homebrew packages/casks and mise tools from this dotfiles
uninstall:
    @brew bundle uninstall --force
    @mise uninstall --all
