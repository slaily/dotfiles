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

# Clean Homebrew caches and run diagnostics
clean:
    @brew cleanup
    @brew doctor
