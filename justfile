# List available recipes
default:
    @just --list

# Apply local chezmoi changes
apply:
    chezmoi apply

# Pull latest dotfiles and apply
update:
    chezmoi update

# Edit dotfiles source
edit:
    chezmoi edit

# Re-run install scripts after changing Brewfile or mise config
install:
    brew bundle --global
    mise install
