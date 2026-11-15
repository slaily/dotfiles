# Dotfiles

macOS environment managed with chezmoi, Homebrew, mise, and atuin.

## Install

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install chezmoi
chezmoi init --apply https://github.com/slaily/dotfiles.git
exec zsh
```

## Daily use

```bash
chezmoi apply    # apply local changes
chezmoi update   # pull and apply
```

Or with just:

```bash
just apply
just update
just install
```

## What's where

- `dot_Brewfile` — Homebrew packages
- `dot_config/mise/config.toml` — mise tools
- `dot_zshrc` — shell config
- `.chezmoiscripts/` — automated setup
