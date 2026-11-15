# List available recipes
default:
    @just --list

# Apply local chezmoi changes
apply:
    @chezmoi apply

# Pull latest dotfiles and apply
update:
    @chezmoi update

# Preview changes without applying
dry-run:
    @chezmoi apply --dry-run --verbose

# Install Homebrew packages and mise tools
install-tools:
    @brew bundle --global
    @mise install

# Reinstall dotfiles-managed environment from Brewfile and mise config
install-env:
    @brew bundle --global --force
    @mise install --force
