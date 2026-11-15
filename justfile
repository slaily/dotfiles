default:
    @just --list

apply:
    @chezmoi apply

update:
    @chezmoi update

dry:
    @chezmoi apply --dry-run --verbose

status:
    @chezmoi status

install-tools:
    @brew bundle --global
    @mise install
