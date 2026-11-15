default:
    @just --list

apply:
    @chezmoi apply

update:
    @chezmoi update

dry-run:
    @chezmoi apply --dry-run --verbose

install-tools:
    @brew bundle --global
    @mise install
